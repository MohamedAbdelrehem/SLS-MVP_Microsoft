
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sls_mvp_microsoft/features/home/view/widgets/add_car_view_body.dart';

class CarView extends StatelessWidget {
  const CarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        //back button
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // GoRouter.of(context).go('/home');
    context.pop();
              },
        ),
        title: Text('Add new vehicle',
            style: TextStyle(
                fontSize: 20,
                color: Colors.amber,
                fontWeight: FontWeight.bold)),
      ),
      body:const CarViewBody(),
    );
  }
}