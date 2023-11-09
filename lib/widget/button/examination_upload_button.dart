import 'package:flutter/material.dart';
import 'package:flutter_project/gen/assets/assets.gen.dart';
import 'package:flutter_project/widget/app_debug.dart';

class ExaminationUploadButton extends StatelessWidget {
  const ExaminationUploadButton({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(50.0),
      child: Ink(
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF63C54B), Color(0xFF3FB592)],
            ),
            borderRadius: BorderRadius.circular(50.0)),
        child: InkWell(
          borderRadius: BorderRadius.circular(50.0),
          child: Container(
              alignment: Alignment.center,
              width: 300,
              height: 54,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.examinationCancer.image(width: 25, height: 25),
                  const SizedBox(width: 6),
                  Text(
                    "健康診断結果を登録する",
                    style: textTheme.titleMedium?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              )),
          onTap: () {
            AppDebug.log("-------------");
          },
        ),
      ),
    );
  }
}
