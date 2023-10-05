// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:health_check/src/asset/colors.dart';
import 'package:health_check/src/provider/appointment_provider.dart';
import 'package:health_check/src/widgets/text.dart';
import 'package:provider/provider.dart';

class CustomChoiceChip extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const CustomChoiceChip({required this.time, required this.isTrue});
  final String time;
  final bool isTrue;

  @override
  State<CustomChoiceChip> createState() => _CustomChoiceChipState();
}

class _CustomChoiceChipState extends State<CustomChoiceChip> {
  late var time;
  late var isTrue;
  late BookAppointmentsProvider bookAppointmentsProvider;
  @override
  void initState() {
    super.initState();
    time = widget.time;
    isTrue = widget.isTrue;
  }

  @override
  Widget build(BuildContext context) {
    bookAppointmentsProvider = Provider.of<BookAppointmentsProvider>(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          isTrue = !isTrue;
          bookAppointmentsProvider.getDetails['time'] = time;
        });
      },
      child: Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
              color: isTrue ? Colors.blue : Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(7)),
              border: Border.all(color: Colors.blue, width: 2)),
          child: Center(
            child: title3(time, isTrue ? AppColors.color10 : Colors.grey,
                EdgeInsets.zero, TextDecoration.none),
          )),
    );
  }
}
