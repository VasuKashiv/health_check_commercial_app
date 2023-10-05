import 'package:flutter/material.dart';
import 'package:health_check/src/asset/colors.dart';
import 'package:health_check/src/asset/images.dart';
import 'package:health_check/src/config/routes.dart';
import 'package:health_check/src/provider/appointment_provider.dart';
import 'package:health_check/src/provider/product_provider.dart';
import 'package:health_check/src/widgets/appbar.dart';
import 'package:health_check/src/widgets/buttons.dart';
import 'package:health_check/src/widgets/text.dart';
import 'package:provider/provider.dart';

class SucessScreen extends StatelessWidget {
  const SucessScreen({super.key});
  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    BookAppointmentsProvider bookAppointmentsProvider =
        Provider.of<BookAppointmentsProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child:
                topNavigationBar(title: "Sucess", leadingWidget: Container()),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppIcons.sucessIcon,
                  height: 160,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      text1("Lab Tests have been", AppColors.color4,
                          EdgeInsets.zero, TextDecoration.none),
                      text1(
                          "scheduled sucessfully, You will ",
                          AppColors.color4,
                          EdgeInsets.zero,
                          TextDecoration.none),
                      text1(" receive a mail for the same.", AppColors.color4,
                          EdgeInsets.zero, TextDecoration.none),
                      const SizedBox(
                        height: 10,
                      ),
                      text2(
                          bookAppointmentsProvider.getDetails['date'] +
                              " | " +
                              bookAppointmentsProvider.getDetails['time'],
                          AppColors.color3,
                          EdgeInsets.zero,
                          TextDecoration.none),
                    ],
                  ),
                )
              ],
            ),
          ),
          flexedTextButton("Back to home", 40,
              const EdgeInsets.symmetric(vertical: 30, horizontal: 20), () {
            productProvider.clearCheckoutProduct();
            goToHome(context);
          })
        ],
      ),
    );
  }
}
