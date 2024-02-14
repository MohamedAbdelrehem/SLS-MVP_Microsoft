import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sls_mvp_microsoft/features/authentication/presentation/view/widgets/login_view_body.dart';
import 'package:sls_mvp_microsoft/features/authentication/presentation/view_model/auth_cubit/auth_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthCubit(),
        child: const LoginViewBody(),
      ),
    );
  }
}
