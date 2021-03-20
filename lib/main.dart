import 'package:appdatn/blocs/simple_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'screen/mainlogin.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false,
      home: MainLogin()),
  );
}
