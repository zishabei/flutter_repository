import 'package:flutter/material.dart';
const double _buttonWidth = 50.0;

Widget appBarDrawerMenuButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 3.0, right: 8.0, bottom: 4.0),
    child: InkWell(
      borderRadius: BorderRadius.circular(10.0),
      onTap: () {},
      child: SizedBox(
        width: _buttonWidth,
        child: Icon(
          Icons.menu_rounded,
          color: Theme.of(context).appBarTheme.titleTextStyle?.color,
        ),
      ),
    ),
  );
}

Widget appBarDeleteButton(
    BuildContext context, VoidCallback deleteButtonClicked) {
  return Padding(
    padding: const EdgeInsets.only(top: 3.0, right: 8.0, bottom: 4.0),
    child: InkWell(
      borderRadius: BorderRadius.circular(10.0),
      onTap: () => deleteButtonClicked(),
      child: Icon(
        Icons.delete,
        color: Theme.of(context).appBarTheme.titleTextStyle?.color,
      ),
    ),
  );
}

Widget appBarBackButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 3.0, left: 8.0, bottom: 4.0),
    child: InkWell(
      borderRadius: BorderRadius.circular(10.0),
      onTap: () => Navigator.of(context).pop(),
      child: SizedBox(
        width: _buttonWidth,
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Theme.of(context).appBarTheme.titleTextStyle?.color,
        ),
      ),
    ),
  );
}

class AppAppBar extends AppBar {
  AppAppBar({
    Key? key,
    required BuildContext context,
    Widget? title,
    Widget? trailing,
    bool automaticallyImplyLeading = true,
  }) : super(
          key: key,
          elevation: 0.5,
          centerTitle: true,
          title: title,
          automaticallyImplyLeading: automaticallyImplyLeading,
          leading: () {
            if (Navigator.of(context).canPop() && automaticallyImplyLeading) {
              return appBarBackButton(context);
            }
            return null;
          }(),
          actions: trailing != null ? [trailing] : null,
        );
}
