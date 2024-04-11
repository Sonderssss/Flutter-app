import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'dart:convert';
import '../customs/customcards.dart';
import 'package:http/http.dart' as http;
class Watchpage extends StatefulWidget {
  Watchpage({super.key});

  @override
  State<Watchpage> createState() => _WatchpageState();
}

class _WatchpageState extends State<Watchpage> {

  List<Data> dataList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse('http://127.0.0.1:8000/anime/listings/'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          dataList = data.map((json) => Data.fromJson(json)).toList();
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomCards(
            heading: 'Jujutsu Kaisen', 
            image: 'assets/choso-jujutsu-kaisen.png', 
            description: 'Get to know more about cursed energy', 
            ontap: () {Get.toNamed('/jujutsu');  },
          ),
          CustomCards(
            heading: 'Castlevania', 
            image: 'assets/alucard.jpeg', 
            description: 'Get to know more about cursed energy', 
            ontap: () {Get.toNamed('/castlevania');  },
          ),
          CustomCards(
            heading: 'Bleach', 
            image: 'assets/ichigo.jpeg', 
            description: 'Get to know more about cursed energy', 
            ontap: () {Get.toNamed('/bleach');  },
          ),
          CustomCards(
            heading: 'Naruto', 
            image: 'assets/itachi.jpeg', 
            description: 'Get to know more about cursed energy', 
            ontap: () { Get.toNamed('/naruto'); },
          ),
          CustomCards(
            heading: 'Solo Leveling', 
            image: 'assets/Sun.jpg', 
            description: 'Get to know more about cursed energy', 
            ontap: () { Get.toNamed('/goh'); },
          ),CustomCards(
            heading: 'Demon Slayer', 
            image: 'assets/tanjiro.jpeg', 
            description: 'Get to know more about cursed energy', 
            ontap: () { Get.toNamed('/demon'); },
          ),
          // Dynamically generated CustomCards widgets
        ...dataList.map((data) {
          return CustomCards(
            heading: data.title,
            image: data.image,
            description: data.description,
            ontap: () {
              // Handle tap event
            },
            isNetworkImage: true,
          );
        }).toList(),
        ],
      ),
    );
  }
}

class Data {
  final String title;
  final String description;
  final String image;

  Data({required this.title, required this.description, required this.image});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      title: json['title'],
      description: json['description'],
      image: json['image'],
    );
  }
}
