import 'package:flutter/material.dart';

class Watchpage extends StatelessWidget {
  Watchpage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GridView.count(
            shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[100],
                child: Image.asset(
                  'assets/choso.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[200],
                child: Image.asset(
                  'assets/Sun.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[300],
                child: Image.asset(
                  'assets/tanjiro.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[400],
                child: Image.asset(
                  'assets/itachi.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[500],
                child: Image.asset(
                  'assets/ichigo.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[600],
                child: Image.asset(
                  'assets/alucard.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
