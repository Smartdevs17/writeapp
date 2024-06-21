import 'dart:convert';

DocumentModel documentModelFromMap(String str) =>
    DocumentModel.fromMap(json.decode(str));

String documentModelToMap(DocumentModel data) => json.encode(data.toMap());

class DocumentModel {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String title;
  String content;
  String author;
  int count;
  int userId;

  DocumentModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.title,
    required this.content,
    required this.author,
    required this.count,
    required this.userId,
  });

  DocumentModel copyWith({
    int? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    String? title,
    String? content,
    String? author,
    int? count,
    int? userId,
  }) =>
      DocumentModel(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        title: title ?? this.title,
        content: content ?? this.content,
        author: author ?? this.author,
        count: count ?? this.count,
        userId: userId ?? this.userId,
      );

  factory DocumentModel.fromMap(Map<String, dynamic> json) => DocumentModel(
        id: json["ID"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        updatedAt: DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"],
        title: json["title"],
        content: json["content"],
        author: json["author"],
        count: json["count"],
        userId: json["UserID"],
      );

  Map<String, dynamic> toMap() => {
        "ID": id,
        "CreatedAt": createdAt.toIso8601String(),
        "UpdatedAt": updatedAt.toIso8601String(),
        "DeletedAt": deletedAt,
        "title": title,
        "content": content,
        "author": author,
        "count": count,
        "UserID": userId,
      };
}
