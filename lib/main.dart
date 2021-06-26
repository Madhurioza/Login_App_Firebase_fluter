import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'login_screen.dart';
import 'singup_screen.dart';
import 'package:provider/provider.dart';
import 'auth.dart';

void main ()=> runApp(MyApp());

class MyApp extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
            value: Auth(),
        )
      ],
        child: MaterialApp(


        title: 'Login App',
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: LoginScreen(),
        routes: {
          SignupScreen.routeName: (ctx) => SignupScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          HomeScreen.routeName: (ctx) => HomeScreen(),
        })
    );

  }


   }

