import 'dart:convert';

class Joke {
  late String? content;
  late String? id;

  Joke({this.content, this.id});

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'content': content,
    };
  }

  factory Joke.fromJson(Map<String, dynamic> source) => Joke.fromMap(source);

  factory Joke.fromMap(Map<String, dynamic> map) {
    return Joke(
      content: map['content'] ?? '',
      id: map['_id'] ?? '',
    );
  }
}
