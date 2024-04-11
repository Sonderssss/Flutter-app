import 'package:flutter/material.dart';

class First extends StatelessWidget {
  const First({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bleach Story Summary'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/Bleach 2.jpg'),
            Text(
              'The Story of Bleach:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'The hero is a teenage boy named Ichigo. He lives in a Japanese town called Karakura, he can see ghosts, when he was 8 his mother died before his eyes and he\'s been traumatized ever since.\n\n'
              'One night, Ichigo and what\'s left of his family are attacked by an evil spirit. A soul reaper named Rukia comes to the rescue, but is injured. Rukia gives soul reaper-powers to Ichigo who uses them to defeat the evil spirit.\n\n'
              'So now Ichigo is a soul reaper protecting Karakura from evil spirits, and Rukia is his mentor.\n\n'
              'Then one night, other soul reapers come to Karakura and take Rukia back to the afterlife where she will be executed for giving powers to a human.\n\n'
              'Ichigo rallies his friends, including his love interest Orihime who has special powers, and Uryu who\'s a kind of spirit-German.\n\n'
              'Ichigo and his friends invade the afterlife and rescue Rukia from execution. But it turns out the whole thing was orchestrated by an evil soul reaper named Aizen.\n\n'
              'Aizen escapes to the evil spirit-homeworld, and Rukia is pardoned for her crime.\n\n'
              'Aizen builds an army of evil spirits, they kidnap Orihime and force her to use her special powers to build a weapon known as a Hōgyoku.\n\n'
              'Ichigo and his friends invade the evil spirit-homeworld to rescue Orihime, but the Hōgyoku is completed before they can catch up to Aizen.\n\n'
              'So Aizen locks down the evil spirit-homeworld, trapping Ichigo, Orihime and their friends inside. Aizen reveals that he will use the Hōgyoku to turn the citizens of Karakura into a key to God\'s Palace. Aizen wants to kill God because he doesn\'t like being told what to do.\n\n'
              'Aizen and his army travel to Karakura where they\'re confronted by the soul reapers. They fight, and Aizen wins.\n\n'
              'But just as Aizen is about to use the Hōgyoku to sacrifice Karakura, Ichigo breaks out of the evil spirit-homeworld and confronts Aizen. It turns out that Ichigo is even stronger than Aizen.\n\n'
              'Ichigo defeats Aizen, Aizen is put in prison forever, but Ichigo loses his powers in the process.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
