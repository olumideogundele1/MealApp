import 'package:flutter/material.dart';
import 'package:udemy_meal_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Map<String,bool> _filters = {
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false
  };

  void _setFilters(Map<String,bool> filterData){
      setState(() {
        _filters = filterData;
      });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Meal'),
      ),
      drawer: MainDrawer(),
      body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection. ',
                style: Theme.of(context).textTheme.title,
              )
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  buildSwitchListTile(
                      'Gluten-free',
                      'Only include Gluten - free meals',
                          _glutenFree,
                          (newValue) {
                        setState(() {
                          _glutenFree = newValue;
                        });
                      }
                  ),
                  buildSwitchListTile(
                      'Vegan-free',
                      'Only include Vegan - free meals',
                      _vegan,
                          (newValue) {
                        setState(() {
                          _vegan = newValue;
                        });
                      }
                  ),buildSwitchListTile(
                      'Vegetarian-free',
                      'Only include Vegetarian - free meals',
                      _vegetarian,
                          (newValue) {
                        setState(() {
                          _vegetarian = newValue;
                        });
                      }
                  ),buildSwitchListTile(
                      'Lactose-free',
                      'Only include Lactose - free meals',
                      _lactoseFree,
                          (newValue) {
                        setState(() {
                          _lactoseFree = newValue;
                        });
                      }
                  )
                ],
              ),
            )
          ],
      ),
    );
  }

  SwitchListTile buildSwitchListTile(String title,String subTitle,bool currentValue,Function onChanged) {
    return SwitchListTile(
                  title: Text(title),
                  value: currentValue,
                  subtitle: Text(subTitle),
                  onChanged: onChanged
                );
  }
}
