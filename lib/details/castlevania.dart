import 'package:flutter/material.dart';

class Second extends StatelessWidget {
  const Second({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Castlevania Summary'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Image.asset('assets/castlevania-title-1.jpg'),
            Text(
              'Castlevania :',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
                '"Castlevania" is a horror action-adventure animated series set in a dark fantasy Medieval world loosely based on the video game series of the same name, released on Netflix worldwide. Its story is originally based on the events from Castlevania III: Dracula\'s Curse and unites some of its aspects with elements from other games, such as Symphony of the Night and Curse of Darkness. It features Trevor Belmont as the main protagonist, on a quest to stop the evil vampire Vlad Dracula Tepes, who seeks to destroy humanity following the execution of his wife Lisa.\n\n'
              'The creators have clarified that the settings present in the animated series are separate from the games, which implies that lore, characterizations, and plots don\'t necessarily parallel or copy them and things can develop differently. It is the first series from Frederator Studios to not be made for kids, as it is rated TV-MA.\n\n'
              'The first season consists of four episodes of 23-25 minutes each, which all premiered on July 7, 2017.\n\n'
              'After being delayed from a July 2018 release, a second season was ultimately confirmed by Adi Shankar and released on October 26, 2018.\n\n'
              'A third season was confirmed on June 7, 2018, and was released on March 5, 2020.\n\n'
              'A fourth and final season was confirmed on March 27, 2020, by Warren Ellis and on Netflix\'s official Twitter accounts. It premiered on May 13, 2021.\n\n'
              'A sequel/spin-off titled "Castlevania: Nocturne", starring Richter Belmont and Maria Renard, and set during the times of the French Revolution, was released worldwide on September 28, 2023.',
              style: TextStyle(fontSize: 16),
        )],
        ),
      ),
    );
  }
}
