import 'package:flutter/material.dart';

class CS2AppBar extends AppBar {
  CS2AppBar({super.key, double elevation = 1})
      : super(
          elevation: elevation,
          centerTitle: false,
          title: const Text(
            'Counter-Strike',
            style: TextStyle(
              fontFamily: 'cs',
              color: Colors.white,
            ),
          ),
        );
}
