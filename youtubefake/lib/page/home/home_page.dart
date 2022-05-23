import 'package:flutter/material.dart';
import 'package:youtubefake/widget/home_widgets/appbar_home.dart';
import 'package:youtubefake/widget/home_widgets/body_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 70),
          child: AppBarHome(
            func: () {
              isExpanded = !isExpanded;
              setState(() {});
            },
          )),
      body: BodyHomePage(
        isExpand: isExpanded,
      ),
    );
  }
}
