import 'package:flutter/material.dart';
import 'package:health_check/src/asset/colors.dart';
import 'package:health_check/src/asset/images.dart';
import 'package:health_check/src/widgets/buttons.dart';
import 'package:health_check/src/widgets/text.dart';

Widget itemCard(
  String name,
  num n,
  num price,
  num actual,
  EdgeInsets? padding,
  void Function() onPressed1,
  void Function() onPressed2,
) {
  return Container(
    margin: padding,
    decoration: BoxDecoration(
        border: Border.all(color: AppColors.color7),
        borderRadius: BorderRadius.circular(10)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 30,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: AppColors.color2,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          child: Center(
            child:
                text3(name, Colors.white, EdgeInsets.zero, TextDecoration.none),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  text3("Includes $n tests", AppColors.color8, EdgeInsets.zero,
                      TextDecoration.none),
                  Image.asset(
                    AppIcons.badgeIcon,
                    height: 27,
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              text4("Get reports in 24 hours", AppColors.color4,
                  EdgeInsets.zero, TextDecoration.none),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  title2(
                      "Rs ${(price - actual).toStringAsFixed(0)}",
                      AppColors.color1,
                      const EdgeInsets.only(right: 5),
                      TextDecoration.none),
                  text4(actual.toStringAsFixed(0), AppColors.color8,
                      EdgeInsets.zero, TextDecoration.lineThrough)
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              flexedTextButton("Add to cart", 35,
                  const EdgeInsets.symmetric(horizontal: 5), onPressed1),
              const SizedBox(
                height: 10,
              ),
              outlinedFlexedTextButton("View Details", 35,
                  const EdgeInsets.symmetric(horizontal: 5), onPressed2)
            ],
          ),
        ),
      ],
    ),
  );
}

Widget popularItemCard(EdgeInsets? padding, void Function() onPressed) {
  return Container(
    margin: padding,
    decoration: BoxDecoration(
        border: Border.all(color: AppColors.color7),
        borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                AppIcons.plusIcon,
                height: 60,
              ),
              Image.asset(
                AppIcons.safeIcon,
                height: 22,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heading2("Full Body Checkup", AppColors.color9, EdgeInsets.zero,
                  TextDecoration.none),
              const SizedBox(
                height: 3,
              ),
              text3("Includes 92 tests", AppColors.color6, EdgeInsets.zero,
                  TextDecoration.none),
              text4("• Blood Glucose Fasting", AppColors.color6,
                  EdgeInsets.zero, TextDecoration.none),
              text4("• Liver Function Test", AppColors.color6, EdgeInsets.zero,
                  TextDecoration.none),
              const SizedBox(
                height: 3,
              ),
              text3("View More", AppColors.color6, EdgeInsets.zero,
                  TextDecoration.underline),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              heading2("Rs 2000/-", AppColors.color11, EdgeInsets.zero,
                  TextDecoration.none),
              outlinedTextButtonWithFixedWidth(
                  "Add to cart", EdgeInsets.zero, onPressed)
            ],
          ),
        ],
      ),
    ),
  );
}
