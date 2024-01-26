// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:learn_flutter_fullstack/src/pages/home/widget/LeaveItem.dart';

class Leave extends StatelessWidget {
  const Leave({super.key});

  @override
  Widget build(BuildContext context) {
    /* return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[100],
          child: const Text("He'd have you all unravel at the"),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[200],
          child: const Text('Heed not the rabble'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[300],
          child: const Text('Sound of screams but the'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[400],
          child: const Text('Who scream'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[500],
          child: const Text('Revolution is coming...'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[600],
          child: const Text('Revolution, they...'),
        ),
      ],
    );*/

    // return Scaffold(
    //    body: Row(
    //      children: [
    //        Container(
    //          color: Colors.amber,
    //          height: 50,
    //          width: 50,
    //        ),
    //        Container(
    //          color: Colors.amber,
    //          height: 50,
    //          width: 50,
    //        ),
    //      ],
    //    ),
    //  );
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              //childAspectRatio: 1 / .4,
              //crossAxisSpacing: 10,
              //mainAxisSpacing: 10,
              mainAxisExtent: 280,
            ),
            itemBuilder: (context, index) => LayoutBuilder(
              builder: (context, BoxConstraints constraints) {
                return LeavDetail(constraints.maxHeight);
              },
            ),
            itemCount: 15,
          ),
        ),
      ],
    );
  }
}
