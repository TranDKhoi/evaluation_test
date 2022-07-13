import 'package:evaluation_test/controllers/index_controller.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../values/jokes.dart';
import 'custom_button.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({Key? key}) : super(key: key);

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  late SharedPreferences prefs;

  var indexCtrlr = IndexController.ins;

  @override
  void initState() {
    getUserData();
    super.initState();
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
            indexCtrlr.currentIndex.value != jokeList.length - 1
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
                    onTap: () {
                      clearCookie();
                    },
                    title: "Clear Cookie!",
                    color: 0xffA6A6A6,
                  ),
            SizedBox(height: size.height / 15),
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
    //selection = 0 mean funny, 1 mean not funny

    if (indexCtrlr.currentIndex.value == jokeList.length - 1) {
      return;
    }
    setState(() {
      indexCtrlr.increaseIndex();
    });

    //save user's selection in local
    prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
        "voteResult", [indexCtrlr.currentIndex.value.toString(), selection]);
  }

  void clearCookie() async {
    prefs = await SharedPreferences.getInstance();
    prefs.clear();

    setState(() {
      indexCtrlr.currentIndex.value = 0;
    });
  }

  void getUserData() async {
    var prefs = await SharedPreferences.getInstance();
    List<String>? list = prefs.getStringList("voteResult");

    list == null
        ? indexCtrlr.currentIndex.value = 0
        : indexCtrlr.currentIndex.value = int.parse(list[0]);

    setState(() {});
  }
}
