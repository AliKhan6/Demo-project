import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizzes_mobile_app/ui/screens/auth_signup/login/login_view_model.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/constants/styles.dart';
import '../../../../core/enums/view_state.dart';
import '../../../custom_widgets/buttons/rectangular_button.dart';
import '../../../custom_widgets/buttons/social_auth_button.dart';
import '../sign_up/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  //Todo: Do localization here.
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: SafeArea(
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        SizedBox(height: 50.h),
                        Text("Welcome", style: headingFont),
                        SizedBox(height: 5.h),
                        Text("Sign in to continue!", style: bodyFont),
                        SizedBox(height: 80.h),

                        ///
                        /// Email and password
                        ///
                        TextFormField(
                          validator: (val) {
                            if (!val.toString().trim().isEmail) {
                              return 'Please Enter a Valid Email';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (val) {
                            model.loginBody.email = val.trim();
                          },
                          decoration: authTextFieldDecoration,
                        ),

                        SizedBox(height: 20.h),

                        ///
                        /// password
                        ///
                        TextFormField(
                          obscureText: model.passwordVisibility,
                          validator: (val) {
                            if (val!.length < 1) {
                              return 'Please enter your password';
                            } else if (val.length < 8) {
                              return 'Password must include 8 characters';
                            } else {
                              return null;
                            }
                          },
                          // controller: model.passwordController,
                          onTap: () {},
                          onChanged: (val) {
                            model.loginBody.password = val.trim();
                          },
                          decoration: authTextFieldDecoration.copyWith(
                            hintText: "Password",
                            suffixIcon: IconButton(
                              icon: Icon(
                                model.passwordVisibility
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                size: 18.h,
                                color: Color(0xFFB1B1B1),
                              ),
                              onPressed: () {
                                model.togglePasswordVisibility();
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),

                        ///
                        /// forgot password
                        ///
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forgot password?",
                            style: bodyFont.copyWith(
                              color: primaryColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 70.h),

                        ///
                        /// Login button
                        ///
                        RectangularButton(
                          text: "Login",
                          onPressed: () {},
                        ),
                        SizedBox(height: 20.h),

                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(SignUpScreen());
                            },
                            child: Text(
                              "Don't have an account?",
                              style: bodyFont,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          "OR",
                          style: bodyFont.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        SocialAuthButton(
                          icon: "$staticAssets/google_icon.png",
                          text: "Log in with Google",
                          onPressed: () {},
                        ),
                        SizedBox(height: 20.h),
                        SocialAuthButton(
                          icon: "$staticAssets/facebook_icon.png",
                          text: "Log in with Facebook",
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
