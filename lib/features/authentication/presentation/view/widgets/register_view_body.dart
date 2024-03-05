import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sls_mvp_microsoft/constants.dart';
import 'package:sls_mvp_microsoft/core/utils/assets.dart';
import 'package:sls_mvp_microsoft/core/widgets/custom_loading_indicator.dart';
import 'package:sls_mvp_microsoft/core/widgets/custom_snack_bar.dart';
import 'package:sls_mvp_microsoft/features/authentication/presentation/view/widgets/selectRoleRadio_widget.dart';
import 'package:sls_mvp_microsoft/features/authentication/presentation/view_model/auth_cubit/auth_cubit.dart';

final _emailController = TextEditingController();
final _passwordController = TextEditingController();
final _confirmpasswordController = TextEditingController();
// final _emailaddressController = TextEditingController();
final _firstNameController = TextEditingController();
final _lastNameController = TextEditingController();
final _managerCodeController = TextEditingController();

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterFailure) {
          showSnackBar(context, "weak password or email already exists");
        }        
        else if (state is RegisterSuccess) {
          GoRouter.of(context).go('/login');
          // }else if (state is RegisterFailure) {
          //   return const Text('there is an error',
          //       style: TextStyle(color: Colors.red, fontSize: 30));
        }  
      },
      builder: (context, state) {
if (state is RegisterLoading) {
          return const CustomLoadingIndicator();
        } else if(state is RegisterFailure || state is AuthInitial){
                    String selectedRole = '';
                    // bool enabled= true;
              void onRoleSelected(String role) {
                print('this is very important test but a new one $role');
    selectedRole = role;
    // if(selectedRole == 'Manager'){enabled= true;}else{enabled=false;}
  }
  //               void getCode(String codeee) {
  //   code = codeee;
  // }
          return SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    SvgPicture.asset(
                      AssetsData.logo,
                      height: 120,
                      color: kPrimaryColor,
                    ),
                    const SizedBox(height: 5),
                    //welcome message
                    Text(
                      "Hello there!",
                      style: GoogleFonts.lobster(
                          fontSize: 40,
                          textStyle: const TextStyle(color: kSecondColor)),
                    ),

                    //message
                    const Text(
                      "Register below using your details",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: kSecondColor),
                    ),
                    const SizedBox(height: 30),

                    //First name
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 25.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(color: kPrimaryColor),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: TextField(
                                  controller: _firstNameController,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'First Name',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10), //spacing
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 25.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(color: kPrimaryColor),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: TextField(
                                  controller: _lastNameController,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Last Name',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    //Phone number
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: kPrimaryColor),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                            controller: _emailController,
                            // obscureText: true,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Email Address'),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    //choose role
                     RadioButtonsGroup(onRoleSelected: (role){
                          onRoleSelected(role);
                    }),
                    const SizedBox(height: 25),

        // Manager code text box
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextField(
                controller: _managerCodeController,
                // enabled: enabled,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: 'Manager Code'),
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
                          border: Border.all(color: kPrimaryColor),
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
                    const SizedBox(height: 10),

                    //confirm password
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: kPrimaryColor),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                            controller: _confirmpasswordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Confirm Password'),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    //signUp in Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: InkWell(
                        //GestureDetector to InkWell for animation
                        onTap: () {
                          print("Sign Up button tapped!");
                          BlocProvider.of<AuthCubit>(context).registerUser(
                              firstname: _firstNameController.text,
                              lastname: _lastNameController.text,
                              email: _emailController.text,
                              role: selectedRole,
                              managercode: _managerCodeController.text,
                              password: _passwordController.text);
                        },
                        child: Ink(
                          //Container to Ink for animation
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: kSecondColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: const Center(
                            child: Text('Sign Up',
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
                        const Text('I am a member!',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).go('/login');
                          },
                          child: const Text(' Login Now',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold)),
                        ),
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
