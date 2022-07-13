import 'dart:async';

import 'package:evaluation_test/features/widgets/custom_button.dart';
import 'package:evaluation_test/values/jokes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBody extends StatefulWidget {
  const AppBody({Key? key}) : super(key: key);

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  int currentIndex = -1;
  late SharedPreferences prefs;

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return currentIndex == -1
        ? SizedBox(
            height: size.height,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
              ],
            ),
          )
        : Column(
            children: [
              //GREEN BANNER
              Container(
                width: size.width,
                height: size.height / 4,
                decoration: const BoxDecoration(
                  color: Colors.green,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "A joke a day keeps the doctor away",
                        style: TextStyle(
                            color: Colors.white, fontSize: size.width / 22),
                      ),
                      SizedBox(height: size.height / 25),
                      Text(
                        "If you joke wrong way, your teeth have to pay. (Serious)",
                        style: TextStyle(
                            color: Colors.white, fontSize: size.width / 32),
                      ),
                    ],
                  ),
                ),
              ),
              //JOKE FIELD
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child: Text(
                    key: ValueKey<int>(currentIndex),
                    jokeList[currentIndex],
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ),
              ),
              //Selection field
              currentIndex != jokeList.length - 1
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomButton(
                          onTap: () {
                            voteJoke("0");
                          },
                          title: "This is Funny!",
                          color: Colors.blue,
                        ),
                        CustomButton(
                          onTap: () {
                            voteJoke("1");
                          },
                          title: "This isn't Funny!",
                          color: Colors.green,
                        ),
                      ],
                    )
                  : CustomButton(
                      onTap: () {
                        clearCookie();
                      },
                      title: "Clear Cookie!",
                      color: Colors.grey,
                    )
            ],
          );
  }

  void voteJoke(String selection) async {
    //selection = 0 mean funny, 1 mean not funny

    if (currentIndex == jokeList.length - 1) {
      return;
    }
    setState(() {
      currentIndex++;
    });

    //save user's selection in local
    prefs = await SharedPreferences.getInstance();
    prefs.setStringList("voteResult", [currentIndex.toString(), selection]);
  }

  void clearCookie() async {
    prefs = await SharedPreferences.getInstance();
    prefs.clear();

    setState(() {
      currentIndex = 0;
    });
  }

  void getUserData() async {
    var prefs = await SharedPreferences.getInstance();
    List<String>? list = prefs.getStringList("voteResult");

    list == null ? currentIndex = 0 : currentIndex = int.parse(list[0]);

    //Just want to show the progress bar like call API
    Timer(const Duration(milliseconds: 3000), () {
      setState(() {});
    });
  }
}
