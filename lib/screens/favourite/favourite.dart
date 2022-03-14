import 'package:flutter/material.dart';

import 'package:mealapp/models/meal.dart';
import 'package:mealapp/screens/main_drawer/main_drawer.dart';

import '../details_meal_screen/details_meal_screen.dart';

class Favourites extends StatefulWidget {
 
   final List<Meal> favoirteMeals;
  Favourites({Key? key,required this.favoirteMeals}) : super(key: key);

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  
  @override
  Widget build(BuildContext context) {
    if(widget.favoirteMeals.isEmpty){
      return Scaffold(
        drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Your Favourite'),
      ),
      body: Center(
        child: Text('You have no faovorites yet - start adding some!'),
      ),
    );
  
    }else{
      return  ListView.builder(itemBuilder: (context,index){
        return InkWell(
          onTap: (){
            Navigator.of(context).pushNamed(DetailsMealScreen.routName,
            arguments: widget.favoirteMeals[index].id
             
           
            );
          },
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)
                      ),
                      child: Image.network(widget.favoirteMeals[index].imageUrl,width: double.infinity,fit: BoxFit.cover,),
                    ),
        
                    Positioned(
                      bottom: 20,
                      right: 10,
                      child: Container(
                        color: Colors.black54,
                        width: MediaQuery.of(context).size.width*0.6,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                          child: Text(widget.favoirteMeals[index].title,style: TextStyle(fontSize: 26,color: Colors.white),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                          ),
                        ),
                      ),
                    ),
                    
                  ],
                ),
                Card(
                margin: EdgeInsets.all(0.0),
                  elevation: 3,
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.schedule),
                              SizedBox(width: 6,),
                              Text( "${widget.favoirteMeals[index].duration.toString()} min")
                            ],
                          ),
                         Row(
                            children: [
                              Icon(Icons.work),
                              SizedBox(width: 6,),
                              Text( "Simpel")
                            ],
                          ),
                         Row(
                            children: [
                              Icon(Icons.attach_money),
                              SizedBox(width: 6,),
                              Text( "${widget.favoirteMeals[index].duration.toString()} min")
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
      itemCount: widget.favoirteMeals.length,
      )
  ;
    }
    }
}