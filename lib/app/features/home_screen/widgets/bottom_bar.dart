import 'dart:convert';

import 'package:evaluation_test/app/controllers/joke_controller.dart';
import 'package:evaluation_test/app/utils/utils.dart';
import 'package:evaluation_test/data/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/joke.dart';
import '../../../../data/models/user.dart';
import '../../../../data/services/api_handler.dart';
import '../../../../data/services/joke_service.dart';
import '../../../controllers/index_controller.dart';
import 'custom_button.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({Key? key}) : super(key: key);

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  @override
  void initState() {
    super.initState();
    fetchJokeData();
    getUserData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: Wrap(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Selection field
            Obx(
              () {
                return IndexController.ins.currentIndex.value !=
                        JokeController.ins.joke.length - 1
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                            onTap: () {
                              voteJoke("0");
                            },
                            title: "This is Funny!",
                            color: 0xff2B7EDB,
                          ),
                          SizedBox(
                            width: size.height / 15,
                          ),
                          CustomButton(
                            onTap: () {
                              voteJoke("1");
                            },
                            title: "This is not funny.",
                            color: 0xff29B363,
                          ),
                        ],
                      )
                    : CustomButton(
                        onTap: () async {
                          clearCookie();
                        },
                        title: "Clear Cookie!",
                        color: 0xffA6A6A6,
                      );
              },
            ),
            SizedBox(height: size.height / 15),

            //bottom bar field
            Container(
              decoration: const BoxDecoration(
                  border:
                      Border(top: BorderSide(color: Colors.grey, width: 0.5))),
              child: Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.04, right: size.width * 0.03, top: 5),
                child: Text(
                  "This appis created as part of HLsolutions program. The materials con-tained on this websites are provided for general information only and do not constitute any form of advice. HLS assumes no responsibility for the accuracy of any particular statement and accepts no liability for any loss or damage which may arise from reliance on the infor-mation contained on this site.",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 10,
                    letterSpacing: 0.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Copyright 2021 HLS",
                style: TextStyle(color: Colors.grey[700], fontSize: 12),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ]),
    );
  }

  void voteJoke(String selection) async {
    //selection 0 mean funny, 1 mean not funny
    if (IndexController.ins.currentIndex.value ==
        JokeController.ins.joke.length - 1) {
      return;
    }
    IndexController.ins.increaseIndex();

    //call API to save user vote
    var user = User(
        jokeId:
            JokeController.ins.joke[IndexController.ins.currentIndex.value].id,
        jokeIndex: IndexController.ins.currentIndex.value,
        vote: selection);
    var res = await UserService.ins.voteJoke(context: context, user: user);
    ApiResponseHandler(
        res: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, "Voted!");
        },
        onFailed: () {
          showSnackBar(context, "Failed to vote");
        });
  }

  void clearCookie() async {
    var res = await UserService.ins.clearUserData();

    ApiResponseHandler(
        res: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, "You can now re-vote");
          IndexController.ins.currentIndex.value = 0;
        },
        onFailed: () {});
  }

  void getUserData() async {
    var res = await UserService.ins.getUserData();

    ApiResponseHandler(
        res: res,
        context: context,
        onSuccess: () {
          var user = User.fromJson(jsonDecode(res.body)["data"]);
          user == null
              ? IndexController.ins.currentIndex.value = 0
              : IndexController.ins.currentIndex.value = user.jokeIndex!;
        },
        onFailed: () {
          showSnackBar(context, "Can not get user data");
        });
  }

  void fetchJokeData() async {
    var res = await JokeService.ins.getAllJoke();

    ApiResponseHandler(
        res: res,
        context: context,
        onSuccess: () {
          List<dynamic> data = jsonDecode(res.body)["data"];
          if (data.isEmpty) {
            JokeController.ins.setJokeData([Joke(content: "Loading")]);
          } else {
            List<Joke> list = [];
            for (int i = 0; i < data.length; i++) {
              list.add(Joke.fromJson(data[i]));
            }
            JokeController.ins.setJokeData(list);
          }
        },
        onFailed: () {
          showSnackBar(context, "Can not get joke data");
        });
  }
}
