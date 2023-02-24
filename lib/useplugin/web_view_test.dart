import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/widget/app_debug.dart';
import 'package:webview_flutter/webview_flutter.dart';

late WebViewController _controller; // WebVewコントローラー

class WebViewTest extends StatelessWidget {
  const WebViewTest({Key? key}) : super(key: key);

  static Route get route {
    return MaterialPageRoute(builder: (_) {
      return const WebViewTest();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView滚动底部监听'),
      ),
      body: WebView(
        // onWebViewCreatedはWebViewが生成された時に行う処理を記述できます
        onWebViewCreated: (WebViewController webViewController) async {
          _controller = webViewController; // 生成されたWebViewController情報を取得する
          await _loadHtmlFromAssets(); // HTMLファイルのURL（ローカルファイルの情報）をControllerに追加する処理
        },
        javascriptMode: JavascriptMode.unrestricted,
        javascriptChannels: {
          JavascriptChannel(
              name: 'FLUTTER_CHANNEL',
              onMessageReceived: (message) {
                if (message.message.toString() == "end of scroll") {
                  AppDebug.log("end of scroll");
                }
              })
        },
        gestureNavigationEnabled: true,
        debuggingEnabled: true,
      ),
    );
  }

  /// HTMLファイルを読み込む処理
  Future _loadHtmlFromAssets() async {
    //　HTMLファイルを読み込んでHTML要素を文字列で返す
    String fileText = await rootBundle.loadString('assets/test.html');
    // <WebViewControllerのloadUrlメソッドにローカルファイルのURI情報を渡す>
    // WebViewControllerはWebViewウィジェットに情報を与えることができます。
    // <Uri.dataFromStringについて>
    // パラメータで指定されたエンコーディングまたは文字セット（指定されていないか認識されない場合はデフォルトでUS-ASCII）
    // を使用してコンテンツをバイトに変換し、結果のデータURIにバイトをエンコードします。
    _controller.loadUrl(Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}
