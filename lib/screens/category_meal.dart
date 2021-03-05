import 'package:flutter/material.dart';
import 'package:udemy_meal_app/models/meal.dart';
import 'package:udemy_meal_app/screens/meal_details.dart';
import 'package:udemy_meal_app/utils/dummy_data.dart';
import 'package:udemy_meal_app/widgets/main_drawer.dart';

class CategoryMeal extends StatelessWidget {

  final String categoryTitle;
  final String categoryId;


  CategoryMeal(this.categoryTitle, this.categoryId);

  @override
  Widget build(BuildContext context) {
    final List<Meal> categoryMeals = DUMMY_MEALS.where((element)  {
        return element.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      drawer: MainDrawer(),
      body: ListView.builder(
        itemCount: categoryMeals.length,
          itemBuilder: (context,index){
            return MealItem(categoryMeals[index]);
          })
    );
  }
}

class MealItem extends StatelessWidget {
  final Meal meal;

  MealItem(this.meal);

  void selectMeal(){
  }

  String getComplexity(Complexity complexity){
    switch(complexity){
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';

    }
  }

  String getAffordability(Affordability affordability){
    switch(affordability){
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        return 'Unknown';

    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => MealDetails(meal)));
        },
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ),
          elevation: 4,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  ClipRRect(borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)
                  ),
                    child: Image.network(meal.imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    right: 20,
                    bottom: 20,
                    child: Container(
                      width: 200,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      color: Colors.black54,
                      child: Text(meal.title,
                        style: TextStyle(color: Colors.white,fontSize: 20),
                        softWrap: true,
//                      overflow: TextOverflow.visible,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.schedule),
                        SizedBox(width: 6,),
                        Text('${meal.duration} mins')
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.work),
                        SizedBox(width: 6,),
                        Text(getComplexity(meal.complexity))
                      ],
                    ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.attach_money_rounded),
                          SizedBox(width: 6,),
                          Text(getAffordability(meal.affordability))
                        ],
                      ),

                  ],
                ),
              )
            ],
          ),
        ));
  }
}

