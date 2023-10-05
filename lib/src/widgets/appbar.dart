import 'package:flutter/material.dart';
import 'package:health_check/src/widgets/text.dart';

Widget topNavigationBar(
    {required String title, Widget? leadingWidget, Widget? trailingWidget}) {
  return Column(
    children: [
      Row(
        children: [
          leadingWidget ??
              Container(
                width: 40,
              ),
          const Spacer(),
          heading2(title, Colors.black,
              const EdgeInsets.symmetric(vertical: 15), TextDecoration.none),
          const Spacer(),
          trailingWidget ??
              Container(
                width: 30,
              ),
        ],
      ),
    ],
  );
}
