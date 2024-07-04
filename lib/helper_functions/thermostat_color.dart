import 'package:flutter/material.dart';

Color? thermostatColor(double temperature, int depth) {
  if (temperature >= 19 && temperature < 20) {
    return Colors.lightBlue[depth];
  } else if (temperature >= 20 && temperature <= 29) {
    return Colors.green[depth];
  } else if (temperature >= 30 && temperature <= 40) {
    return Colors.orange[depth];
  } else if (temperature >= 41) {
    return Colors.red[depth];
  } else {
    return Colors.blue[depth];
  }
}
