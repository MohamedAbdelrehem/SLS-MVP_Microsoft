import 'package:flutter/material.dart';
import 'package:sls_mvp_microsoft/core/widgets/custom_container.dart';
import 'package:sls_mvp_microsoft/features/home/widgets/neumorphic_expenses/monthly_expenses_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(30),
            child: CustomContainer(
              width: 500,
              height: 380,
              child: MontlyExpensesView(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: CustomContainer(
              width: 500,
              height: 380,
              child: Container(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: CustomContainer(
              width: 500,
              height: 380,
              child: Container(),
            ),
          ),
        ],
      ),
    );
  }
}
