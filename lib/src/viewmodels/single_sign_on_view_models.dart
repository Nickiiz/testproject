import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SingleSingOn {
  final IconData icon;
  final Color backgroundColors;
  final VoidCallback onPress;

  SingleSingOn({
    required this.icon,
    required this.backgroundColors,
    required this.onPress,
  });
}

class SingleSignOnViewModel {
  List<SingleSingOn> get items => <SingleSingOn>[
        SingleSingOn(
          icon: FontAwesomeIcons.apple,
          backgroundColors: Colors.black,
          onPress: () {},
        ),
        SingleSingOn(
          icon: FontAwesomeIcons.google,
          backgroundColors: Colors.red,
          onPress: () {},
        ),
        SingleSingOn(
          icon: FontAwesomeIcons.facebook,
          backgroundColors: Colors.blue,
          onPress: () {},
        ),
        SingleSingOn(
          icon: FontAwesomeIcons.line,
          backgroundColors: Colors.green,
          onPress: () {},
        ),
      ];
}
