// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../charts/right_panel_chart.dart';
import '../../constants.dart';

class PanelRightPage extends StatefulWidget {
  PanelRightPage({Key? key}) : super(key: key);

  @override
  State<PanelRightPage> createState() => _PanelRightPage();
}

class _PanelRightPage extends State<PanelRightPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
                top: Constants.kPadding / 2,
                bottom: Constants.kPadding,
              ),
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Constants.purpleLight,
                child: Container(
                  width: double.infinity,
                  child: ListTile(
                    title: Text(
                      'Net Revenue',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      '7% of Sales Avg.',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Chip(
                      label: Text(
                        r'$ 46,560',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            LineChartSample2(),
            Padding(
              padding: const EdgeInsets.only(
                left: Constants.kPadding / 2,
                right: Constants.kPadding / 2,
                bottom: Constants.kPadding,
              ),
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Constants.purpleLight,
                child: Column(
                  children: List.generate(
                    _products.length,
                    (index) => SwitchListTile.adaptive(
                      title: Text(
                        _products[index].name,
                        style: TextStyle(color: Colors.white),
                      ),
                      value: _products[index].enabled,
                      onChanged: (newValue) {
                        setState(() {
                          _products[index].enabled = newValue;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  String name;
  bool enabled;
  Product({
    required this.name,
    required this.enabled,
  });
}

List<Product> _products = [
  Product(name: 'LED Submersiable Lights', enabled: true),
  Product(name: 'Portable Projector', enabled: true),
  Product(name: 'Bluetooth Speaker', enabled: true),
  Product(name: 'Smart Watch', enabled: true),
  Product(name: 'Temporary Tattos', enabled: true),
  Product(name: 'Bookends', enabled: true),
  Product(name: 'Vegetable Chooper', enabled: true),
  Product(name: 'Neck Message', enabled: true),
  Product(name: 'Facial Cleanser', enabled: true),
  Product(name: 'Back Cushion', enabled: true)
];
