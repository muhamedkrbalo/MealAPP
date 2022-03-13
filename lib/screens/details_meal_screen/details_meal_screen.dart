import 'package:flutter/material.dart';
import 'package:mealapp/screens/dummy_data.dart';

class DetailsMealScreen extends StatelessWidget {
  final  toggleFavorites; 
    static const routName = 'details_meal';
  const DetailsMealScreen({Key? key,required this.toggleFavorites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id== mealId);
  
    return Scaffold(
       floatingActionButton: FloatingActionButton(
         child: Icon(Icons.delete),
        onPressed: toggleFavorites
        ),
      appBar: AppBar(title: Text(selectedMeal.title),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(selectedMeal.imageUrl,fit: BoxFit.cover,),
            ),
      
            Container(
              
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text('Ingredients',style:TextStyle(fontSize:20 ,fontFamily: 'RobotoCondensed',fontWeight: FontWeight.bold)),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 150,
              width: 300,
              decoration: BoxDecoration(
               // color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)
              ),
              child: ListView.builder(
                itemBuilder: (ctx,index)=>Card(
                  color: Colors.amber,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                    child: Text(selectedMeal.ingredients[index]),
                  )),
                itemCount: selectedMeal.ingredients.length,
                ),
            ),
            SizedBox(height: 15,),
              Container(
              
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text('Steps',style:TextStyle(fontSize:20 ,fontFamily: 'RobotoCondensed',fontWeight: FontWeight.bold)),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 150,
              width: 300,
              decoration: BoxDecoration(
               // color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)
              ),
              child: ListView.builder(
                itemBuilder: (ctx,index)=>Column(
                  children: [
                    ListTile(
                  leading:CircleAvatar(
                    child: Text('# ${index+1}'),
                  ) ,
                  title: Text(selectedMeal.steps[index]),

                ),
                Divider()
                  ],
                ),
                itemCount: selectedMeal.steps.length,
                ),
            ),
            
          ],
        ),
      ),
    );
  }
}



