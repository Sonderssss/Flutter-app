import 'package:flutter/material.dart';

class Fifth extends StatelessWidget {
  const Fifth({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jujutsu Kaisen'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/jujutsu-kaisen.jpeg'),
            Text(
              'Jujutsu Kaisen:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Jujutsu Kaisen, written and illustrated by Gege Akutami, first debuted as a manga series in 2018. Its explosive popularity led to the adaptation of an anime series by the renowned animation studio MAPPA, which aired in late 2020. The series quickly garnered a massive fanbase worldwide due to its compelling storyline, unique characters, and stunning animation.\n\n"
              "The story revolves around Yuji Itadori, a high school student with exceptional physical abilities. After the death of his grandfather, Yuji finds himself drawn into the world of Jujutsu Sorcery when he comes into contact with a cursed object—a rotting finger imbued with an ancient curse. Unbeknownst to him, swallowing this cursed finger leads to his possession by Ryomen Sukuna, a powerful and evil Cursed Spirit from the past.\n\n"
              "To prevent Sukuna's resurrection and the chaos he could bring to the world, Yuji joins the Tokyo Metropolitan Jujutsu Technical High School, commonly known as Jujutsu High. He trains to become a Jujutsu Sorcerer there, dedicating his life to exorcising Cursed Spirits and protecting humanity from supernatural threats.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
