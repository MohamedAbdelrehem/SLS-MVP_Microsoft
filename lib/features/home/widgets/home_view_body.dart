import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sls_mvp_microsoft/core/widgets/custom_container.dart';
import 'package:sls_mvp_microsoft/features/home/widgets/neumorphic_expenses/monthly_expenses_view.dart';
import 'package:sls_mvp_microsoft/features/monitoring/monitoring_view.dart';

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
              child: tableV(context: context),
            ),
          ),
        ],
      ),
    );
  }
}

class tableV extends StatelessWidget {
  const tableV({
    super.key,
    required this.context,
  });

  final BuildContext context;
  void _navigateToDetailsPage(String name, String age, String occupation) {
    context.goNamed('DetailsPage',
        pathParameters: {'name': name, 'age': age, 'occupation': occupation});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: Expanded(
              child: Text(
                'Name',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Age',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Role',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Age',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Age',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Age',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Age',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Age',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ],
        rows: <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(
                Text('BMW BUS 1'),
                onTap: () {
                  _navigateToDetailsPage('Sarah', '19', 'Student');
                },
              ),
              DataCell(Icon(Icons.power_settings_new, color: Colors.green)),
              DataCell(Text('10°c')),
              DataCell(Text('Student')),
              DataCell(Text('Student')),
              DataCell(Text('Student')),
              DataCell(Text('Student')),
              DataCell(Text('Student')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(
                Text('Ahmed'),
                onTap: () {
                  _navigateToDetailsPage('Ahmed', '19', 'Student');
                },
              ),
              DataCell(Text('19')),
              DataCell(Text('Student')),
              DataCell(Text('Student')),
              DataCell(Text('Student')),
              DataCell(Text('Student')),
              DataCell(Text('Student')),
              DataCell(Text('Student')),
            ],
          ),
        ],
      ),
    );
  }
}
