import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';

import '../../backend/local_storage.dart';
import '../../routes/routes.dart';
import '../auth/login/signin_screen.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Introduction> list = [
      Introduction(
        title: 'easy, quick & secure',
        subTitle:
            'minexcard has the most secure system which is very useful for money transaction,get ready to use unlimited virtual credit card system.',
        imageUrl: 'assets/clipart/pana.png',
        imageHeight: MediaQuery.of(context).size.height * 0.3,
        titleTextStyle: TextStyle(fontSize: 22, color: Color(0xff212020)),
        subTitleTextStyle: TextStyle(fontSize: 14, color: Color(0xff767575)),
      ),
      Introduction(
        title: 'create unlimited virtual card',
        subTitle:
            'minexcard has the most secure system which is very useful for money transaction,get ready to use unlimited virtual credit card system.',
        imageUrl: 'assets/clipart/rafiki.png',
        imageHeight: MediaQuery.of(context).size.height * 0.3,
        titleTextStyle: TextStyle(fontSize: 22, color: Color(0xff212020)),
        subTitleTextStyle: TextStyle(fontSize: 14, color: Color(0xff767575)),
      ),
      Introduction(
        title: 'choose you gift card',
        subTitle:
            'minexcard has the most secure system which is very useful for money transaction,get ready to use unlimited virtual credit card system.',
        imageUrl: 'assets/clipart/pana2.png',
        imageHeight: MediaQuery.of(context).size.height * 0.3,
        titleTextStyle: TextStyle(fontSize: 22, color: Color(0xff212020)),
        subTitleTextStyle: TextStyle(fontSize: 14, color: Color(0xff767575)),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: IntroScreenOnboarding(
        introductionList: list,
        onTapSkipButton: () {
          LocalStorage.saveOnboardDoneOrNot(isOnBoardDone: true);
          Get.to(RegisterChos());
        },
        // foregroundColor: Colors.red,
      ),
    );
  }
}
