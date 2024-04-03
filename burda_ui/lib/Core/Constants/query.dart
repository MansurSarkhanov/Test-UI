import 'package:flutter/material.dart';

double mediaQuery(context, {double height = 1}) {
  return MediaQuery.of(context).size.height * height;
}
