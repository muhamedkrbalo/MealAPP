import 'package:flutter/material.dart';
import 'package:mealapp/bottom_navigation/bottom_navigation.dart';
import 'package:mealapp/main_drawer/filters.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/screens/category_meal/category_meal.dart';
import 'package:mealapp/screens/details_meal_screen/details_meal_screen.dart';
import 'package:mealapp/screens/dummy_data.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String ,bool> _filters ={
    'gluten' :false,
    'lactose' :false,
    'vegan' :false,
    'vegetarin' :false,
  };

List<Meal> _availbelMeals = DUMMY_MEALS;
List<Meal> _favoriteMeals =[];
 void _setFilters(Map<String,bool> _filterData){
  setState(() {
    _filters = _filterData;
    _availbelMeals = DUMMY_MEALS.where((meal) {
      if(_filters['gluten']! && meal.isGlutenFree ==false){
        return false;
      }
      if(_filters['lactose']! && meal.isLactoseFree ==false){
        return false;
      } 
      if(_filters['vegan']! && meal.isVegan ==false){
        return false;
      }
       if(_filters['vegetarin']! && meal.isVegetarian ==false){
        return false;
      }
      
   return true;
    }).toList();
  });


}


void _toggleFavorites( String mealId){
 final existingIndex =  _favoriteMeals.indexWhere((meal) => meal.id ==mealId);
 if(existingIndex >=0){
   setState(() {
     _favoriteMeals.removeAt(existingIndex);
   });
 }else{
   _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id ==mealId));
 }
}

bool _isMealFavorite(String id){
return _favoriteMeals.any((meal) => meal.id ==id );
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     
      theme: ThemeData(
        
        primarySwatch: Colors.pink,
        canvasColor: Color.fromRGBO(250, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(
            color: Color.fromRGBO(20, 50 ,50, 1),
          ),
          bodyText2: TextStyle(
            color: Color.fromRGBO(20, 50 ,50, 1),
          ),
          
          
          
        )
      ),
    //  home: HomeScreen(),
      routes: {
        '/':(context)=>TabBottom(favoirteMeals: _favoriteMeals,),
        CategoryMealScreen.routName: (context)=> CategoryMealScreen(availabelMeals :_availbelMeals),
        DetailsMealScreen.routName : (context)=> DetailsMealScreen(toggleFavorites: _toggleFavorites,_favoriteMeals),
        Filters.routName:(context)=>Filters(currentFilters: _filters,  saveFilters: _setFilters,)
      },
    );
  }
}


