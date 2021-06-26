import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'http_exception.dart';
class Auth with ChangeNotifier {


  Future<void> signUp(String email, String password) async
  {
    const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCpaCJb0O85p0lHyY8gnNtL7KPNauzCFys';

    try{
      final response = await http.post(url, body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,


          }
      ));

      final responseData = json.decode(response.body);
      //print(responseData);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }

    }catch(error)
    {
        throw error;
    }

  }

  Future<void> login(String email, String password) async
  {
    const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithCustomToken?key=AIzaSyCpaCJb0O85p0lHyY8gnNtL7KPNauzCFys';

    try {
      final response = await http.post(url, body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,


          }
      ));

      final responseData = json.decode(response.body);
      // print(responseData);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
    } catch (error) {
      throw error;
    }
  }
}
