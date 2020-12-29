
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../res/resources.dart';

class MessageAppBar extends StatelessWidget implements PreferredSizeWidget{

  const MessageAppBar({
    Key key,
    this.backgroundColor: Colors.white,
    this.title: "",
    this.centerTitle: "",
    this.actionName: "",
    this.onPressed,
  }): super(key: key);

  final Color backgroundColor;
  final String title;
  final String centerTitle;
  final String actionName;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle _overlayStyle = ThemeData.estimateBrightnessForColor(backgroundColor) == Brightness.dark
        ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: Material(
        color: backgroundColor,
        child: SafeArea(
          child: Stack(
            alignment: Alignment.centerLeft,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: centerTitle.isEmpty ? Alignment.centerLeft : Alignment.center,
                    width: double.infinity,
                    child: Text(
                        title.isEmpty ? centerTitle : title,
                        style: TextStyle(
                          fontSize: Dimens.font_sp18,
                          color: _overlayStyle == SystemUiOverlayStyle.light ? Colors.white : Colours.text_dark,
                        )
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 48.0),
                  )
                ],
              ),
              Positioned(
                right: 0.0,
                child: Theme(
                  data: ThemeData(
                      buttonTheme: ButtonThemeData(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        minWidth: 60.0,
                      )
                  ),
                  child: actionName.isEmpty ? Container() :
                  FlatButton(
                    child: Text(actionName),
                    textColor: _overlayStyle == SystemUiOverlayStyle.light ? Colors.white : Colours.text_dark,
                    highlightColor: Colors.transparent,
                    onPressed: onPressed,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(48.0);
}
