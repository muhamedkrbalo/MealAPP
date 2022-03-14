import 'package:flutter/material.dart';

import 'package:mealapp/screens/main_drawer/filters.dart';

class MainDrawer extends StatefulWidget {
  MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(children: [
          Container(
            color: Colors.amber,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(20),
            height: 120,
            width: double.infinity,
            child: Text('Cooking Up!',style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Theme.of(context).primaryColor
            ),),
            
          ),
          SizedBox(height: 20,),
          buildListTitel(
            titel:'Meal',
            icon: Icons.restaurant,
            onTap: (){Navigator.of(context).pushReplacementNamed('/');}
          ),
          SizedBox(height: 20,),
          buildListTitel(
            titel:'Filters',
            icon: Icons.settings,
           onTap: (){Navigator.of(context).pushReplacementNamed(Filters.routName);}
          )
        ],),
    
      ),
    );
  }

  ListTile buildListTitel(
   { final String? titel,
   required final IconData icon,
   required final void Function() onTap
    }
  ) {
    return ListTile(
      onTap: onTap,
      
          leading: Icon(icon,size: 26,),
          title: Text(titel!,style: TextStyle(
            fontSize: 24,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold
          ),),
          
        );
  }
}