import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/screens/details_meal_screen/details_meal_screen.dart';

class CategoryMealScreen extends StatefulWidget {
  final Complexity? complexity;

  static const routName= 'ctegory_meals';
  final List<Meal> availabelMeals;
  CategoryMealScreen({Key? key, this.complexity, required this.availabelMeals, }) : super(key: key);



  String get complexityText{
  switch(complexity){
    case Complexity.Simple: return 'Simple';break;
    case Complexity.Challenging: return 'Challenging'; break;
    case Complexity.Hard: return 'Hard'; break;
    default: return 'unKnown'; break;

  }
  
}





  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String? categoryTitel;
  List<Meal>?categoryMeals;

  

  @override
  void didChangeDependencies() {
   final routeArg = ModalRoute.of(context)?.settings.arguments as Map<String,String>;
     final categoryId = routeArg['id'];
   categoryTitel = routeArg['titel'];
     categoryMeals =widget.availabelMeals.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }
  @override
  void initState() {
     
    
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
   


   
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitel!),
      ),
      body: ListView.builder(itemBuilder: (context,index){
        return InkWell(
          onTap: (){
            Navigator.of(context).pushNamed(DetailsMealScreen.routName,
            arguments: categoryMeals![index].id
            ).then((result) {
               if(result !=null){
                setState(() {
                  categoryMeals?.removeWhere((meal) => meal.id == result );
                });
               }
            }   
           
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
                      child: Image.network(categoryMeals![index].imageUrl,width: double.infinity,fit: BoxFit.cover,),
                    ),
        
                    Positioned(
                      bottom: 20,
                      right: 10,
                      child: Container(
                        color: Colors.black54,
                        width: MediaQuery.of(context).size.width*0.6,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                          child: Text(categoryMeals![index].title,style: TextStyle(fontSize: 26,color: Colors.white),
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
                              Text( "${categoryMeals![index].duration.toString()} min")
                            ],
                          ),
                         Row(
                            children: [
                              Icon(Icons.work),
                              SizedBox(width: 6,),
                              Text( "${widget.complexityText}")
                            ],
                          ),
                         Row(
                            children: [
                              Icon(Icons.attach_money),
                              SizedBox(width: 6,),
                              Text( "${categoryMeals![index].duration.toString()} min")
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
      itemCount: categoryMeals!.length,
      ),
    );
  }
}