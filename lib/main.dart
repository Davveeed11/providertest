import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'feature/data/todoProvider.dart';
import 'feature/presentation/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => TodolistProvider(),
        child: MyHomePage(),
      ),
    );
  }
}
