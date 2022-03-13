import 'package:flutter/material.dart';
import 'package:mealapp/main_drawer/main_drawer.dart';
import 'package:mealapp/screens/category_meal/category_meal.dart';
import 'package:mealapp/screens/dummy_data.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(title: Text('Meal'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
          children: DUMMY_CATEGORIES.map((catData) =>
          InkWell( 
            borderRadius: BorderRadius.circular(20),
              splashColor:Theme.of(context).primaryColor,
            onTap:(){
              Navigator.of(context).pushNamed(CategoryMealScreen.routName,
              arguments: {
                'id':catData.id,
                'titel': catData.title
              }
              );
            
            } ,
            child: Container(
              padding: EdgeInsets.all(20),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Text(catData.title,style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed'
              ),),
              decoration: BoxDecoration(
                color: catData.color,
                borderRadius: BorderRadius.circular(20)
              ),
          
            ),
          ),
          
           ).toList(),
           gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
             maxCrossAxisExtent: 200,
             childAspectRatio: 3/2,
             crossAxisSpacing: 10,
              mainAxisSpacing: 10 
           ) ,
        ),
      ),
    );
  }
}