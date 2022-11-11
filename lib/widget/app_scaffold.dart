import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    Key? key,
    Key? scaffoldKey,
    PreferredSizeWidget? appBar,
    Widget? endDrawer,
    required Widget body,
    Color? backgroundColor,
    Widget? bottomNavigationBar,
    bool? resizeToAvoidBottomInset,
    VoidCallback? onWillPop,
  })
      : _scaffoldKey = scaffoldKey,
        _appBar = appBar,
        _endDrawer = endDrawer,
        _body = body,
        _backgroundColor = backgroundColor,
        _bottomNavigationBar = bottomNavigationBar,
        _resizeToAvoidBottomInset = resizeToAvoidBottomInset,
        _onWillPop = onWillPop,
        super(key: key);

  final Key? _scaffoldKey;
  final PreferredSizeWidget? _appBar;
  final Widget? _endDrawer;
  final Widget _body;
  final Color? _backgroundColor;
  final Widget? _bottomNavigationBar;
  final bool? _resizeToAvoidBottomInset;
  final VoidCallback? _onWillPop;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _onWillPop?.call();
        return Navigator.of(context).canPop();
      },
      child: Scaffold(
          key: _scaffoldKey,
          appBar: _appBar,
          endDrawer: _endDrawer,
          endDrawerEnableOpenDragGesture: false,
          body: _body,
          backgroundColor: _backgroundColor,
          bottomNavigationBar: _bottomNavigationBar,
          resizeToAvoidBottomInset: _resizeToAvoidBottomInset,
      ),
    );
  }
}
