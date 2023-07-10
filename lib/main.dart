import 'package:challenge_it_flutter/app/views/home/home_binding.dart';
import 'package:challenge_it_flutter/app/views/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Location App',
        initialBinding: HomeBinding(),
        home: const SafeArea(child: HomePage()));
  }
}
