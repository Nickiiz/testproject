import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

String formatDate(DateTime date) {
  final formatter = DateFormat.MMMMEEEEd('th');
  return formatter.format(date);
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  final kFirstDay = DateTime(
      DateTime.now().year, DateTime.now().month - 3, DateTime.now().day);
  final kLastDay = DateTime(
      DateTime.now().year, DateTime.now().month + 3, DateTime.now().day);

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('th', null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carlendar'),
      ),
      body: TableCalendar(
        firstDay: kFirstDay,
        lastDay: kLastDay,
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        startingDayOfWeek: StartingDayOfWeek.sunday,
        locale: 'th', // ตั้งค่า locale เป็น 'th' เพื่อให้แสดงภาษาไทย
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          formatButtonShowsNext: false,
          titleTextFormatter: (date, locale) =>
              formatDate(date) + ' พ.ศ. ${date.year + 543}',
        ),
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
              print(_focusedDay);
            });
          }
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
      ),
    );
  }
}
