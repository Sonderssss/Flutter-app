import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'home.dart';
import 'signup.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  //set to true as default
  bool _obscureText = true;
  //function to obscure password
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final TextEditingController loginemailController = TextEditingController();
  final TextEditingController loginpasswordController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.pink, Colors.limeAccent],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                height: 100,
                width: 150,
                
              ),
              Text(
                'WELCOME TO ANIFLIX',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                height: 520,
                width: 325,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30),
                    Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      'Please login with your details',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: loginemailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          suffixIcon: Icon(
                            Icons.email,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: loginpasswordController,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: GestureDetector(
                            onTap: _togglePasswordVisibility,
                            child: Icon(
                              _obscureText ? Icons.visibility : Icons.visibility_off,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                    child: _isLoading
                    ? SpinKitChasingDots(
                        
                        color: Colors.pink,
                        size: 50.0,
                      )
                    : 
                      SizedBox(
                        height: 10,
                      ),
                  ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 40, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Forgot password?',
                            style: TextStyle(color: Colors.blueAccent[700]),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.purple,
                              Colors.pink,
                              Colors.limeAccent,
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        _login();
                      },
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'DONT HAVE AN ACCOUNT? SIGN-UP',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MaterialButton(
                          onPressed: () {
                          Get.toNamed('/Signup');
                          },
                          child: Text('SIGN-UP'),
                          highlightColor: Colors.blueAccent,
                          splashColor: Colors.orangeAccent,
                          color: Colors.purple,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

Future<void> _login() async {
    final String email = loginemailController.text;
    final String password = loginpasswordController.text;

    setState(() {
      _isLoading = true; // Start loading
    });

    // Simulate network request with delay
    await Future.delayed(Duration(seconds: 2));

    // Request body
    final Map<String, dynamic> data = {
      'email': email,
      'password': password,
    };

    // Convert the data to JSON format
    final String jsonData = jsonEncode(data);

    // Replace your backend API URL string with your actual URL
    final Uri apiUrl = Uri.parse('http://127.0.0.1:8000/users/login/');

    try {
      final response = await http.post(
        apiUrl,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonData,
      );

      if (response.statusCode == 200) {
        // If login is successful, navigate to home page
        Get.offAndToNamed("home/");

      } else {
        // Handle invalid login
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Login Failed'),
              content: Text('Invalid email or password.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (error) {
      print('Error logging in: $error');
    }finally {
      setState(() {
        _isLoading = false; // Stop loading
      });
  }
}
}