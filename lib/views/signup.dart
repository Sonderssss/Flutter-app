import 'dart:convert';
import 'package:aniflix/pages/watchpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'home.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _obscureText = true;
  bool _isLoading = false;
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


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
              colors: [Colors.deepPurple, Colors.teal, Colors.blue],
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
                'SIGN UP',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                height: 550,
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
                      'CREATE ACCOUNT',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      '...............',
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
                        controller: emailController,
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
                        controller: usernameController,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          suffixIcon: Icon(
                            Icons.person,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        controller:passwordController,
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
                    ), Center(
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
                    SizedBox(
                      height: 20,
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
                            colors: [Colors.deepPurple, Colors.teal, Colors.blue],
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            'SIGN-UP',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                      _submitForm() ;
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 25.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Or Continue With',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      height: 70,
                      width: 50,
                      child: Image.asset(
                        'assets/googleicon.png',
                      ),
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

  void _submitForm() async {
      final String username = usernameController.text;
      final String email = emailController.text;
      final String password = passwordController.text;

      setState(() {
      _isLoading = true; // Start loading
    });

      Map<String, dynamic> userData = {
        'username': username,
        'email': email,
        'password': password,
      };

      // Convert the data to JSON format
      String jsonData = jsonEncode(userData);

      // Convert your backend API URL string to a Uri object
      Uri apiUrl = Uri.parse('http://127.0.0.1:8000/users/signup/');

      // Make a POST request to your Django backend API, sending info to backend
      try {
        final response = await http.post(
          apiUrl,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonData,
        );

        // if the request is successful
        if (response.statusCode == 201) {
          showDialog(
            context: this.context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Center(child: Text('Account created successfully')),
              );
            },
          );

          // Delay navigation to dashboard by 2 seconds (adjust as needed)
          await Future.delayed(Duration(seconds: 1));
          Get.offAndToNamed("home/");
        } else {
          // Handle other status codes (e.g., display error message)
          print('Failed to register: ${response.body}');
          showDialog(
            context: this.context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Center(child: Text('Registration Failed')),
                content: Text('User with this email already exists.'),
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
        print('Error registering user: $error');
      }finally {
      setState(() {
        _isLoading = false; // Stop loading
      });
  }
    }
  bool _isValidEmail(String email) {
    // validation using RegExp
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}