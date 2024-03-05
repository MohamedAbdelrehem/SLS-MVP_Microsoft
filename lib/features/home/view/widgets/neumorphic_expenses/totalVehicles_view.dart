import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sls_mvp_microsoft/features/home/view/widgets/neumorphic_expenses/categories_row.dart';
import 'package:sls_mvp_microsoft/features/home/view/widgets/neumorphic_expenses/pie_chart_view.dart';

class TotalVehiclesPieChart extends StatelessWidget {
  const TotalVehiclesPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
        // final width = MediaQuery.of(context).size.width;

    return Column(
      children: <Widget>[
        SizedBox(
          height: height * 0.32,
          // width: width *0.7,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 20),
                Text(
                  'Total Vehicles',
                  style: GoogleFonts.rubik(
                      fontWeight: FontWeight.w400, fontSize: 20),
                ),
                const Expanded(
                  child: Row(
                    children: [
                      Expanded(child: CategoriesRow()),
                      Expanded(child: PieChartView()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
