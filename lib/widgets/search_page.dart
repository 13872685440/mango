import 'package:flutter/material.dart';
import 'package:mango/routers/fluro_navigator.dart';
import 'package:mango/widgets/search_bar.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();

  final hintText;
  final path;
  const Search([this.hintText, this.path]) : super();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar(
        hintText: "请输入" + widget.hintText + "查询",
        onPressed: (text) {
          String path =
              widget.path + '?searchData=${Uri.encodeComponent(text)}';
          NavigatorUtils.push(context, path);
        },
      ),
      body: Container(),
    );
  }
}
