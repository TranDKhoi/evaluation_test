import 'package:evaluation_test/features/widgets/appbar.dart';
import 'package:evaluation_test/features/widgets/body.dart';
import 'package:flutter/material.dart';

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
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 60),
          child: MyAppBar(),
        ),
        body: SingleChildScrollView(child: AppBody()),
      ),
    );
  }
}
