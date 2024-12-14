import 'package:auto_route/annotations.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform;
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:webview_windows/webview_windows.dart';
@RoutePage()
class YouTubePlayerPage extends StatefulWidget {
  final String videoUrl;

  const YouTubePlayerPage({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<YouTubePlayerPage> createState() => _YouTubePlayerPageState();
}

class _YouTubePlayerPageState extends State<YouTubePlayerPage> {
  late YoutubePlayerController _youtubeController;
  final WebviewController _webviewController = WebviewController();
  bool _isWindows = false;

  @override
  void initState() {
    super.initState();

    // Detect the platform
    _isWindows = defaultTargetPlatform == TargetPlatform.windows;

    if (_isWindows) {
      _initializeWebView();
    } else {
      _initializeYouTubePlayer();
    }
  }

  void _initializeYouTubePlayer() {
    final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl) ?? '';
    _youtubeController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  Future<void> _initializeWebView() async {
    await _webviewController.initialize();
    final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
    final embedUrl = 'https://www.youtube.com/embed/$videoId';
    await _webviewController.loadUrl(embedUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("YouTube Player")),
      body: _isWindows ? _buildWebView() : _buildYouTubePlayer(),
    );
  }

  Widget _buildYouTubePlayer() {
    return YoutubePlayer(
      controller: _youtubeController,
      showVideoProgressIndicator: true,
      onReady: () {
        print("YouTube Player is ready.");
      },
    );
  }

  Widget _buildWebView() {
    return Center(
      child: Webview(_webviewController),
    );
  }

  @override
  void dispose() {
    if (!_isWindows) {
      _youtubeController.dispose();
    }
    super.dispose();
  }
}
