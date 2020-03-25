import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/custom_drawer.dart';

import './favourites_screen.dart';
import './categories_screen.dart';

class TabsScreeen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  TabsScreeen(this.favouriteMeals);

  @override
  _TabsScreeenState createState() => _TabsScreeenState();
}

class _TabsScreeenState extends State<TabsScreeen> {
  List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      CategoriesScreen(),
      FavouritesScreen(widget.favouriteMeals),
    ];
  }

  int _pagesIndex = 0;

  void _selectPage(final index) {
    setState(() {
      _pagesIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FreshFood"),
      ),
      drawer: CustomDrawer(),
      body: _pages[_pagesIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: _pagesIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            title: Text("Faviourites"),
          ),
        ],
      ),
    );
  }
}
