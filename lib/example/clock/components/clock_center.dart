import 'package:flutter/material.dart';

class ClockCenter extends StatelessWidget {
  const ClockCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[300],
          boxShadow: [
            const BoxShadow(
                color: Colors.white, offset: Offset(0, 0), blurRadius: 3.0),
            BoxShadow(
                color: Colors.grey[400]!,
                offset: const Offset(1.5, 1.5),
                blurRadius: 3.0),
          ]),
    );
  }
}
