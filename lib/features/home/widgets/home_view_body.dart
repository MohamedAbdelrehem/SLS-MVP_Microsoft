import 'package:flutter/material.dart';
import 'package:sls_mvp_microsoft/core/widgets/custom_container.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: CustomContainer(
              width: 300,
              height: 300,
              child: Container(),
            ),
          ),
        ),
      ],
    );
  }
}
