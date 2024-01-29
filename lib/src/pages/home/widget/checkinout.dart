// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CheckInCheckOut extends StatefulWidget {
  const CheckInCheckOut({super.key});

  @override
  State<CheckInCheckOut> createState() => _CalendarState();
}

class _CalendarState extends State<CheckInCheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset(
                      'assets/images/image3.jpeg', // ระบุ path ของรูปภาพ
                      width: MediaQuery.of(context).size.width *
                          1, // กำหนดความกว้างของรูป
                      height: MediaQuery.of(context).size.width *
                          1, // กำหนดความสูงของรูป
                      fit: BoxFit
                          .cover, // ให้รูปภาพปรับขนาดให้พอดีกับกล่องที่กำหนด
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          print('sfsdfsdf');
                        },
                        child: Text('Check  IN'),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green[400]),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Check OUT'),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.red[400]),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
