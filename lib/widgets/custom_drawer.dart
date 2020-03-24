import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/filters_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key key}) : super(key: key);

  Widget _buildListTile(
      String tileName, IconData tileIcon, Function routeHandler) {
    return ListTile(
      leading: Icon(
        tileIcon,
        size: 25,
      ),
      title: Text(
        tileName,
        style: TextStyle(
          fontFamily: 'Robotocondensed',
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: routeHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            color: Theme.of(context).accentColor,
            child: Text(
              "Cooking Menu!",
              style: GoogleFonts.acme(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 9,
          ),
          _buildListTile(
            "Meals",
            Icons.restaurant,
            () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          _buildListTile(
            "Filters",
            Icons.settings,
            () => Navigator.of(context)
                .pushReplacementNamed(FiltersScreen.routeName),
          ),
        ],
      ),
    );
  }
}
