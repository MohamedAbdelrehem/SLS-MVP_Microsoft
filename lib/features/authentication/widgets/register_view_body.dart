import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sls_mvp_microsoft/constants.dart';
import 'package:sls_mvp_microsoft/core/utils/assets.dart';
import 'package:sls_mvp_microsoft/features/authentication/widgets/selectRoleRadio_widget.dart';

final _emailController = TextEditingController();
final _passwordController = TextEditingController();
final _confirmpasswordController = TextEditingController();
final _phonenumberController = TextEditingController();
final _firstNameController = TextEditingController();
final _lastNameController = TextEditingController();

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SvgPicture.asset(
                AssetsData.logo,
                height: 150,
                color: kPrimaryColor,
              ),

              //welcome message
              Text(
                "Hello there!",
                style: GoogleFonts.lobster(
                    fontSize: 40, textStyle: TextStyle(color: kSecondColor)),
              ),

              //message
              const Text(
                "Register below using your details",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: kSecondColor),
              ),
              SizedBox(height: 30),

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
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'First Name',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10), //spacing
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
                            decoration: InputDecoration(
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
              SizedBox(height: 10),
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
                      controller: _phonenumberController,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Phone Number'),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),

              //choose role
              RadioButtonsGroup(),

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
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Password'),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

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
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Confirm Password'),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              //signUp in Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: InkWell(
                  //GestureDetector to InkWell for animation
                  onTap: () {
                    print("Sign Up button tapped!");
                  },
                  child: Ink(
                    //Container to Ink for animation
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: kSecondColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text('Sign Up',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),

              //not a  member button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('I am a member!',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).go('/');
                    },
                    child: Text(' Login Now',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              SizedBox(height: 75),
            ],
          ),
        ),
      ),
    );
  }
}
