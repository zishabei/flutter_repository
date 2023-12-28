import 'package:flutter/material.dart';

class LogoRotate extends StatefulWidget {
  const LogoRotate({super.key});

  static Route get route {
      return MaterialPageRoute(builder: (_) {
        return const LogoRotate();
      });
    }

  @override
  State<LogoRotate> createState() => LogoRotateState();
}

class LogoRotateState extends State<LogoRotate> {
  double turns = 0.0;

  void _changeRotation() {
    setState(() => turns += 1.0 / 8.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen1'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: _changeRotation,
            child: const Text('Rotate Logo'),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: AnimatedRotation(
              turns: turns,
              duration: const Duration(seconds: 1),
              child: const FlutterLogo(),
            ),
          ),
        ],
      ),
    );
  }
}
