class Bookmark {
  final String name;
  final int id;
  final List<int> verseIds;

  Bookmark({required this.id, required this.verseIds, required this.name});

  factory Bookmark.fromJson(Map<String, dynamic> json) {
    return Bookmark(
      name: json['name'],
      id: json['id'],
      verseIds: List<int>.from(json['verse_id'].map((x) => x as int)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'verse_id': verseIds,
    };
  }
  Bookmark copyWith({String? name, int? id, List<int>? verseIds}) {
    return Bookmark(
      name: name ?? this.name,
      id: id ?? this.id,
      verseIds: verseIds ?? this.verseIds,
    );
  }
}