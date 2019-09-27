import 'package:flutter/material.dart';
import 'package:mango/res/resources.dart';
import 'package:mango/routers/fluro_navigator.dart';

class AppItem extends StatelessWidget {
  const AppItem(
      {Key key,
      @required this.title,
      this.style: TextStyles.textDark16,
      this.fontCode,
      this.fontFamily: "Feather",
      @required this.path,
      this.color: Colors.blue,
      this.width: 60.0,
      this.height: 60.0,
      this.circular: 10.0})
      : super(key: key);

  final String title;

  final TextStyle style;

  final num fontCode;

  final String fontFamily;

  final String path;

  final Color color;

  final double width;

  final double height;

  final double circular;

  @override
  Widget build(BuildContext context) {
    if (title.isEmpty) {
      return Expanded(
        flex: 1,
        child: Container(
            child: Column(children: <Widget>[
          Text(title, style: style, textAlign: TextAlign.start)
        ])),
      );
    } else {
      return Expanded(
        flex: 1,
        child: Container(
            child: Column(children: <Widget>[
          SizedBox(
              width: width,
              height: height,
              child: GestureDetector(
                  onTap: () => {NavigatorUtils.push(context, path)},
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.all(
                          Radius.circular(circular),
                        )),
                    child: Icon(IconData(fontCode, fontFamily: fontFamily),
                        color: Colors.white),
                  ))),
          Text(title, style: style, textAlign: TextAlign.start)
        ])),
      );
    }
  }
}
