import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     appBar: AppBar(
       title: Text('Home Screen'),

     ),
     body: Center(
       child: Text('This Is My Home Screen' , style: TextStyle(
         fontWeight: FontWeight.bold,
         fontSize: 20,
       ),
       ),
     )
   );
  }
  
}