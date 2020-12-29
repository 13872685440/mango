
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../res/resources.dart';
import 'package:loading_indicator_view/loading_indicator_view.dart';

class ProgressDialog extends Dialog{

  ProgressDialog({
    Key key,
    this.hintText
  }) : super(key: key);

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          height: 88.0,
          width: 120.0,
          decoration: ShapeDecoration(
              color: Colors.grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BallSpinFadeLoaderIndicator(),
              Gaps.vGap8,
              Text(hintText, style: TextStyle(color: Colors.white),)
            ],
          ),
        ),
      ),
    );
  }
}