import 'package:get/get.dart';

import '../../data/models/joke.dart';

class JokeController extends GetxController {
  //singleton
  JokeController._initInstance();
  static JokeController ins = JokeController._initInstance();

  List<Joke> joke = [Joke(content: "Loading")].obs;

  setJokeData(List<Joke> data) {
    joke = data;
  }
}
