import 'package:flutter/material.dart';

import 'features/home_screen/widgets/appbar.dart';
import 'features/home_screen/widgets/body.dart';
import 'features/home_screen/widgets/bottom_bar.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 55),
            child: MyAppBar(),
          ),
          body: SingleChildScrollView(child: AppBody()),
          bottomNavigationBar: MyBottomBar(),
        ),
      ),
    );
  }
}
