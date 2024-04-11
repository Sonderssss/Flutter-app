import 'package:flutter/material.dart';

class Fourth extends StatelessWidget {
  const Fourth({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The god of Highschool'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/goh.jpeg'),
            Text(
              'GOH:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '"The God of High School" focuses on Jin Mo-Ri, a 17-year-old martial artist from Seoul, South Korea. He is invited to join a tournament, sponsored by an unknown, mysterious organization, to select martial artists for an even bigger tournament. The competition spans the globe, seeking the most skillful warrior. However, the true nature of the tournaments remains shrouded in mystery.\n\n'
              'It all began as a fighting tournament to seek out the best fighter among all high school students in Korea. Mori Jin, a Taekwondo specialist and high school student, soon learns that there is something much greater beneath the stage of the tournament.\n\n'
              'The action anime follows high school student Jin Mori and his friends as they compete in an epic tournament, borrowing power directly from the gods. Along the way, they uncover a mysterious organization that promises to grant any wish to the tournament\'s winner. With the allure of their deepest desires coming true, these young men and women will stop at nothing to ensure their victory.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
