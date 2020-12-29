import 'package:flutter/material.dart';
import '../res/resources.dart';

class MessageColumn extends StatelessWidget {
  const MessageColumn(
      {Key key,
      this.onTap,
      @required this.title,
      this.icon,
      this.margin,
      this.content: "",
      this.textAlign: TextAlign.start,
      this.style: TextStyles.textDark16,
      this.maxLines: 1,
      this.color: Colors.blue,
      this.isbutton: false})
      : super(key: key);

  final GestureTapCallback onTap;
  final String title;
  final String content;
  final TextAlign textAlign;
  final TextStyle style;
  final int maxLines;
  final Icon icon;
  final EdgeInsets margin;
  final bool isbutton;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            constraints:
                BoxConstraints(minWidth: double.infinity, minHeight: 55.0),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            margin: margin == null ? EdgeInsets.only() : margin,
            child: Padding(
                padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: _buildRowBody())
                    ]))));
  }

  _buildRowBody() {
    return <Widget>[
      Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(28)),
            border: Border.all(width: 0, style: BorderStyle.none),
          ),
          child: icon),
      SizedBox(width: 10),
      Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title, style: style, textAlign: textAlign),
            SizedBox(height: 5),
            Text(title,
                style: TextStyle(color: Colors.grey, fontSize: 14),
                textAlign: textAlign),
          ]),
      Spacer(flex: 2),
    ];
  }
}
