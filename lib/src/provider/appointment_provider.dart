import 'package:flutter/material.dart';
import 'package:health_check/src/widgets/choicechip.dart';

class Data {
  String date;
  bool value = false;
  Data(this.date, this.value);
}

class BookAppointmentsProvider with ChangeNotifier {
  late List<Widget> _choiceList = [];
  final List<Data> _choiceChipData = [
    Data("08:00 AM", false),
    Data("09:00 AM", false),
    Data("10:00 AM", false),
    Data("11:00 AM", false),
    Data("12:00 PM", false),
    Data("13:00 PM", false),
    Data("14:00 PM", false),
    Data("15:00 PM", false),
    Data("16:00 PM", false),
  ];
  void func() {
    List<Widget> widgets = [];
    for (int i = 0; i < _choiceChipData.length; i++) {
      Widget item = CustomChoiceChip(
          time: _choiceChipData[i].date, isTrue: _choiceChipData[i].value);
      widgets.add(item);
    }
    _choiceList = widgets;
  }

  List<Widget> get getChoiceChips {
    return _choiceList;
  }

  late Map<String, dynamic> mp = {};
  void getBookingDetails(String date, String time) {
    Map<String, dynamic> temp = {};
    temp['date'] = date;
    temp['time'] = time;
    mp = temp;
  }

  Map<String, dynamic> get getDetails {
    return mp;
  }
}
