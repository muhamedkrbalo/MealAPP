import 'package:flutter/material.dart';
import 'package:mealapp/screens/main_drawer/main_drawer.dart';


class Filters extends StatefulWidget {
  static const routName = '/filters';
 
  final  Function  saveFilters;
  final Map<String,bool> currentFilters;

    Filters(  {Key? key,required this.saveFilters,required this.currentFilters}) : super(key: key);

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  SwitchListTile buildswitch(
      {String? titel,
      String? subtitiel,
      bool? currentValue,
      void Function(bool)? updateValue}) {
    return SwitchListTile(
        subtitle: Text(subtitiel!),
        title: Text(titel!,style: TextStyle(fontWeight: FontWeight.bold),),
        value: currentValue!,
        onChanged: updateValue);
  }

   bool _isGlutenFree = false;
  bool isLactoseFree = false;
   bool isVegan = false;
   bool isVegetarian = false;

   @override
  void initState() {
 _isGlutenFree = widget.currentFilters['gluten']!;
  isLactoseFree = widget.currentFilters['lactose']!;
   isVegan = widget.currentFilters['vegan']!;
   isVegetarian =  widget.currentFilters['vegetarin']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        actions: [
         IconButton(onPressed:(){
           final Map<String, bool> selectedFilters={
           'gluten' :_isGlutenFree,
              'lactose' :isLactoseFree,
            'vegan' :isVegan,
            'vegetarin' :isVegetarian,
  };
           widget.saveFilters(selectedFilters);
           
           print("gggggg");
  
         },
         
         
          icon: Icon(Icons.save))
        ],
        title: Text('Your Filters'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text(
                'Adjiust your meal selection',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontFamily:'RobotoCondensed',fontSize: 20 ),
              ),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildswitch(
                  titel: 'Gluten-free',
                  subtitiel: 'Only include gluten-free meals',
                  currentValue: _isGlutenFree,
                  updateValue: (newValue) {
                    setState(() {
                       _isGlutenFree =newValue;
                    });
                  
                  }),
                    buildswitch(
                  titel: 'LactoseFree',
                  subtitiel: 'Only include lactoseFree meals',
                  currentValue: isLactoseFree,
                  updateValue: (newValue) {
                    setState(() {});
                     isLactoseFree =newValue;
                  }),
                    buildswitch(
                  titel: 'Vegetarian',
                  subtitiel: 'Only include vegetarian meals',
                  currentValue: isVegetarian,
                  updateValue: (newValue) {
                    setState(() {});
                   isVegetarian  =newValue;
                  }),
                    buildswitch(
                  titel: 'Vegan',
                  subtitiel: 'Only include vegan meals',
                  currentValue: isVegan,
                  updateValue: (newValue) {
                    setState(() {});
                    isVegan  =newValue;
                  }),
            ],
          )),
        ],
      ),
    );
  }
}
