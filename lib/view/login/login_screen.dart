import 'package:codeland/res/constants.dart';
import 'package:codeland/view/home/home_screen.dart';
import 'package:codeland/view/login/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomSheet: Container(
        color: textColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Text(
            "v1.7 © 2023, Codeland Infosolutions Pvt Ltd.",
            style: normalText(12, Colors.black, FontWeight.w400),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 32.0, left: 32.0, right: 32.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Column(
                children: [
                  Image.asset("assets/name.png"),
                  Image.asset("assets/tree_logo.png"),
                  Text(
                    "Biomedical  Kiosk",
                    style: normalText(20, Colors.black, FontWeight.w500),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.15),
                      child: Text(
                        "for HCE’s",
                        style: normalText(10, primaryColor, FontWeight.w500),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _username = value.trim();
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintStyle: normalText(16, Colors.black, FontWeight.w500),
                    hintText: "Username",
                    focusColor: Colors.black,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _password = value.trim();
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                obscureText: true,
                decoration: InputDecoration(
                    hintStyle: normalText(16, Colors.black, FontWeight.w500),
                    hintText: "Password",
                    focusColor: Colors.black,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomButton(
                text: "Login",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    );
                  } else {
                    // Form fields are invalid, show error message
                    print('Form is invalid. Please correct errors.');
                  }
                },
                color: primaryColor,
                borderRadius: 12,
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width,
                textSize: 24,
                textColor: textColor,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                height: 32,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "For Assistance & Login Details Contact: ",
                    style: normalText(12, Colors.black, FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "English, Kannada & Telegu :  ",
                        style: normalText(12, Colors.black, FontWeight.w400),
                      ),
                      Text('7406333800',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                decorationThickness: 1,
                                decoration: TextDecoration.underline,
                                decorationColor: primaryColor),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "English, Kannada & Hindi :  ",
                        style: normalText(12, Colors.black, FontWeight.w400),
                      ),
                      Text('9071386515',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                decorationColor: primaryColor,
                                decorationThickness: 1,
                                decoration: TextDecoration.underline),
                          ))
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
