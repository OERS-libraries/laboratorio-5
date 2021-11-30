import 'package:example_app/constants/colors.dart';
import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  _Explore createState() => _Explore();
}

class _Explore extends State<Explore> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.transparent,
        child: Text("Explore"),
      ),
    );
  }
}