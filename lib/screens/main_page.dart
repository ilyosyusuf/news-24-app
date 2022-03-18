import 'package:flutter/material.dart';
import 'package:newsprogroup/core/colors/mycolor.dart';
import 'package:newsprogroup/core/constants/icon_const.dart';
import 'package:newsprogroup/screens/news_page.dart';
import 'package:newsprogroup/screens/saved.dart';
import 'package:newsprogroup/screens/search_page.dart';
import 'package:newsprogroup/screens/settings.dart';
import 'package:newsprogroup/widgets/app_bar_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> with TickerProviderStateMixin {
  TabController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
    setState(() {});
  }

  int index = 0;
  int value1 = 0;
  int value2 = 1;
  int value3 = 2;
  int value4 = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: TabBarView(controller: _controller, children: const [
              NewsPage(),
              SearchPage(),
              SavedNews(),
              SettingsPage(),
            ]),
          )
        ],
      ),
      bottomNavigationBar: TabBar(
          onTap: ((value) {
            setState(() {
              index = value;
            });
          }),
          indicatorSize: TabBarIndicatorSize.label,
          padding: EdgeInsets.all(14),
          controller: _controller,
          indicatorColor: Colors.white,
          labelColor: Colors.green,
          unselectedLabelColor: ColorConst.kWhite,
          
          tabs: [
            Tab(
              icon: index == value1 ? IconConst.homedark : IconConst.home,
            ),
            Tab(
              icon: index == value2 ? IconConst.searchdark : IconConst.search,
            ),
            Tab(
              icon: index == value3 ? IconConst.saveddark : IconConst.saved,
            ),
            Tab(
              icon:
                  index == value4 ? IconConst.settingsdark : IconConst.settings,
            ),
          ]),
    );
  }
}