import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sls_mvp_microsoft/constants.dart';
import 'package:sls_mvp_microsoft/core/utils/assets.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: SvgPicture.asset(
              AssetsData.logoText,
              height: 50,
              color: kBGColor,
            ),
          );
        });
  }
}
