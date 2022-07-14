import 'package:evaluation_test/app/controllers/index_controller.dart';
import 'package:evaluation_test/app/controllers/joke_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBody extends StatefulWidget {
  const AppBody({Key? key}) : super(key: key);

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        //GREEN BANNER
        Container(
          width: size.width,
          height: size.height / 5.8,
          decoration: const BoxDecoration(
            color: Color(0xff29B363),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50)
                .copyWith(top: 40, bottom: 30),
            child: Column(
              children: [
                Text(
                  "A joke a day keeps the doctor away",
                  style: TextStyle(
                      color: Colors.white, fontSize: size.height / 47),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    "If you joke wrong way, your teeth have to pay. (Serious)",
                    style: TextStyle(
                        color: Colors.white, fontSize: size.height / 70),
                  ),
                ),
              ],
            ),
          ),
        ),
        //JOKE FIELD
        Padding(
          padding: EdgeInsets.only(
              left: size.width / 15,
              top: size.height / 15,
              right: size.height / 20),
          child: Obx(
            () => Text(
              JokeController
                  .ins.joke[IndexController.ins.currentIndex.value].content!,
              style: TextStyle(
                  color: const Color(0xff7F7F7F),
                  fontSize: size.width / 28,
                  height: 1.3),
            ),
          ),
        ),
      ],
    );
  }
}
