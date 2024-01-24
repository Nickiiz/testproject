// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_declarations, prefer_function_declarations_over_variables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_flutter_fullstack/src/viewmodels/single_sign_on_view_models.dart';

class SingleSingOn extends StatelessWidget {
  const SingleSingOn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildDivider(),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.06,
        ),
        _buildSingleSignOnButton(),
      ],
    );
  }

  Row _buildDivider() {
    final gradientColor = const [Colors.white10, Colors.white];
    final line = (List<Color> colors) => Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0.0, 1.0],
            ),
          ),
          width: 90,
          height: 1,
        );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        line(gradientColor),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'or',
            style: TextStyle(
                color: Colors.white60,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        line(
          gradientColor.reversed.toList(),
        ),
      ],
    );
  }

  Padding _buildSingleSignOnButton() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: SingleSignOnViewModel()
              .items
              .map(
                (item) => FloatingActionButton(
                  heroTag: item.icon.toString(),
                  onPressed: item.onPress,
                  backgroundColor: item.backgroundColors,
                  child: FaIcon(
                    item.icon,
                    color: Colors.white,
                  ),
                ),
              )
              .toList(),
        ),
      );
}
