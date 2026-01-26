import 'package:flutter/material.dart';

extension Nav on BuildContext {
  void push(Widget screen) {
    Navigator.push(this, MaterialPageRoute(builder: (_) => screen));
  }
}
