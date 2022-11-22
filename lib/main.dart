import 'package:beside04_data_manager/di/getx_binding.dart';
import 'package:beside04_data_manager/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: BindingsBuilder(getHomeBinding),
      home: const HomeScreen(),
    );
  }
}
