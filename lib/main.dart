import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/utils/observer.dart';

import 'app.dart';

void main() {
  Bloc.observer=MyBlocObserver();
  runApp(const MyApp());
}
