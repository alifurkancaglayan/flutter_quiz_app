import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/constants.dart';
import 'package:flutter_quiz_app/controller/question_controller.dart';
import 'package:flutter_quiz_app/models/Questions.dart';
import 'package:flutter_quiz_app/screens/quiz/components/progress_bar.dart';
import 'package:flutter_quiz_app/screens/quiz/components/question_card.dart';
import 'package:get/get.dart';
import 'package:websafe_svg/websafe_svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());

    return Stack(
      fit: StackFit.expand,
      children: [
        WebsafeSvg.asset(
          "assets/icons/bg.svg",
          fit: BoxFit.fill,
        ),
        SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                ),
                child: ProgressBar(),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                ),
                child: Obx(
                  () => Text.rich(
                    TextSpan(
                      text:
                          "Question ${_questionController.questionNumber.value}",
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: kSecondaryColor),
                      children: [
                        TextSpan(
                          text: "/${_questionController.question.length}",
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    color: kSecondaryColor,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 1.5,
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Expanded(
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _questionController.pageController,
                  onPageChanged: _questionController.updateTheQnNum,
                  itemCount: _questionController.question.length,
                  itemBuilder: (context, index) => QuestionCard(
                    question: _questionController.question[index],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
