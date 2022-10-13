// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:admin_dashboard/responsive_layout.dart';
import '../../charts/left_panel_chart.dart';
import '../../constants.dart';

class PanelLeftPage extends StatefulWidget {
  const PanelLeftPage({Key? key}) : super(key: key);

  @override
  State<PanelLeftPage> createState() => _PanelLeftPageState();
}

class _PanelLeftPageState extends State<PanelLeftPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (ResponsiveLayout.isComputer(context))
            Container(
              color: Constants.purpleLight,
              width: 50,
              child: Container(
                decoration: const BoxDecoration(
                  color: Constants.purpleDark,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                  ),
                ),
              ),
            ),
          // const _LineChart(isShowingMainData: false),
          SingleChildScrollView(
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
                          'Products Sold',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                        subtitle: Text(
                          '18% of Products Sold',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        trailing: Chip(
                          label: Text(
                            '4,500',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const LineChartSample1(),
                const PieChartSample2(),
                Padding(
                  padding: const EdgeInsets.only(
                    left: Constants.kPadding / 2,
                    right: Constants.kPadding / 2,
                    top: Constants.kPadding / 2,
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
                        _toDo.length,
                        (index) => CheckboxListTile(
                            title: Text(_toDo[index].name,
                                style: const TextStyle(color: Colors.white)),
                            value: _toDo[index].enable,
                            onChanged: (newValue) {
                              setState(() {
                                _toDo[index].enable = newValue ?? true;
                              });
                            }),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ToDo {
  String name;
  bool enable;
  ToDo({
    required this.name,
    required this.enable,
  });
}

List<ToDo> _toDo = [
  ToDo(name: 'Purchase Paper', enable: true),
  ToDo(name: 'Refil the inventory of speakers', enable: true),
  ToDo(name: 'Hire', enable: true),
  ToDo(name: 'Marketing Strategy', enable: true),
  ToDo(name: 'Selling Furniture', enable: true),
  ToDo(name: 'Finish the disclosure', enable: true),
];
