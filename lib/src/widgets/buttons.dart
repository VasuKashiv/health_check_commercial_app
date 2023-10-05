import 'package:flutter/material.dart';
import 'package:health_check/src/asset/colors.dart';
import 'package:health_check/src/widgets/text.dart';

Widget flexedTextButton(
    String text, double height, EdgeInsets padding, void Function() onPressed) {
  return Container(
    height: height,
    margin: padding,
    alignment: Alignment.center,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: AppColors.color1,
    ),
    child: TextButton(
        style: TextButton.styleFrom(minimumSize: const Size.fromHeight(40)),
        onPressed: onPressed,
        child: title2(text, Colors.white,
            const EdgeInsets.symmetric(vertical: 0), TextDecoration.none)),
  );
}

Widget outlinedFlexedTextButton(
    String text, double height, EdgeInsets padding, void Function() onPressed) {
  return Container(
    height: height,
    width: double.maxFinite,
    margin: padding,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      border: Border.all(color: AppColors.color4, width: 1),
    ),
    child: TextButton(
        style: TextButton.styleFrom(minimumSize: const Size.fromHeight(40)),
        onPressed: onPressed,
        child: title2(text, AppColors.color4,
            const EdgeInsets.symmetric(vertical: 0), TextDecoration.none)),
  );
}

Widget outlinedTextButtonWithFixedWidth(
    String text, EdgeInsets padding, void Function() onPressed) {
  return Container(
    height: 40,
    width: 120,
    margin: padding,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      border: Border.all(color: AppColors.color1, width: 1),
    ),
    child: TextButton(
        style: TextButton.styleFrom(minimumSize: const Size.fromWidth(120)),
        onPressed: onPressed,
        child: title2(text, AppColors.color1,
            const EdgeInsets.symmetric(vertical: 0), TextDecoration.none)),
  );
}

Widget outlinedCircularTextButton(Widget leadingIcon, String text,
    EdgeInsets padding, void Function() onPressed) {
  return Container(
    height: 40.0,
    margin: padding,
    width: double.maxFinite,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      border: Border.all(color: AppColors.color1, width: 2),
    ),
    child: TextButton(
      style: TextButton.styleFrom(minimumSize: const Size.fromHeight(40)),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          leadingIcon,
          title2(text, AppColors.color1,
              const EdgeInsets.symmetric(horizontal: 10), TextDecoration.none),
        ],
      ),
    ),
  );
}
