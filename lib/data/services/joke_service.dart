import 'package:evaluation_test/app/values/string.dart';
import 'package:http/http.dart' as http;

class JokeService {
  JokeService._initInstance();

  static JokeService ins = JokeService._initInstance();

  Future<http.Response> getAllJoke() async {
    return await http.get(
      Uri.parse("$db_uri/joke"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }
}
