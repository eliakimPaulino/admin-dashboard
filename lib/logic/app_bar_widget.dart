import 'package:flutter/material.dart';
import '../constants.dart';
import '../responsive_layout.dart';

class AppBarWidget extends StatefulWidget {
  AppBarWidget({Key? key}) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.purpleLight,
      child: Row(
        children: [
          if (ResponsiveLayout.isComputer(context))
            Container(
              margin: const EdgeInsets.all(Constants.kPadding),
              height: double.infinity,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    offset: Offset(0, 0),
                    spreadRadius: 1,
                    blurRadius: 10,
                  ),
                ],
                shape: BoxShape.circle,
              ),
              child: const CircleAvatar(
                backgroundColor: Colors.pink,
                radius: 30.0,
                // child: Image.asset('assets/images/avatar1.png'),
              ),
            )
          else
            IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu),
              iconSize: 30.0,
              color: Colors.white,
            ),
          //------------------------------------------------\\
          const SizedBox(width: Constants.kPadding),
          //------------------------------------------------\\
          const Spacer(),
          if (ResponsiveLayout.isComputer(context))
            ...List.generate(
              _buttonsNames.length,
              (index) => TextButton(
                onPressed: () {
                  setState(() {
                    _currenteSelectedButton = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(Constants.kPadding * 2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        _buttonsNames[index],
                        style: TextStyle(
                          color: _currenteSelectedButton == index
                              ? Colors.white
                              : Colors.white70,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(Constants.kPadding / 2),
                        width: 60.0,
                        height: 2.0,
                        decoration: BoxDecoration(
                          gradient: _currenteSelectedButton == index
                              ? const LinearGradient(
                                  colors: [
                                    Constants.redDark,
                                    Constants.orangeDark
                                  ],
                                )
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.all(Constants.kPadding * 2),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _buttonsNames[_currenteSelectedButton],
                      style: const TextStyle(color: Colors.white),
                    ),
                    Container(
                      margin: const EdgeInsets.all(Constants.kPadding / 2),
                      width: 60.0,
                      height: 2.0,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                        colors: [Constants.redDark, Constants.orangeDark],
                      )),
                    ),
                  ]),
            ),
          const Spacer(),
          IconButton(
            color: Colors.white,
            iconSize: 30,
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          Stack(
            children: [
              IconButton(
                color: Colors.white,
                iconSize: 30,
                onPressed: () {},
                icon: const Icon(Icons.notifications_none_outlined),
              ),
            ],
          ),
          if (!ResponsiveLayout.isPhone(context))
            Container(
              margin: const EdgeInsets.all(Constants.kPadding),
              height: double.infinity,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    offset: Offset(0, 0),
                    spreadRadius: 1,
                    blurRadius: 10,
                  )
                ],
                shape: BoxShape.circle,
              ),
              child: const CircleAvatar(
                backgroundColor: Constants.orangeDark,
                radius: 30.0,
                // child: Image.asset('assets/images/avatar1.png'),
              ),
            ),
        ],
      ),
    );
  }
}

List<String> _buttonsNames = ['Overview', 'Revenue', 'Sales', 'Control'];
int _currenteSelectedButton = 0;
