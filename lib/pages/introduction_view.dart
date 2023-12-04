import 'package:chatapp/utils/introduction_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionView extends StatelessWidget {
  const IntroductionView({super.key});

  get listPagesViewModel => ListPageViewModel().pages;

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: listPagesViewModel,
      globalBackgroundColor: Color.fromARGB(255, 242, 242, 242),
      showSkipButton: true,
      skip: const Icon(Icons.skip_next),
      next: const Text("Next"),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w700)),
      onDone: () => Get.toNamed('/Login'),
      onSkip: () => Get.toNamed('/Login'),
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        activeColor: Theme.of(context).colorScheme.secondary,
        color: Colors.black26,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
    );
  }
}
