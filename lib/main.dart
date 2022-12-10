import 'package:activities/home/home.dart';
import 'package:activities/services/boredService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'services/boredService_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:  ThemeData(
        primarySwatch: Colors.teal,
        primaryColor: Colors.white,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white
      ),
        home: MultiRepositoryProvider(
          providers: [
            RepositoryProvider(
              create: (context) => BoredService(),
            ),
          ],
          child: const Home(),
        ));
  }
}