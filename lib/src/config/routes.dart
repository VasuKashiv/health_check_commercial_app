import 'package:flutter/material.dart';
import 'package:health_check/src/screens/book_appointment.dart';
import 'package:health_check/src/screens/cart.dart';
import 'package:health_check/src/screens/lab_test.dart';
import 'package:health_check/src/screens/sucess_screen.dart';

void goBack(BuildContext context) {
  Navigator.pop(context);
}

void goToMyCart(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const MyCart(),
    ),
  );
}

void goToHome(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const LabTestScreen(),
    ),
  );
}

void confirmOrder(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const SucessScreen(),
    ),
  );
}

Future<dynamic> goToBookScreen(BuildContext context) async {
  final result = await Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const BookAppointment(),
    ),
  );
  return result;
}

void returnToCart(BuildContext context, DateTime date, String time) {
  Navigator.of(context).pop([date, time]);
}
