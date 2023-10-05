import 'package:flutter/material.dart';
import 'package:health_check/src/asset/colors.dart';
import 'package:health_check/src/widgets/buttons.dart';
import 'package:health_check/src/widgets/text.dart';

Widget cartItemCard(String name, num price, num discount, EdgeInsets padding,
    void Function() onPressed) {
  return Container(
    height: 200,
    margin: padding,
    decoration: BoxDecoration(
        border: Border.all(color: AppColors.color7),
        borderRadius: BorderRadius.circular(10)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 40,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: AppColors.color1,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          child: Center(
            child: heading1("Pathology Test", Colors.white, EdgeInsets.zero,
                TextDecoration.none),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    text2(name, Colors.black, EdgeInsets.zero,
                        TextDecoration.none),
                    text2("Rs ${price - discount} /-", Colors.black,
                        EdgeInsets.zero, TextDecoration.none),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  outlinedCircularTextButton(
                      const Icon(
                        Icons.delete,
                        color: AppColors.color1,
                      ),
                      "Remove",
                      EdgeInsets.zero,
                      onPressed),
                  const SizedBox(
                    height: 10,
                  ),
                  outlinedCircularTextButton(
                      const Icon(
                        Icons.file_upload_outlined,
                        color: AppColors.color1,
                      ),
                      "Upload prescription (optional)",
                      EdgeInsets.zero,
                      () {}),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget cartDateSelector(
    String text, EdgeInsets padding, void Function() onTap) {
  return Container(
    height: 80,
    margin: padding,
    decoration: BoxDecoration(
        border: Border.all(color: AppColors.color7),
        borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(
            Icons.date_range,
            color: Colors.black54,
            size: 28,
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 30,
              width: 250,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.color7),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: text3(text, AppColors.color4, EdgeInsets.zero,
                    TextDecoration.none),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget billCard(num totPrice, num disc, EdgeInsets padding) {
  return Container(
    margin: padding,
    decoration: BoxDecoration(
        border: Border.all(color: AppColors.color7),
        borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text4("M.R.P. Total", AppColors.color4, EdgeInsets.zero,
                  TextDecoration.none),
              text4("$totPrice", AppColors.color4, EdgeInsets.zero,
                  TextDecoration.none)
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text4("Discount", AppColors.color4, EdgeInsets.zero,
                  TextDecoration.none),
              text4("$disc", AppColors.color4, EdgeInsets.zero,
                  TextDecoration.none)
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text1("Amount to be paid", AppColors.color1, EdgeInsets.zero,
                  TextDecoration.none),
              text1("${totPrice - disc}", AppColors.color1, EdgeInsets.zero,
                  TextDecoration.none)
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              text4("Total Savings", AppColors.color4, EdgeInsets.zero,
                  TextDecoration.none),
              const SizedBox(
                width: 30,
              ),
              text3("Rs $disc/-", AppColors.color1, EdgeInsets.zero,
                  TextDecoration.none)
            ],
          )
        ],
      ),
    ),
  );
}

Widget consentCard(EdgeInsets padding, dynamic value, dynamic groupValue,
    void Function(dynamic) onChanged) {
  return Container(
    margin: padding,
    decoration: BoxDecoration(
        border: Border.all(color: AppColors.color7),
        borderRadius: BorderRadius.circular(10)),
    child: ListTile(
      titleAlignment: ListTileTitleAlignment.top,
      minVerticalPadding: 10,
      minLeadingWidth: 10,
      contentPadding: EdgeInsets.zero,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          text3("Hardcopy of reports", AppColors.color8, EdgeInsets.zero,
              TextDecoration.none),
          text4(
              "Reports will be delivered between 3-4 working days. Hardcopy charges are non-refundable once the reports have been dispatched.",
              AppColors.color4,
              EdgeInsets.zero,
              TextDecoration.none),
          const SizedBox(
            height: 15,
          ),
          text3("Rs 150 per person", AppColors.color8, EdgeInsets.zero,
              TextDecoration.none)
        ],
      ),
      leading: Radio(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
    ),
  );
}
