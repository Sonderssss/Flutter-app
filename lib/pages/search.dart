import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  TextEditingController _searchController = TextEditingController();
  String _searchResult = '';

  Future<void> _search() async {
    final String query = _searchController.text;
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/users/search/'));

    if (response.statusCode == 200) {
      setState(() {
        _searchResult = jsonDecode(response.body)['result'];
      });
    } else {
      setState(() {
        _searchResult = 'Error: ${response.statusCode}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text('Search Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Enter your search query',
              ),
            ),
            ElevatedButton(
              onPressed: _search,
              child: Text('Search'),
            ),
            SizedBox(height: 20),
            Text(
              _searchResult,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

