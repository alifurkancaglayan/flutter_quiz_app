import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/constants.dart';
import 'package:flutter_quiz_app/controller/question_controller.dart';
import 'package:get/get.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          WebsafeSvg.asset(
            "assets/icons/bg.svg",
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              Spacer(),
              Text(
                "Score",
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      color: kSecondaryColor,
                    ),
              ),
              Spacer(),
              Text(
                "${_qnController.numOfCorrectAns * 10}/${_qnController.question.length * 10}",
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: kSecondaryColor,
                    ),
              ),
              Spacer(
                flex: 3,
              ),
            ],
          )
        ],
      ),
    );
  }
}
