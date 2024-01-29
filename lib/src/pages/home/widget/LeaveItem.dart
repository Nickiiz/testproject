// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:learn_flutter_fullstack/src/constants/api.dart';
import 'package:learn_flutter_fullstack/src/models/product.dart';
import 'package:learn_flutter_fullstack/src/pages/home/widget/image_not_found.dart';
import 'package:learn_flutter_fullstack/src/pages/home/widget/leave.dart';
import 'package:learn_flutter_fullstack/src/utils/format.dart';

class LeavDetail extends StatelessWidget {
  final double maxHeight;
  final Product product;

  const LeavDetail(this.maxHeight, this.product);

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

  Padding _buildImage(context) {
    //final height = maxHeight * 100;
    final productImage = product.image;
    double? x = MediaQuery.of(context).size.width * 0.3;
    // const leaveImage = 'assets/images/image5.png';
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
              width: double.infinity,
              height: x,
              child: productImage!.isNotEmpty
                  ? Image.network('${API.IMAGE_URL}/$productImage')
                  : ImmageNotFound()),
          // Image.asset(
          //   leaveImage,
          //   height: x,
          //   width: x,
          // ),
          // _buildOutOfStock(),
          Card(
            color: Colors.amber,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text('สิทธิ์การลา',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  _buildInfo() => Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${formatCurrency.format(product.stock)}',
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    //overflow: TextOverflow.ellipsis,
                  ),
                  Text('${formatCurrency.format(product.stock)} '),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text(
                //   '฿${formatCurrency.format(11111)}',
                // ),
                // Text('${formatNumber.format(0)}pieces'),
                Text('ใช้วันลาไป'),
                Text('วัน')
              ],
            )
          ],
        ),
      );

  // Positioned _buildOutOfStock() => Positioned(
  //       right: 1,
  //       top: 40,
  //       child: Card(
  //         color: Colors.amber,
  //         child: Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  //           child:
  //               Text('หมดแล้ว', style: TextStyle(fontWeight: FontWeight.bold)),

  //         ),
  //       ),
  //     );
}
