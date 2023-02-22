import 'package:flutter/material.dart';
import 'package:flutter_project/widget/app_debug.dart';

class CustomMaterialButton extends StatefulWidget {
  const CustomMaterialButton({Key? key}) : super(key: key);

  @override
  State<CustomMaterialButton> createState() => _CustomMaterialButtonState();
}

class _CustomMaterialButtonState extends State<CustomMaterialButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.green,
      borderRadius: BorderRadius.circular(5.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
            alignment: Alignment.center,
            width: 300,
            height: 40,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
            child: const Text("custom material button")),
        onTap: () {
          AppDebug.log("-------------");
        },
      ),
    );
  }
}
