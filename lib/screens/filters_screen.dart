import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function setFilters;
  final Map<String, bool> filters;
  FiltersScreen(this.setFilters, this.filters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree;
  var _isLactoseFree;
  var _isVegetarian;
  var _isVegan;

  @override
  void initState() {
    super.initState();
    _isGlutenFree = widget.filters['gluten'];
    _isLactoseFree = widget.filters['lactose'];
    _isVegetarian = widget.filters['vegetarian'];
    _isVegan = widget.filters['vegan'];
  }

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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              Map<String, bool> filterValue = {
                'gluten': _isGlutenFree,
                'lactose': _isLactoseFree,
                'vegetarian': _isVegetarian,
                'vegan': _isVegan,
              };
              widget.setFilters(filterValue);
            },
          ),
        ],
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
            'Lactos-Free',
            'Only include lactose-free meals.',
            _isLactoseFree,
            (newValue) => setState(
              () {
                _isLactoseFree = newValue;
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
