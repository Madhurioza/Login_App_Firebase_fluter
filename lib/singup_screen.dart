import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/auth.dart';
import 'package:flutter_login/home_screen.dart';
import 'package:flutter_login/login_screen.dart';
import'login_screen.dart';
import'package:provider/provider.dart';
class SignupScreen extends StatefulWidget{
  static const routeName = '/singup';
  @override
  _SignupScreenState createState() => _SignupScreenState();

}





class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _passwordController = new TextEditingController();
  Map<String , String > _authData ={
    'email' : '',
    'password' : ''
  };


  void _showErrorDialog(String msg)
  {
    showDialog(context: context,
        builder : (ctx)=> AlertDialog(
          title: Text('Error Occur'),
          content: Text('msg'),
          actions: <Widget>[
            FlatButton(
              child: Text('ok'),
              onPressed: (){
                Navigator.of(ctx).pop();
              },
            )
          ],
        )
    );


  }
  Future<void> _submit() async
  {
    if(!_formKey.currentState.validate())
      {
        return;
      }
    _formKey.currentState.save();

    try{
      await Provider.of<Auth>(context, listen: false).signUp(
          _authData['email'],
          _authData['password']
      );
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);

    }catch(error){
      var errorMessage = 'Authentication Failed';
      _showErrorDialog(errorMessage);

    }



  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp'),

        actions: <Widget>[
          FlatButton(
              child: Row(
                children: <Widget>[
                  Text('Login'),
                  Icon(Icons.person)
                ],
              ),
              textColor: Colors.white,
              onPressed: ()
              {
                Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
              }),

        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.limeAccent,
                      Colors.redAccent,
                    ]
                )
            ),
          ),
          Center(
            child:  Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),

              ),
              child: Container(
                height: 300,
                width: 300,
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget> [
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Email'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value)
                          {
                            if(value.isEmpty || !value.contains('@'))
                            {
                              return 'invalid email';
                            }
                            return null;
                          },
                          onSaved: (value)
                          {
                              _authData['email'] = value;
                          },
                        ),



                        TextFormField(
                            decoration: InputDecoration(labelText: 'password'),
                            obscureText: true,
                            controller: _passwordController,
                            validator: (value)
                            {
                              if(value.isEmpty || value.length<=5)
                              {
                                return 'invalid password';

                              }
                              return null;
                            },
                            onSaved: (value)
                            {
                                _authData['password'] = value;
                            }
                        ),

                        TextFormField(
                            decoration: InputDecoration(labelText: 'confirm password'),
                            obscureText: true,
                            validator: (value)
                            {
                              if(value.isEmpty || value != _passwordController.text)
                              {
                                return 'invalid confirm password';

                              }
                              return null;
                            },
                            onSaved: (value)
                            {

                            }
                        ),
                        SizedBox(
                          height: 30,

                        ),
                        RaisedButton(
                          child: Text(
                              'submit'
                          ),
                          onPressed: ()
                          {
                            _submit();
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          color:  Colors.blue,
                          textColor: Colors.white,


                        )

                      ],
                    ),
                  ),

                ),

              ),
            ),
          )

        ],
      ),
    );
  }

}

