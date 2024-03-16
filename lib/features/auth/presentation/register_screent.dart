import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:writeapp/utils/theme/theme.dart';
import 'package:writeapp/utils/validator/validator.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool _invisiblePassword = true;

    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(1000, 231, 231, 231),
          borderRadius: BorderRadius.circular(20)),
      child: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                style: const TextStyle(color: primaryColorDK),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                decoration: inputDecoration.copyWith(
                    hintText: "Name",
                    hintStyle: const TextStyle(
                      color: secondaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    filled: true,
                    fillColor: Colors.white),
                // validator: Validator.isValidField(),
              ),
              const SizedBox(
                height: 25.0,
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
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
                decoration: inputDecoration.copyWith(
                    hintText: "Password",
                    hintStyle: const TextStyle(
                        color: secondaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                    filled: true,
                    fillColor: Colors.white),
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
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: const Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: primaryColorLT,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
