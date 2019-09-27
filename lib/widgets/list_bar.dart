import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mango/res/resources.dart';
import 'package:mango/routers/fluro_navigator.dart';
import 'package:mango/util/image_utils.dart';
import 'package:mango/views/app_router.dart';

class ListBar extends StatelessWidget implements PreferredSizeWidget {
  const ListBar(
      {Key key,
      this.backgroundColor: Colors.white,
      this.title: "",
      this.backImg: "assets/images/ic_back_black.png",
      this.isBack: true,
      this.isSearch: true,
      this.isAdd: true,
      this.hintText,
      this.path})
      : super(key: key);

  final Color backgroundColor;
  final String title;
  final String backImg;
  final bool isBack;
  final bool isSearch;
  final bool isAdd;
  final String hintText;
  final String path;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,
          style: TextStyle(
            fontSize: Dimens.font_sp18,
            color: Colours.text_dark,
          )),
      centerTitle: true,
      brightness: Brightness.light,
      elevation: 0.0,
      backgroundColor: Colors.white,
      actions: <Widget>[
        isSearch
            ? IconButton(
                onPressed: () {
                  String pathto = AppRouter.searchPage +
                      '?hintText=${Uri.encodeComponent(hintText)}&path=${Uri.encodeComponent(path)}';
                  NavigatorUtils.push(context, pathto);
                },
                icon: loadAssetImage(
                  "search",
                  width: 24.0,
                  height: 24.0,
                ),
              )
            : Gaps.empty,
        isAdd
            ? IconButton(
                onPressed: () {},
                icon: loadAssetImage(
                  "add",
                  width: 24.0,
                  height: 24.0,
                ),
              )
            : Gaps.empty
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(48.0);
}
