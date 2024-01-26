// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:learn_flutter_fullstack/src/utils/format.dart';

class LeavDetail extends StatelessWidget {
  final double maxHeight;
  const LeavDetail(
    this.maxHeight,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('sdfsdgf');
      },
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            _buildImage(context),
            _buildInfo(),
          ],
        ),
      ),
    );
  }

  Column _buildImage(context) {
    //final height = maxHeight * 100;
    double? x = MediaQuery.of(context).size.width * 0.4;
    const leaveImage = 'assets/images/image2.png';
    return Column(
      children: [
        Image.asset(
          leaveImage,
          height: x,
          width: x,
        ),
        //_buildOutOfStock(),
        Card(
          color: Colors.amber,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child:
                Text('หมดแล้ว', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }

  _buildInfo() => Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'fgfdsgddfggds',
                maxLines: 2,
                textAlign: TextAlign.center,
                //overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '฿${formatCurrency.format(11111)}',
                ),
                Text('${formatNumber.format(0)}pieces'),
              ],
            )
          ],
        ),
      );
  /*
  Positioned _buildOutOfStock() => Positioned(
        right: 1,
        top: 40,
        child: Card(
          color: Colors.amber,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child:
                Text('หมดแล้ว', style: TextStyle(fontWeight: FontWeight.bold)),

          ),
        ),
      );
      */
}
