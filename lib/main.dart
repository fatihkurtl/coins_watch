import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wind_chat/core/components/bottom_navigation.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Coins Watch",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: "Nunito",
      ),
      defaultTransition: Transition.native,
      home: const BottomNavigation(),
    ),
  );
}
