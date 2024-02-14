import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sls_mvp_microsoft/features/home/view/widgets/neumorphic_expenses/categories_row.dart';
import 'package:sls_mvp_microsoft/features/home/view/widgets/neumorphic_expenses/pie_chart_view.dart';

class TotalVehiclesPieChart extends StatelessWidget {
  const TotalVehiclesPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: height * 0.32,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20),
                  Text(
                    'Total Vehicles',
                    style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                  const Expanded(
                    child: Row(
                      children: [
                        CategoriesRow(),
                        PieChartView(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
