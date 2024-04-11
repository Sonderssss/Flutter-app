import 'package:flutter/material.dart';

class Third extends StatelessWidget {
  const Third({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demon Slayer Summary'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/vgkDemonSlayerFI.jpg'),
            Text(
              'Demon Slayer:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "There are probably some of you out there who are into Japanese anime. Well, I recently started watching the Japanese anime called, “Demon Slayer: Kimetsu no Yaiba”. It is a Japanese manga series written and illustrated by Koyoharu Gotōge, and it is about Tanjiro Kamado, a young boy who becomes a demon slayer after his family is slaughtered and his younger sister Nezuko is turned into a demon. I wasn’t sure what the hype was all about until I started watching the anime with my 8-year-old son, who actually started watching the anime way before me.\n\n"
              "Though quite difficult to explain, Tanjiro and another character Tomioka use what’s called, “Mizu no Kokyuu” which is a kata using a katana, creating what appears to be a water wheel of water. Total concentration is needed to perform mizu no kokyuu. The image below shows Tanjiro using the mizu no kokyuu to fight off a demon.\n\n"
              "And after watching the first episode, I got hooked on the intro song. If you who are interested in Japanese pop music, the intro song is a must hear. The title is, “Gurenge” by Lisa, a Japanese singer-songwriter. There is an English version which you can find on YouTube, but I prefer the original, no offense of course.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
