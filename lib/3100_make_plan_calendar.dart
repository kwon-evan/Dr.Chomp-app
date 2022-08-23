import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:untitled/0000_received_text.dart';
import 'package:untitled/styles/app_styles.dart';

import '3200_Add_Region.dart';

class TestCalender extends StatefulWidget {
  // const TestCalander({Key? key}) : super(key: key);

  @override
  _TestCalender createState() => _TestCalender();
}

class _TestCalender extends State<TestCalender> {
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('yyyy/MM/dd').format(args.value.startDate)} -'
            ' ${DateFormat('yyyy/MM/dd').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('DatePicker demo'),
        ),
        body: Stack(
          children: [
            Positioned(
              left: 0,
              top: 10,
              right: 0,
              bottom: 0,
              child: SfDateRangePicker(
                onSelectionChanged: _onSelectionChanged,
                selectionMode: DateRangePickerSelectionMode.range,
                initialSelectedRange: PickerDateRange(
                    //초기 값
                    DateTime.now().subtract(const Duration(days: 0)),
                    DateTime.now().add(const Duration(days: 1))),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {
                        print("check");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => add_Region(_range),
                              fullscreenDialog: true),
                        );
                      },
                      child: Text(
                        "확인",
                        style: subtitle2(),
                      )),
                  TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {
                        print("check");
                        Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => received(_range),
                              fullscreenDialog: true),
                        );
                      },
                      child: Text(
                        "취소",
                        style: subtitle2(),
                      )),
                  // Text('Selected date: $_selectedDate'),
                  // Text('Selected date count: $_dateCount'),
                  // Text('Selected range: $_range'),
                  // Text('Selected ranges count: $_rangeCount')
                ],
              ),
            ),
          ],
        ));
  }
}
