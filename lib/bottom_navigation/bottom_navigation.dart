import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/screens/favourite/favourite.dart';
import 'package:mealapp/screens/home/home.dart';

class TabBottom extends StatefulWidget {
  final List<Meal> favoirteMeals;
  TabBottom({Key? key,required this.favoirteMeals}) : super(key: key);

  @override
  State<TabBottom> createState() => _TabBottomState();
}

class _TabBottomState extends State<TabBottom> {
   List pages =[];
   @override
   void initState() {
     pages=[
        HomeScreen(),
    Favourites(favoirteMeals: widget.favoirteMeals,)
     ];
     super.initState();
     
   }
  int _selectedPageIndex = 0;
  void _selectePage(int value) {
     setState(() {
      _selectedPageIndex =value;

});  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        onTap: _selectePage,
        backgroundColor:Theme.of(context).primaryColor ,
        items: [
          BottomNavigationBarItem(icon:Icon (Icons.category),
         label: 'categories'
          ),
          BottomNavigationBarItem(icon:Icon (Icons.star),
         label: 'favorites'
          )
        ],
      ),
      body: pages[_selectedPageIndex],
    );
  }

  
}