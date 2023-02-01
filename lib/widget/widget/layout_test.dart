import 'package:flutter/material.dart';

class LayoutTest extends StatelessWidget {
  const LayoutTest({Key? key}) : super(key: key);

  static Route get route {
    return MaterialPageRoute(builder: (_) {
      return const LayoutTest();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('テキストlayout'),
      ),
      body: Center(
        child: Container(
          color: Colors.green[200],
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(onPressed: () {}, child: Text("1111")),
              ElevatedButton(onPressed: () {}, child: Text("2222")),
              Flexible(
                flex: 2,
                  child: Container(
                color: Colors.red[400],
              )),
              LayoutBuilder(
                builder: (context, constraint) {
                  print("constraint:$constraint");
                  return FlutterLogo(
                    size: 180,
                  );
                },
              ),
              Expanded(
                  child: Container(
                color: Colors.red[400],
              )),
              FlutterLogo(
                size: 60,
              )
            ],
          ),
        ),
      ),
    );
  }
}
