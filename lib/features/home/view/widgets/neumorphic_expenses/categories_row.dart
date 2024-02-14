import 'package:flutter/material.dart';
import 'package:sls_mvp_microsoft/features/home/view/widgets/neumorphic_expenses/pie_chart.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({super.key});

  // const CategoriesRow({
  //   Key key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          for (var category in kCategories)
            ExpenseCategory(
                text: category.name, index: kCategories.indexOf(category))
        ],
      ),
    );
  }
}

class ExpenseCategory extends StatelessWidget {
  // const ExpenseCategory({
  //   Key key,
  //   @required this.index,
  //   @required this.text,
  // }) : super(key: key);

  const ExpenseCategory({super.key, required this.index, required this.text});
  final int index;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: <Widget>[
          Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  kNeumorphicColors.elementAt(index % kNeumorphicColors.length),
            ),
          ),
          const SizedBox(width: 12),
          Text(text.capitalize()),
          Text(' : ${kCategories.elementAt(index).amount.toString()}',
              style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
