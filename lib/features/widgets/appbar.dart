import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        children: [
          //COMPANY LOGO
          Image.asset(
            "assets/images/logo.png",
            width: size.width / 8,
            height: size.height / 8,
          ),
          const Spacer(),

          //USER NAME
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Handcrafted by",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: size.width / 35,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                "Khoi Tran",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: size.width / 30,
                    fontWeight: FontWeight.normal),
              ),
            ],
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
