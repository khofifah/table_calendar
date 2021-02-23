import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarController calendarController = CalendarController();
  var events = {
    DateTime(2021, 2, 22): ['Kerja bakti', 'Arisan'],
    DateTime(2021, 2, 24): ['Checkup', 'Beli obat'],
    DateTime(2021, 2, 25): [
      'Grooming kucing',
      'Beli tanaman',
      'Bersih-bersih kamar',
    ],
  };
  List eventData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table Calendar'),
      ),
      body: Column(
        children: [
          TableCalendar(
            calendarController: calendarController,
            events: events,
            startingDayOfWeek: StartingDayOfWeek.monday,
            availableGestures: AvailableGestures.none,
            initialCalendarFormat: CalendarFormat.month,
            availableCalendarFormats: {
              CalendarFormat.month: 'minggu',
              CalendarFormat.week: 'bulan',
            },
            onDaySelected: (day, events, holidays) {
              setState(() {
                eventData = events;
              });
            },
            // headerVisible: false,
            headerStyle: HeaderStyle(
              decoration: BoxDecoration(
                color: Colors.blue[300],
              ),
              centerHeaderTitle: true,
              leftChevronIcon: Icon(Icons.home),
              headerMargin: EdgeInsets.all(10),
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            calendarStyle: CalendarStyle(
              todayStyle: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
              weekendStyle: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
              todayColor: Colors.yellow,
              selectedColor: Colors.orange,
            ),
          ),
          Column(
            children: eventData.map((e) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                child: Text(e),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
