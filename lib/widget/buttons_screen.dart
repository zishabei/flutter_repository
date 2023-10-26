import 'package:flutter/material.dart';

import 'button/examination_upload_button.dart';

class ButtonsScreen extends StatefulWidget {
  const ButtonsScreen({super.key});

  static Route get route {
    return MaterialPageRoute(builder: (_) {
      return const ButtonsScreen();
    });
  }

  @override
  State<ButtonsScreen> createState() => _ButtonsScreenState();
}

class _ButtonsScreenState extends State<ButtonsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('按钮'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [ExaminationUploadButton()],
        ),
      ),
    );
  }
}
