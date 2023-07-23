import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppConstants {
  const AppConstants._();
  static const String appTitle = "STAY HARD";
  static const String selectWeigthTitle = "Select your weight / height";
  static const String btnContinue = "Continue";
  static const String chooseGender = "Choose your Gender";
  static const String male = "Male";
  static const String female = "female";
  static const String selectAgeTitle = "Select your age";
  static const String signInWithText = "Sign in With";
  static const String signInText = "Sign In";
  static const String signUpText = "Sign Up";
  static const String phoneAndEmailText = "Phone/E-mail";
  static const String passwordText = "Password";
  static const String forgotPwText = "Forgot Password?";
  static const String donthaveAccText = "Don't have an Account?";
  static const Color primaryColor = Color(0xffF54242);
  static const Color secondaryColor = Color.fromRGBO(189, 189, 189, 1);
}

TextStyle smallTitleTextStyle({
  double fsize = 20,
  color = Colors.black,
}) {
  //textStyle for only small titles like choose your age
  return GoogleFonts.orbitron(
      fontSize: fsize, color: color, fontWeight: FontWeight.bold);
}

TextStyle bigtitleTextStyle(Color c, {double fsize = 30}) {
  return GoogleFonts.orbitron(
      fontSize: fsize, color: c, fontWeight: FontWeight.bold);
}

SizedBox spaceSmallH15() {
  return const SizedBox(
    height: 15,
  );
}

SizedBox spaceMediumH25() {
  return const SizedBox(
    height: 25,
  );
}

SizedBox spaceLargeH35() {
  return const SizedBox(
    height: 35,
  );
}
