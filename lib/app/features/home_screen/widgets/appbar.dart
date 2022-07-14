import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Row(
        children: [
          //COMPANY LOGO
          Image.asset(
            "assets/images/logo.png",
            width: size.width / 10,
            height: size.height / 10,
          ),
          const Spacer(),

          //USER NAME
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Handcrafted by",
                  style: TextStyle(
                      color: const Color(0xff969696),
                      fontSize: size.width / 45,
                      fontWeight: FontWeight.normal),
                ),
                Text(
                  "Khoi Tran",
                  style: TextStyle(
                      color: const Color(0xff4B4B4B),
                      fontSize: size.width / 45,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),

          const SizedBox(width: 5),
          //USER IMAGE
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/flower.jpg"),
          ),
        ],
      ),
    );
  }
}
