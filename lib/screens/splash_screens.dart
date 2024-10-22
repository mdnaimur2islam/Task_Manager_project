import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskmanager/Utils/assets_path.dart';
import 'package:taskmanager/screens/sing_in_screen.dart';

import '../widget/screen_background.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({super.key});

  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveToNextScreen();
  }

  Future<void>_moveToNextScreen() async{
    await Future.delayed( Duration(seconds: 2));
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context)=> sing_in_screen()));
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ScreenBackground(
        child:  Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AssetsPath.logoSvg,
              width:120,
            )
          ],
                ),
        ),
      ),
    );
  }
}

