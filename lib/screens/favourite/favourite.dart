import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';

class Favourites extends StatefulWidget {
   final List<Meal> favoirteMeals;
  Favourites({Key? key,required this.favoirteMeals}) : super(key: key);

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Favourite'),
      ),
      body: Center(
        child: Text('You have no faovorites yet - start adding some!'),
      ),
    );
  }
}