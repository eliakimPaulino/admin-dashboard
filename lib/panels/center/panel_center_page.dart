import 'package:flutter/material.dart';

import '../../charts/center_panel_chart.dart';
import '../../constants.dart';

class PanelCenterPage extends StatefulWidget {
  PanelCenterPage({Key? key}) : super(key: key);

  @override
  State<PanelCenterPage> createState() => _PanelCenterPage();
}

class _PanelCenterPage extends State<PanelCenterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: Constants.kPadding / 2,
                top: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
              ),
              child: Card(
                color: Constants.purpleLight,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Container(
                  width: double.infinity,
                  child: const ListTile(
                    title: Text(
                      'Products Avaiable',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      '0.2% of the products avail.',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    trailing: Chip(
                      label: Text(
                        '20,589',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: Constants.kPadding / 2,
                top: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
                bottom: Constants.kPadding,
              ),
              child: Card(
                color: Constants.purpleLight,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: List.generate(
                    _persons.length,
                    (index) => ListTile(
                      leading: CircleAvatar(
                        radius: 15.0,
                        backgroundColor: _persons[index].color,
                        child: Text(
                          _persons[index].name.substring(0, 1),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        _persons[index].name,
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.message, color: Colors.white)),
                    ),
                  ),
                ),
              ),
            ),
            BarChartSample2(),
          ],
        ),
      ),
    );
  }
}

class Person {
  String name;
  Color color;
  Person({
    required this.name,
    required this.color,
  });
}

List<Person> _persons = [
  Person(name: 'Eliakim Paulino', color: Constants.orangeLight),
  Person(name: 'Giulia Paulino', color: Constants.redLight),
  Person(name: 'Benson Machado', color: Constants.blueLight),
  Person(name: 'Natalia Machado', color: Constants.greenLight),
  Person(name: 'Rogerio Rosa', color: Constants.orangeDark),
  Person(name: 'Amanda Affini', color: Constants.redDark),
  Person(name: 'Rosenary Meire', color: Constants.redLight),
];
