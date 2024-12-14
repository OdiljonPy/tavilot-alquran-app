import 'package:flutter/material.dart';
import 'package:webview_windows/webview_windows.dart';

class WebViewPage extends StatefulWidget {
  final String url;

  const WebViewPage({super.key, required this.url});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final WebviewController controller = WebviewController();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeWebView();
  }

  Future<void> _initializeWebView() async {
    try {
      await controller.initialize();
      // await controller.setJavaScriptMode(JavaScriptMode.allow);
      await controller.setBackgroundColor(Colors.transparent);
      await controller.loadUrl(widget.url);
      controller.url.listen((url) {
        if (url.startsWith('https://uzmart')) {
          Navigator.pop(context, true);
          return;
        }
      });

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print('Failed to initialize WebView: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WebView Page"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Webview(controller),
    );
  }
}
