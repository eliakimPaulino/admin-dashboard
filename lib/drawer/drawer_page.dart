// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../constants.dart';
import '../responsive_layout.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Constants.kPadding),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  'Admin Menu',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: ResponsiveLayout.isComputer(context)
                    ? null
                    : IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close, color: Colors.white)),
              ),
              // here, we create a list of widget so we need to add the ... to tell flutter that is a list instead of creating another column.
              ...List.generate(
                _buttonNames.length,
                (index) => Column(
                  children: [
                    Container(
                      decoration: index == _currentIndex
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                colors: [
                                  Constants.redDark.withOpacity(0.9),
                                  Constants.orangeDark.withOpacity(0.9),
                                ],
                              ),
                            )
                          : null,
                      child: ListTile(
                        title: Text(
                          _buttonNames[index].title,
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.all(Constants.kPadding),
                          child: Icon(
                            _buttonNames[index].icon,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    // Divider(color: Colors.white, thickness: 0.1),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonsInfo {
  String title;
  IconData icon;
  ButtonsInfo({
    required this.title,
    required this.icon,
  });
}

int _currentIndex = 0;

List<ButtonsInfo> _buttonNames = [
  ButtonsInfo(title: 'Home', icon: Icons.home),
  ButtonsInfo(title: 'User', icon: Icons.supervised_user_circle_rounded),
  ButtonsInfo(title: 'Notification', icon: Icons.notifications),
  ButtonsInfo(title: 'Contacts', icon: Icons.contact_phone_rounded),
  ButtonsInfo(title: 'Marketing', icon: Icons.mark_email_read),
  ButtonsInfo(title: 'Sales', icon: Icons.sell),
  ButtonsInfo(title: 'Security', icon: Icons.verified_user_rounded),
  ButtonsInfo(title: 'Settings', icon: Icons.settings),
];
