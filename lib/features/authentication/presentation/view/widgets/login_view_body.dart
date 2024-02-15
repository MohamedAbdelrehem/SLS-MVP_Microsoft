import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sls_mvp_microsoft/constants.dart';
import 'package:sls_mvp_microsoft/core/utils/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sls_mvp_microsoft/core/widgets/custom_loading_indicator.dart';
import 'package:sls_mvp_microsoft/core/widgets/custom_snack_bar.dart';
import 'package:sls_mvp_microsoft/features/authentication/presentation/view_model/auth_cubit/auth_cubit.dart';

final _emailaddressController = TextEditingController();
final _passwordController = TextEditingController();

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          showSnackBar(context, "invalid credentials");
        }
      },
      builder: (context, state) {
        if (state is LoginSuccess) {
          GoRouter.of(context).go('/home');
          // } else if (state is LoginFailure) {
          //   return const Text('there is an error',
          //       style: TextStyle(color: Colors.red, fontSize: 30));
        } else if (state is LoginLoading) {
          return const CustomLoadingIndicator();
        } else {
          return SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AssetsData.logo,
                      height: 130,
                      color: kPrimaryColor,
                    ),
                    const SizedBox(height: 20),
                    //welcome message
                    Text(
                      "Welcome Back!",
                      style: GoogleFonts.lobster(
                          fontSize: 40,
                          textStyle: const TextStyle(color: kSecondColor)),
                    ),
                    const SizedBox(height: 10),
                    //message

                    const Text(
                      "PEACE OF MIND, ON EVERY ROUTE. ✨",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: kSecondColor),
                    ),
                    const SizedBox(height: 50),

                    //Email Text Box
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: kSecondColor),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                            controller: _emailaddressController,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Email Address'),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    //password

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: kSecondColor),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                                border: InputBorder.none, hintText: 'Password'),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.00),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) {
                              //       return ForgotPasswordPage();
                              //     },
                              //   ),
                              // );
                            },
                            child: const Text("forgot password?",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),

                    //Sign in Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: InkWell(
                        //GestureDetector to InkWell for animation
                        onTap: () {
                          BlocProvider.of<AuthCubit>(context).loginUser(
                              _emailaddressController.text,
                              _passwordController.text);
                        },

                        child: Ink(
                          //Container to Ink for animation
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: const Center(
                            child: Text('Sign in',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),

                    //not a  member button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Not a member?',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).go('/register');
                          },
                          child: GestureDetector(
                            child: const Text(' Register Now',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold)),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 75),
                  ],
                ),
              ),
            ),
          );
        }
        return const Text('');
      },
    );
  }
}
