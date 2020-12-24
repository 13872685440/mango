import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '../widgets/state_layout.dart';

class WidgetNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        centerTitle: "页面不存在",
      ),
      body: const StateLayout(
        type: StateType.nopage,
        hintText: "页面不存在",
      ),
    );
  }
}
