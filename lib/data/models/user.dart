import 'dart:convert';

class User {
  late String? jokeId;
  late String? vote;
  late int? jokeIndex;

  User({this.jokeId, this.jokeIndex, this.vote});

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'jokeId': jokeId,
      'jokeIndex': jokeIndex,
      'vote': vote,
    };
  }

  factory User.fromJson(Map<String, dynamic> source) => User.fromMap(source);

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      jokeId: map['jokeId'] ?? '',
      jokeIndex: map['jokeIndex'] ?? '',
      vote: map['vote'] ?? '',
    );
  }
}
