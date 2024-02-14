import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sls_mvp_microsoft/features/authentication/presentation/view/widgets/register_view_body.dart';
import 'package:sls_mvp_microsoft/features/authentication/presentation/view_model/auth_cubit/auth_cubit.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthCubit(),
        child: const RegisterViewBody(),
      ),
    );
  }
}
