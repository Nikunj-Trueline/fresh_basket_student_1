import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fresh_basket_mine/screens/signup/components/textfield_decoration.dart';
import '../../../common/common_sizebox.dart';
import '../../../constant/gradient.dart';
import '../../../constant/text_theme.dart';
import '../../../firebase/firebase_servicies.dart';
import '../../../mediaquery/media_query.dart';
import '../../../model/app_user.dart';
import '../../../prefrence/prefrence_sevicies.dart';
import '../../../routes/project_routes.dart';
import '../../../utils/utils.dart';
import 'custom_buttons.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final FirebaseService _service = FirebaseService();

  String gender = 'male',
      dob = '',
      fName = '',
      lName = '',
      contact = '',
      email = '',
      password = '',
      confirmPassword = '',
      userType = '',
      address = '';

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _dobController = TextEditingController();
  final _passwordController = TextEditingController();

  Future _selectDate() async {
    var pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      initialEntryMode: DatePickerEntryMode.calendar,
      fieldLabelText: 'DOB',
      helpText: 'Select Date Of Birth',
      confirmText: 'Done',
      cancelText: 'Cancel',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.yellow, // header background color
              onPrimary: Colors.black, // header text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.amber, // button text color
                  fixedSize: const Size(30, 20)),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        dob =
            '${pickedDate.day.toString()}/${pickedDate.month.toString()}/${pickedDate.year}';
        _dobController.text = dob;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              buildNameFormField(),
              CommonSizeBox(
                height: MediaQueryHelper.height * 16,
              ),
              buildEmailFormField(),
              CommonSizeBox(
                height: MediaQueryHelper.height * 16,
              ),
              buildContactFormField(),
              CommonSizeBox(
                height: MediaQueryHelper.height * 16,
              ),
              buildGenderSelectionWidget(),
              CommonSizeBox(
                height: MediaQueryHelper.height * 16,
              ),
              buildUserTypeFormField(),
              CommonSizeBox(
                height: MediaQueryHelper.height * 16,
              ),
              buildDateOfBirthFormField(context),
              CommonSizeBox(
                height: MediaQueryHelper.height * 16,
              ),
              buildAddressFormField(),
              CommonSizeBox(
                height: MediaQueryHelper.height * 16,
              ),
              buildPasswordFormField(),
              CommonSizeBox(
                height: MediaQueryHelper.height * 16,
              ),
              buildConfirmPasswordFormField(),
              CommonSizeBox(
                height: MediaQueryHelper.height * 16,
              ),
              //   Footer part
              Container(
                color: Colors.transparent,
                height: MediaQueryHelper.height * 90,
                width: MediaQueryHelper.width * double.infinity,
                child: footerForSignUpForm(),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildNameFormField() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: TextFormField(
            cursorHeight: 32,
            cursorWidth: 3,
            style: styleForTextFieldForSignUp,
            cursorColor: textFieldCursorColor,
            keyboardType: TextInputType.name,
            onSaved: (newValue) {
              fName = newValue.toString();
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'First Name';
              } else {
                return null;
              }
            },
            decoration: decorationForTextFormField(
              labelText: "First Name",
            ),
          ),
        ),
        SizedBox(
          width: MediaQueryHelper.width * 20,
        ),
        Expanded(
          child: TextFormField(
            cursorHeight: 32,
            cursorWidth: 3,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Last Name';
              } else {
                return null;
              }
            },
            onSaved: (newValue) {
              lName = newValue.toString();
            },
            style: styleForTextFieldForSignUp,
            cursorColor: textFieldCursorColor,
            keyboardType: TextInputType.name,
            decoration: decorationForTextFormField(
              labelText: "Last Name",
            ),
          ),
        )
      ],
    );
  }

  buildEmailFormField() {
    return TextFormField(
      cursorHeight: 32,
      cursorWidth: 3,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || !Utils.isEmailValid(value)) {
          return 'Enter valid email address';
        } else {
          return null;
        }
      },
      onSaved: (newValue) {
        email = newValue.toString();
      },
      controller: _emailController,
      style: styleForTextFieldForSignUp,
      cursorColor: textFieldCursorColor,
      decoration: decorationForTextFormField(
        labelText: "Enter Email",
        // suffixIcon: const CustomSuffixIcon(
        //   'assets/icons/Mail.svg',
        //   bottomPadding: 14,
        //   height: 12,
        // ),
      ),
    );
  }

  buildContactFormField() {
    return TextFormField(
      cursorHeight: 32,
      cursorWidth: 3,
      validator: (value) {
        if (value == null || !Utils.isValidContact(value)) {
          return 'Enter valid contact';
        } else {
          return null;
        }
      },
      onSaved: (newValue) {
        contact = newValue.toString();
      },
      style: styleForTextFieldForSignUp,
      cursorColor: textFieldCursorColor,
      keyboardType: TextInputType.number,
      onChanged: (value) {
        if (kDebugMode) {
          print(value);
        }
      },
      decoration: decorationForTextFormField(
        labelText: "Contact",
        // suffixIcon: const CustomSuffixIcon(
        //   "assets/icons/Call.svg",
        //   height: 12,
        //   bottomPadding: 14,
        // ),
      ),
    );
  }

  buildGenderSelectionWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          const Text('Gender',
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.black,
                  fontWeight: FontWeight.w400)),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 'male',
                  groupValue: gender,
                  activeColor: textFieldCursorColor,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                const Text('Male',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.w400)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 'female',
                  groupValue: gender,
                  activeColor: textFieldCursorColor,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                const Text('Female',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.w400)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 'other',
                  activeColor: textFieldCursorColor,
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                const Text(
                  'Others',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildUserTypeFormField() {
    return DropdownButtonFormField(
      iconEnabledColor: Colors.black,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Select user type';
        } else {
          return null;
        }
      },
      style: styleForTextFieldForSignUp,
      decoration: decorationForTextFormField(
        labelText: "User Type",
      ),
      items: const [
        DropdownMenuItem(
          value: 'Vendor',
          child: Text('Vendor',
              style: TextStyle(fontSize: 20, color: Colors.black)),
        ),
        DropdownMenuItem(
          value: 'User',
          child: Text(
            'User',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      ],
      onChanged: (value) {
        setState(() {
          userType = value.toString();
        });
      },
    );
  }

  buildDateOfBirthFormField(BuildContext context) {
    return TextFormField(
      cursorHeight: 32,
      cursorWidth: 3,
      cursorColor: textFieldCursorColor,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Select date';
        } else {
          return null;
        }
      },
      controller: _dobController,
      style: styleForTextFieldForSignUp,
      onTap: () {
        _selectDate();
        FocusScope.of(context).requestFocus(FocusNode());
      },
      onSaved: (newValue) {
        setState(() {
          dob = newValue.toString();
        });
      },
      decoration: decorationForTextFormField(
        labelText: "Date of Birth",
        // suffixIcon: const CustomSuffixIcon(
        //   "assets/icons/Dob.svg",
        //   bottomPadding: 14,
        //   height: 12,
        // ),
      ),
    );
  }

  buildAddressFormField() {
    return TextFormField(
      cursorHeight: 32,
      cursorWidth: 3,
      cursorColor: textFieldCursorColor,
      style: styleForTextFieldForSignUp,
      keyboardType: TextInputType.multiline,
      maxLines: 4,
      onSaved: (newValue) {
        address = newValue.toString();
      },
      decoration: decorationForTextFormField(
          labelText: "Address", alignLabelWithHint: true),
    );
  }

  buildPasswordFormField() {
    return TextFormField(
      cursorHeight: 32,
      cursorWidth: 3,
      controller: _passwordController,
      cursorColor: textFieldCursorColor,
      validator: (value) {
        if (value == null || !Utils.isPasswordValid(value)) {
          return 'Enter valid password';
        } else {
          return null;
        }
      },
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
      keyboardType: TextInputType.text,
      obscureText: false,
      onSaved: (newValue) {
        password = newValue.toString();
      },
      decoration: decorationForTextFormField(
        labelText: "Password",
        // suffixIcon: const CustomSuffixIcon(
        //   "assets/icons/Lock.svg",
        //   bottomPadding: 14,
        //   height: 12,
        // ),
      ),
    );
  }

  buildConfirmPasswordFormField() {
    return TextFormField(
      cursorHeight: 32,
      cursorWidth: 3,
      // validator: (value) {
      //   if (value == null || value != _passwordController.toString()) {
      //     return 'Password mismatch';
      //   } else {
      //     return null;
      //   }
      // },
      onSaved: (newValue) {
        confirmPassword = newValue.toString();
      },
      style: styleForTextFieldForSignUp,
      cursorColor: textFieldCursorColor,
      keyboardType: TextInputType.text,
      obscureText: false,
      decoration: decorationForTextFormField(
        labelText: 'Confirm Password',
      ),
    );
  }

  Widget footerForSignUpForm() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: customButtonForSignUp(
          data: "Sign Up",
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              // print data
              _formKey.currentState!.save();
              if (kDebugMode) {
                print('''
              fName : $fName
              lName : $lName
              email : $email
              password : $password
              gender : $gender
              Dob : $dob
              userType : $userType
              ''');
              }

              var user = AppUser(
                fName: fName,
                dob: dob,
                gender: gender,
                lName: lName,
                email: email,
                contact: contact,
                password: password,
                userType: userType,
                address: address,
              );

              createUserAccount(user, context);
            }
          },
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.w600,
          letterSpacing: 1),
    );
  }

  Future<void> createUserAccount(AppUser user, BuildContext context) async {
    var credential = await createAccount(user.email!, user.password!);

    if (credential is UserCredential) {
      if (credential.user != null) {
        user.id = credential.user!.uid;

        _service.createUser(user).then((value) {
          PrefrenceServicies.setData(PrefrenceServicies.isLoginKey, true);

          if (!mounted) return;
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoutes.home, (route) => false);
        }).catchError((error) {
          // error
          if (kDebugMode) {
            print('error : ${error.toString()}');
          }
        });
      }
    } else if (credential is String) {
      if (kDebugMode) {
        print(credential);
      }
    }
  }

  Future<dynamic> createAccount(String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        return credential;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
    } catch (e) {
      print(e);
    }
  }
}
