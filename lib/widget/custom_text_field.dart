import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/widget/app_appbar.dart';
import 'package:flutter_project/widget/app_scaffold.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key}) : super(key: key);

  static Route get route {
    return MaterialPageRoute(builder: (_) {
      return const CustomTextField();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppAppBar(
        context: context,
        title: const Text(
          "自定义TextField",
        ),
      ),
      body: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: () {},
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Positioned(
                    top: 0,
                    bottom: 0,
                    right: 4,
                    child: Icon(
                      Icons.arrow_drop_down_sharp,
                      color: Colors.grey,
                    )),
                Container(
                  width: 220,
                  height: 20,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.5)),
                  child: TextField(
                    scrollPadding: EdgeInsets.all(0),
                    controller: TextEditingController(),
                    style: Theme.of(context).textTheme.bodyText2,
                    enabled: false,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      fillColor: Colors.transparent,
                      hintText: "選択してください",
                      border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(0))),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
