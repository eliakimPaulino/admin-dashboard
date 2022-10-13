// ignore_for_file: prefer_const_constructors

import 'package:admin_dashboard/logic/app_bar_widget.dart';
import 'package:admin_dashboard/panels/center/panel_center_page.dart';
import 'package:admin_dashboard/responsive_layout.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'drawer/drawer_page.dart';
import 'panels/left/panel_left_page.dart';
import 'panels/right/panel_right_page.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: (ResponsiveLayout.isTinyLimit(context) ||
                ResponsiveLayout.isTinyHeightLimit(context))
            ? Container()
            : AppBarWidget(),
      ),
      body: ResponsiveLayout(
        tiny: Container(),
        phone: _currentIndex == 0
            ? PanelLeftPage()
            : _currentIndex == 1
                ? PanelCenterPage()
                : PanelRightPage(),
        tablet: Row(children: [
          Expanded(child: PanelLeftPage()),
          Expanded(child: PanelCenterPage()),
        ]),
        largeTablet: Row(children: [
          Expanded(child: PanelLeftPage()),
          Expanded(child: PanelCenterPage()),
          Expanded(child: PanelRightPage()),
        ]),
        computer: Row(children: [
          Expanded(child: DrawerPage()),
          Expanded(child: PanelLeftPage()),
          Expanded(child: PanelCenterPage()),
          Expanded(child: PanelRightPage()),
        ]),
      ),
      drawer: const DrawerPage(),
      bottomNavigationBar: ResponsiveLayout.isPhone(context)
          ? CurvedNavigationBar(
              index: _currentIndex,
              buttonBackgroundColor: Colors.white,
              backgroundColor: Colors.transparent,
              // backgroundColor: Constants.purpleLight,
              items: _icons,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            )
          : SizedBox(),
    );
  }
}

int _currentIndex = 1;

List<Widget> _icons = [
  Icon(Icons.add, size: 30.0),
  Icon(Icons.list, size: 30.0),
  Icon(Icons.compare, size: 30.0),
];
