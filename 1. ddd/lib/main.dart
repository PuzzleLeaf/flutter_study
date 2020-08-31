import 'package:domain_driven/injection.dart';
import 'package:domain_driven/presentation/core/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

//flutter pub run build_runner watch --delete-conflicting-outputs
void main() {
  configureInjection(Environment.prod);
  runApp(AppWidget());
}
