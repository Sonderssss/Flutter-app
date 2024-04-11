import 'package:flutter/material.dart';

class Sixth extends StatelessWidget {
  const Sixth({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Naruto Story Summary'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/naruto-shippuden.jpg'),
            Text(
              'The Tale of Naruto Uzumaki:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Naruto is a Japanese manga and anime series created by Masashi Kishimoto.'
              'It follows the story of Naruto Uzumaki, a young ninja with dreams of becoming the strongest ninja and the leader of his village, known as the Hokage. '
              'The series is divided into two parts: "Naruto" and "Naruto Shippuden.'
              'In the first part, Naruto trains and goes on missions with his friends Sasuke Uchiha and Sakura Haruno, while also dealing with the challenges of being an outcast in his village. '
              'In "Naruto Shippuden," the story continues as Naruto and his friends face more powerful enemies and uncover the truth about their world. '
              'The series explores themes of friendship, perseverance, and the struggle between good and evil.'
            ),
          ],
        ),
      ),
    );
  }
}
