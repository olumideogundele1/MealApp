import 'package:flutter/material.dart';
import 'package:udemy_meal_app/models/meal.dart';
import 'package:udemy_meal_app/widgets/main_drawer.dart';

class MealDetails extends StatelessWidget {
  final Meal meal;
  MealDetails(this.meal);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Ingredients",
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              Container(
                height: 200,
                width: 300,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: ListView.builder(
                    itemCount: meal.ingredients.length,
                    itemBuilder: (context,index){
                      return Card(
                        color: Theme.of(context).accentColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(meal.ingredients[index]),
                        ),
                      );
                    }),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Steps",
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              Container(
                height: 200,
                width: 300,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: ListView.builder(
                    itemCount: meal.steps.length,
                    itemBuilder: (context,index){
                      return Card(
                        color: Colors.white,
                        child: Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                  child: Text("# ${index + 1}")),
                              title: Text(meal.steps[index]),
                            ),
                            SizedBox(height: 10,)
                          ],
                        ),
                      );
                    }),
              ),
          ],
        ),
      )
    );
  }
}
