import 'package:flutter_example_app/src/common_widgets/screen_background.dart';
import 'package:flutter_example_app/src/features/universities/view/universities_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  static const routeName = 'Home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const ScreenBackground(
      child: material.Material(
        color: material.Colors.transparent,
        child: Universities(),
      ),
    );
  }
}
