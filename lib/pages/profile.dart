import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  String userEmail = '';
  @override
  void initState() {
    super.initState();
    fetchUserEmail();
  }

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
              const SizedBox(
                height: 10.0,
              ),
              Container(
                height: 590,
                width: 325,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: 
                      Text('YOUR PROFILE PAGE',
                      style: 
                      TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      child: Icon(
                        Icons.person,
                        size: 92,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text('Email: $userEmail',style: TextStyle(color: Colors.black),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> fetchUserEmail() async {
    try {
      final Uri url = Uri.parse('http://127.0.0.1:8000/api/get_current_user_email/');
      final response = await http.post(
          url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
        );
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body); // Parse JSON response
        setState(() {
          userEmail = responseBody['email'];
        });
      } else {
        setState(() {
          userEmail = 'Error fetching email';
        });
      }
    } catch (e) {
      setState(() {
        userEmail = 'Error: $e';
      });
    }
  }
}

