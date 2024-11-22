import 'package:flutter/material.dart';
import '../styles/style.dart';

CheckboxThemeData checkboxThemeData = CheckboxThemeData(
  fillColor: MaterialStateProperty.all(Style.primary),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(6),
  ),
  side: const BorderSide(color: Style.primary),
);