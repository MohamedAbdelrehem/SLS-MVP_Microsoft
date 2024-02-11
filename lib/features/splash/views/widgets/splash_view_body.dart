import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sls_mvp_microsoft/constants.dart';
import 'package:sls_mvp_microsoft/core/utils/assets.dart';
import 'package:sls_mvp_microsoft/features/splash/views/widgets/sliding_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});
  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  late Animation<double> fadeAnimation; // Add fade animation

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    initFadeAnimation(); // Initialize fade animation

    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SvgPicture.asset(
          AssetsData.logo,
          height: 160,
          color: kBGColor,
        ),
        FadeTransition(
          opacity: fadeAnimation, // Apply fade animation to the widget
          child: SlidingText(slidingAnimation: slidingAnimation),
        ),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  void initFadeAnimation() {
    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn, // Use easeIn curve for smooth fade in
      ),
    );
  }

  void navigateToHome() {
    Future.delayed(const Duration(milliseconds: 1600), () {
      GoRouter.of(context).push('/login');
    });
  }
}
