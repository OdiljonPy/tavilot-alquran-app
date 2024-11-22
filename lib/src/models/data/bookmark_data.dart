class Bookmark {
  final int id;
  final List<int> verseIds;

  Bookmark({required this.id, required this.verseIds});

  factory Bookmark.fromJson(Map<String, dynamic> json) {
    return Bookmark(
      id: json['id'],
      verseIds: List<int>.from(json['verse_id'].map((x) => x as int)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'verse_id': verseIds,
    };
  }
}