import 'dart:io';

import 'package:consumo_servicos/FutureTeste.dart';
import 'package:consumo_servicos/MyHttpOverrides.dart';
import 'package:flutter/material.dart';

import 'Home.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MaterialApp(
    home: FutureTeste(),
  ));
}
