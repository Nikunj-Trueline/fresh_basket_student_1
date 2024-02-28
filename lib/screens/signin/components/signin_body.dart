import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fresh_basket_mine/prefrence/prefrence_sevicies.dart';
import '../../../common/common_sizebox.dart';
import '../../../constant/text_theme.dart';
import '../../../mediaquery/media_query.dart';
import '../../../routes/project_routes.dart';
import '../../../utils/utils.dart';
import 'custom_buttons.dart';
import 'custom_text.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({super.key});

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool status = false;

  String? emailError, passwordError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                CommonSizeBox(height: MediaQueryHelper.height * 20),
                Image(
                  image: const AssetImage("assets/images/login_use.jpg"),
                  height: MediaQueryHelper.height * 250,
                  width: MediaQueryHelper.width * 400,
                ),
                CommonSizeBox(height: MediaQueryHelper.height * 30),
                Row(
                  children: [
                    CommonSizeBox(width: MediaQueryHelper.width * 20),
                    customTextForSignIn(
                        text: "SIGN-IN",
                        fontFamily: 'poppins',
                        textAlign: TextAlign.start,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w300,
                        fontSize: 40,
                        color: Colors.black),
                  ],
                ),
                CommonSizeBox(
                  height: MediaQueryHelper.height * 10,
                ),
                Row(
                  children: [
                    CommonSizeBox(width: MediaQueryHelper.width * 20),
                    customTextForSignIn(
                      text: 'Enter your email and password',
                      color: Colors.black54,
                      fontSize: 25,
                    ),
                  ],
                ),
                CommonSizeBox(
                  height: MediaQueryHelper.height * 45,
                ),
                Row(
                  children: [
                    CommonSizeBox(width: MediaQueryHelper.width * 20),
                    customTextForSignIn(
                      text: 'Email',
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 20, top: 0, bottom: 5),
                  child: commonTextFieldForSignInField(
                    controller: _emailController,
                    status: false,
                    hintText: 'Email',
                    iconForSuffix: Icons.email,
                    errorText: emailError,
                    onTap: () {},
                  ),
                ),
                CommonSizeBox(
                  height: MediaQueryHelper.height * 35,
                ),
                Row(
                  children: [
                    CommonSizeBox(width: MediaQueryHelper.width * 20),
                    customTextForSignIn(
                      text: 'Password',
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 20, top: 0, bottom: 10),
                  child: commonTextFieldForSignInField(
                    status: status,
                    iconForSuffix: Icons.visibility_off,
                    controller: _passwordController,
                    errorText: passwordError,
                    onTap: () {
                      setState(() {
                        status = !status;
                      });
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    customTextButtonForForgot(
                      onPressed: () {},
                      data: "Forgot Password?",
                      fontSize: 30,
                    )
                  ],
                ),
                CommonSizeBox(
                  height: MediaQueryHelper.height * 40,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    customButtonForSignIn(
                        onPressed: () {
                          //  get all values from  textfield .

                          String email =
                              _emailController.text.toString().trim();
                          String password =
                              _passwordController.text.toString().trim();

                          resetFocus();

                          if (!Utils.isEmailValid(email)) {
                            // show an error
                            setState(() {
                              emailError = "Enter  valid email";
                            });
                          } else if (!Utils.isPasswordValid(password)) {
                            // show an password error
                            setState(() {
                              passwordError = "Enter valid password";
                            });
                          } else {
                            // set isLogin key value true in preference.

                            PrefrenceServicies.setData(
                                PrefrenceServicies.isLoginKey, true);

                            loginUser(email, password, context);

                            //
                            // Navigator.pushNamedAndRemoveUntil(
                            //     context, AppRoutes.home, (route) => false);
                          }
                        },
                        data: "Sign In",
                        fontSize: 33,
                        fontWeight: FontWeight.w800),
                  ],
                ),
                CommonSizeBox(
                  height: MediaQueryHelper.height * 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Expanded(
                    //   child: Container(),
                    // ),
                    customTextForSignIn(
                      text: "Don't have an account?",
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQueryHelper.height * 24,
                    ),
                    customTextButtonForSignUp(
                        data: "Sign Up",
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.signUp);
                        },
                        color: Colors.amber,
                        fontSize: 25)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void resetFocus() {
    setState(() {
      emailError = null;
      passwordError = null;
    });
  }

  Future<void> loginUser(
      String email, String password, BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        if (!mounted) return;
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.home, (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}

// Custom TextFormField For Email

TextFormField commonTextFieldForSignInField({
  String? hintText,
  void Function()? onTap,
  IconData? iconForSuffix,
  TextEditingController? controller,
  String? errorText,
  required bool status,
}) {
  return TextFormField(
    cursorHeight: 32,
    cursorWidth: 3,
    controller: controller,
    cursorColor: Colors.amber.shade700,
    onTap: onTap,
    obscureText: status,
    style: textStyleForTextFormField(),
    decoration: InputDecoration(
      suffixIcon: IconButton(
        icon: Icon(
          iconForSuffix,
          size: 35,
        ),
        onPressed: onTap,
        padding: const EdgeInsets.all(10),
      ),
      errorText: errorText,
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.amber.shade700),
      ),
    ),
  );
}

// Custom TextFormField For Password

//   TextFormField commonTextFieldForPassword(
//       {required Function()? onPressed, required Widget icon}) {
//     return TextFormField(
//       cursorHeight: 32,
//       cursorWidth: 3,
//       cursorColor: Colors.amber.shade700,
//       cursorOpacityAnimates: true,
//       style: textStyleForTextFormField(),
//       decoration: InputDecoration(
//         suffixIcon: IconButton(
//             onPressed: onPressed,
//             icon: icon,
//             padding: const EdgeInsets.all(10)),
//         enabledBorder: const UnderlineInputBorder(
//           borderSide: BorderSide(color: Colors.grey),
//         ),
//         focusedBorder: UnderlineInputBorder(
//           borderSide: BorderSide(color: Colors.amber.shade700),
//         ),
//       ),
//     );
//   }
// }

/*

 */
