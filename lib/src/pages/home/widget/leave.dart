// ignore_for_file: prefer_const_constructors, unused_element

import 'package:dio/dio.dart';
import 'package:learn_flutter_fullstack/src/config/route.dart' as custom_route;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_flutter_fullstack/src/models/product.dart';
import 'package:learn_flutter_fullstack/src/pages/home/widget/LeaveItem.dart';
import 'package:learn_flutter_fullstack/src/service/network_service.dart';

class Leave extends StatefulWidget {
  const Leave({super.key});

  @override
  State<Leave> createState() => _LeaveState();
}

class _LeaveState extends State<Leave> {
  final _spacing = 4.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildNetwork(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, custom_route.Route.management)
              .then((value) {
            setState(() {});
          });
        },
        child: FaIcon(FontAwesomeIcons.plus),
      ),
    );

    // return Column(
    //   children: [
    //     Expanded(
    //       child: GridView.builder(
    //         padding: EdgeInsets.all(_spacing),
    //         shrinkWrap: true,
    //         scrollDirection: Axis.vertical,
    //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //           crossAxisCount: 2,
    //           //childAspectRatio: 1 / .4,
    //           //crossAxisSpacing: 10,
    //           //mainAxisSpacing: 10,
    //           mainAxisExtent: 280,
    //         ),
    //         itemBuilder: (context, index) => LayoutBuilder(
    //           builder: (context, BoxConstraints constraints) {
    //             return LeavDetail(constraints.maxHeight);
    //           },
    //         ),
    //         itemCount: 6,
    //       ),
    //     ),
    //   ],
    // );
  }

  FutureBuilder<List<Product>> _buildNetwork() {
    return FutureBuilder<List<Product>>(
      future: NetworkService().getAllProduct(0),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Product>? product = snapshot.data;
          if (product == null || product.isEmpty) {
            return Container(
              margin: EdgeInsets.only(top: 22),
              alignment: Alignment.topCenter,
              child: Text('No data'),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              setState(() {});
            },
            child: _buildProductGridView(product),
          );
        }
        if (snapshot.hasError) {
          return Container(
            margin: EdgeInsets.only(top: 22),
            alignment: Alignment.topCenter,
            child: Text((snapshot.error as Dio).options.baseUrl),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  GridView _buildProductGridView(List<Product> products) {
    return GridView.builder(
      padding: EdgeInsets.only(
        left: _spacing,
        right: _spacing,
        top: _spacing,
        bottom: 150,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: _spacing,
        mainAxisSpacing: _spacing,
      ),
      itemBuilder: (context, index) => LayoutBuilder(
        builder: (context, BoxConstraints constraints) {
          final product = products[index];
          return LeavDetail(constraints.maxHeight, product
              // product
              // onTap: () {
              //   // Navigator.pushNamed(
              //   //   context,
              //   //   custom_route.Route.management,
              //   //   arguments: product,
              //   // ).then((value) {
              //   //   setState(() {});
              //   // });
              // },
              );
        },
      ),
      itemCount: products.length,
    );
  }
}
