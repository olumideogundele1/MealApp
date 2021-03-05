import 'package:flutter/material.dart';
import 'package:udemy_meal_app/screens/filter_meal_screen.dart';
import 'package:udemy_meal_app/screens/tab_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            color: Theme.of(context).accentColor,
            child: Text("Cooking Up!",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.black
              ),
            ),
          ),
          buildListTile(
              "Meals",
              Icons.restaurant,
              (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => TabsScreen()));
              }
          ),
          buildListTile(
              'Filters',
              Icons.settings,
                  (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => FilterScreen()));
              }
          )
        ],
      ),
    );
  }

  ListTile buildListTile( String title, IconData iconData, Function onTapHandler) {
    return ListTile(
          leading: Icon(iconData,size: 26,),
          title: Text(
            title,
            style: TextStyle(
              fontFamily: 'RobotoCodensed',
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
          ),
          onTap: onTapHandler,
        );
  }
}