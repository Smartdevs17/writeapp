import 'package:flutter/material.dart';
import 'package:writeapp/utils/theme/theme.dart';
import 'package:writeapp/utils/validator/validator.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                height: 15,
              ),
              const Center(
                child: Text(
                  "You will recieve the recovery detials in your email.",
                  style: TextStyle(
                    color: primaryColorDK,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
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
                          "Reset Password",
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
        ),
      ),
    );
  }
}
