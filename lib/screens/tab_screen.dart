import 'package:flutter/material.dart';
import 'package:udemy_meal_app/screens/categories_screen.dart';
import 'package:udemy_meal_app/screens/favorite_screen.dart';
import 'package:udemy_meal_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int _selectedIndex = 0;

  List<Map<String,Object>> _pages = [
    {
      'page':CategoriesScreen(),
      'title': 'Categories'
    },
    {
      'page':FavoriteScreen(),
      'title': 'Favorites'
    },

  ];

  void _selectPage(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text(_pages[_selectedIndex]['title']),
//          bottom: TabBar(
//            tabs: [
//              Tab(
//                icon: Icon(Icons.category),
//                text: "Categories",
//              ),
//              Tab(
//                icon: Icon(Icons.favorite),
//                text: "Favorites",
//              )
//            ],
//          ),
        ),
//        body: TabBarView(
//          children: <Widget>[
//            CategoriesScreen(),
//            FavoriteScreen()
//          ],
//        ),
    drawer: MainDrawer(),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text('Categories')
          ),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.favorite),
              title: Text('Favorites')
          ),
        ],
      ),
    );
  }
}


