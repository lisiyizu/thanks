import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WritingTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WritingTabState();
}

class _WritingTabState extends State<WritingTab>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                CupertinoButton(
                  child: Icon(Icons.mood),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
