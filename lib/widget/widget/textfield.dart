import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_project/widget/app_debug.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyTextFormView extends ConsumerStatefulWidget {
  const MyTextFormView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return MyTextFormViewState();
  }

  static Route get route {
    return MaterialPageRoute(builder: (_) {
      return const MyTextFormView();
    });
  }
}

class MyTextFormViewState extends ConsumerState<MyTextFormView> {
  FocusNode focusNode = FocusNode();
  final finishButtonProvider = StateProvider((ref) => false);

  @override
  Widget build(BuildContext context) {
    List<Widget> columnWidget = [
      Expanded(
        child: _scrollableTextField(),
      ),
      _normalToolBar()
    ];
    focusNode.addListener(() {
      AppDebug.log("------");
      final hasfocus = focusNode.hasFocus;
      AppDebug.log("hasfocus$hasfocus");
      ref.read(finishButtonProvider.notifier).state = focusNode.hasFocus;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('テキスト入力'),
      ),
      body: Column(
        children: columnWidget,
      ),
    );
  }

  Widget _scrollableTextField() {
    // ListViewにいれてあげることで、テキストフォームの高さが広がるに応じてスクロールできる
    return ListView(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Colors.pink[100],
              border: Border.all(color: Colors.black),
              borderRadius: const BorderRadius.all(Radius.circular(5.0))),
          child: TextField(
            decoration: const InputDecoration(border: InputBorder.none),
            //テキストフォーム下の下線
            keyboardType: TextInputType.multiline,
            maxLines: null,
            textAlign: TextAlign.left,
            focusNode: focusNode,
          ),
        ),
      ],
    );
  }

  Widget _normalToolBar() {
    return Visibility(
        visible: ref.watch(finishButtonProvider),
        child: Container(
            decoration: BoxDecoration(
                border: const BorderDirectional(
                    top: BorderSide(color: Colors.grey)),
                color: Colors.grey[200]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CupertinoButton(
                  padding: EdgeInsets.symmetric(vertical: 0),
                  child: Text('完了'),
                  onPressed: () {
                    focusNode.unfocus();
                  },
                )
              ],
            )));
  }
}
