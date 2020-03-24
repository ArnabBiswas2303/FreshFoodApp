import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/filters';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: const CustomDrawer(),
      body: Center(
        child: const Text('Filters'),
      ),
    );
  }
}
