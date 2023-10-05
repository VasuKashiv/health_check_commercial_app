import 'package:flutter/material.dart';
import 'package:health_check/src/asset/colors.dart';
import 'package:health_check/src/config/routes.dart';
import 'package:health_check/src/provider/appointment_provider.dart';
import 'package:health_check/src/widgets/buttons.dart';
import 'package:health_check/src/widgets/text.dart';
import 'package:provider/provider.dart';
import '../widgets/appbar.dart';

class BookAppointment extends StatefulWidget {
  const BookAppointment({super.key});

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

late BookAppointmentsProvider bookAppointmentsProvider;
late List<Widget> _widgets;
Map<String, dynamic> mp = {};

class _BookAppointmentState extends State<BookAppointment> {
  DateTime _date = DateTime.now();
  final String _time = '';
  @override
  Widget build(BuildContext context) {
    bookAppointmentsProvider = Provider.of<BookAppointmentsProvider>(context);
    bookAppointmentsProvider.func();
    _widgets = bookAppointmentsProvider.getChoiceChips;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: topNavigationBar(
                title: "Book Appointment",
                leadingWidget: IconButton(
                    onPressed: () {
                      goBack(context);
                    },
                    icon: const Icon(Icons.arrow_back))),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title3("Select Date", Colors.black,
                    const EdgeInsets.only(left: 20), TextDecoration.none),
                const Spacer(),
                Container(
                  height: 300,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: AppColors.color10,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(185, 236, 236, 236),
                        blurRadius: 10.0,
                        spreadRadius: 5.0,
                        offset: Offset(
                          2.0,
                          2.0,
                        ),
                      )
                    ],
                  ),
                  child: CalendarDatePicker(
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2023, 01, 01),
                      lastDate: DateTime(2050, 12, 31),
                      initialCalendarMode: DatePickerMode.day,
                      onDateChanged: (DateTime value) {
                        _date = value;
                        bookAppointmentsProvider.getBookingDetails(
                            _date
                                .toString()
                                .substring(0, 10)
                                .split('-')
                                .reversed
                                .join("-"),
                            _time);
                      }),
                ),
                const Spacer(),
                title3("Select Time", Colors.black,
                    const EdgeInsets.only(left: 20), TextDecoration.none),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 30, right: 30, bottom: 30),
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    childAspectRatio: 2.5,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 30,
                    children: List.of(_widgets),
                  ),
                )
              ],
            ),
          ),
          flexedTextButton("Confirm", 40,
              const EdgeInsets.only(bottom: 25, left: 20, right: 20), () {
            returnToCart(context, _date, _time);
          }),
        ],
      ),
    );
  }
}
