import 'package:flutter/material.dart';
import 'package:github.daveshuckerow.chat.flt/src/module/module.dart';
import 'package:github.daveshuckerow.chat.flt/src/ui/app.dart';

void main() {
  service = new ServiceLocator.fake();
  runApp(new MyApp());
}
