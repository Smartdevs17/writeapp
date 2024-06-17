import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:writeapp/features/auth/controller/auth_controller.dart';
import 'package:writeapp/routes/routes.dart';
import 'package:writeapp/utils/constants/constants.dart';
import 'package:writeapp/utils/theme/theme.dart';
import 'package:writeapp/utils/validator/validator.dart';

class LoginScreen extends StatefulWidget {
  final Function(bool)? onForgotPassword;
  const LoginScreen({super.key, this.onForgotPassword});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _invisiblePassword = true;
  String? _email, _password;
  bool _isLoading = false;
  late AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  AuthController _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    bool showResetPasswordTab = false;

    return AbsorbPointer(
      absorbing: _isLoading,
      child: Form(
        key: _formKey,
        autovalidateMode: _autoValidateMode,
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(1000, 231, 231, 231),
              borderRadius: BorderRadius.circular(20)),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (String val) {
                      _email = val;
                    },
                    decoration: inputDecoration.copyWith(
                        hintText: "Email",
                        hintStyle: const TextStyle(
                          color: secondaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        filled: true,
                        fillColor: Colors.white),
                    validator: Validator.emailValidator,
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.done,
                    obscureText: _invisiblePassword,
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (String val) {
                      _password = val;
                    },
                    decoration: inputDecoration.copyWith(
                        hintText: "Password",
                        suffixIcon: _showHideIcon(PasswordField.password),
                        hintStyle: const TextStyle(
                            color: secondaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                        filled: true,
                        fillColor: Colors.white),
                    validator: Validator.passwordValidator,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.black,
                          thickness: 1.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "OR",
                          style: TextStyle(color: Colors.black, fontSize: 14.0),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.black,
                          thickness: 1.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: 70,
                        decoration: const BoxDecoration(
                          color: primaryColorLT,
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/svgs/twitter.svg",
                              height: 17,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Continue with Twitter",
                              style: TextStyle(
                                color: primaryColorDK,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 70,
                        decoration: const BoxDecoration(
                          color: primaryColorLT,
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/svgs/facebook.svg",
                              height: 17,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Continue with Facebook",
                              style: TextStyle(
                                color: primaryColorDK,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                          height: 70,
                          decoration: const BoxDecoration(
                            color: primaryColorDK,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: () async {
                                setState(() {
                                  _autoValidateMode = AutovalidateMode.always;
                                });

                                if (_email != null && _password != null) {
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  await _authController.login(
                                      _email!, _password!);
                                }
                                // else {
                                //   Get.snackbar("Error",
                                //       "Enter a valid email and password");
                                // }
                                setState(() {
                                  _isLoading = false;
                                });
                              },
                              child: _isLoading
                                  ? const SizedBox(
                                      width: 24.0,
                                      height: 24.0,
                                      child: CircularProgressIndicator(),
                                    )
                                  : const Text(
                                      "Sign In",
                                      style: TextStyle(
                                        color: primaryColorLT,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                            ),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.onForgotPassword?.call(!showResetPasswordTab);
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: primaryColorDK,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _showHideIcon(PasswordField passwordField) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (passwordField == PasswordField.password) {
            _invisiblePassword = !_invisiblePassword;
          } else {
            _invisiblePassword = !_invisiblePassword;
          }
        });
      },
      child: Container(
        height: 40.0,
        width: 40.0,
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: SvgPicture.asset(
          passwordField == PasswordField.password
              ? !_invisiblePassword
                  ? 'assets/svgs/eye.svg'
                  : 'assets/svgs/private.svg'
              : !_invisiblePassword
                  ? 'assets/svgs/eye.svg'
                  : 'assets/svgs/private.svg',
          color: hintColor,
        ),
      ),
    );
  }
}
