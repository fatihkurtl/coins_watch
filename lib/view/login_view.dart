import 'package:flutter/material.dart';
import 'package:wind_chat/core/models/model.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            GlobalModels.navigationIndex.value = 1;
          },
          child: const Text('Go messages'),
        ),
      ),
    );
  }
}
