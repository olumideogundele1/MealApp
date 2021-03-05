import 'package:flutter/material.dart';
import 'package:udemy_meal_app/utils/dummy_data.dart';
import 'package:udemy_meal_app/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
          padding: const EdgeInsets.all(15),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20
          ),
        children: DUMMY_CATEGORIES.map(
                (x) => CategoryItem(
                  id: x.id,
                  color: x.color,
                  title: x.title,
                ))
            .toList()
    );
  }
}
