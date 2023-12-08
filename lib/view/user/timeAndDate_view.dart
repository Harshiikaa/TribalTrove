import 'package:flutter/material.dart';

class TimeAndDateScreen extends StatefulWidget {
  const TimeAndDateScreen({super.key});

  @override
  State<TimeAndDateScreen> createState() => _TimeAndDateScreenState();
}

class _TimeAndDateScreenState extends State<TimeAndDateScreen> {
    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Time: 21:23"),
            SizedBox(
              width: 10,
            ),
            ElevatedButton(onPressed: () {}, child: Text("Change Time")),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Date"),
            SizedBox(
              width: 10,
            ),
            ElevatedButton(onPressed: () {
              
            }, child: Text("Change Date")),
          ],
        ),
      ]),
    );
  }
}
