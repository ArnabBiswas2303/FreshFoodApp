import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isVegetarian = false;
  var _isVegan = false;
  var _isLactosFree = false;

  Widget _buildSwitchList(
    String title,
    String subTitle,
    bool value,
    Function onChangeHandler,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: value,
      onChanged: onChangeHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: const CustomDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text(
                'Adjust Your Meal Selection',
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ),
          _buildSwitchList(
            'Gulten-Free',
            'Only include gluten-free meals.',
            _isGlutenFree,
            (newValue) => setState(
              () {
                _isGlutenFree = newValue;
              },
            ),
          ),
          _buildSwitchList(
            'Lactose-Free',
            'Only include lactose-free meals.',
            _isLactosFree,
            (newValue) => setState(
              () {
                _isLactosFree = newValue;
              },
            ),
          ),
          _buildSwitchList(
            'Vegetarian',
            'Only include vegetarian meals.',
            _isVegetarian,
            (newValue) => setState(
              () {
                _isVegetarian = newValue;
              },
            ),
          ),
          _buildSwitchList(
            'Vegan',
            'Only include vegan meals.',
            _isVegan,
            (newValue) => setState(
              () {
                _isVegan = newValue;
              },
            ),
          ),
        ],
      ),
    );
  }
}
