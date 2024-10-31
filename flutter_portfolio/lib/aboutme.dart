import 'package:flutter/material.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        padding: EdgeInsets.only(top: 32),
        child: Scaffold(
          body: Container(
            child: Column(
              children: [
                Text(
                  " I'm a passionate game developer who loves to bring my ideas to reality. I hold a degree in Computer Science from CUNY Hunter College, and I have been interested in making games for about a decade.",
                  style: TextStyle(fontSize: 8 + constraints.maxWidth * .015),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: constraints.maxHeight * .025),
                Text(
                  " I realized my passion for game development after making games on ROBLOX in 2015. The ability to bring one's imagined game into reality is a daunting but rewarding task; it is also the case for all other sorts of software, let alone games. Tinkering and debugging code is what I live for. It is exactly why I am a Computer Science major.",
                  style: TextStyle(fontSize: 8 + constraints.maxWidth * .015),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: constraints.maxHeight * .025),
                Text(
                  " In recent years, I am now developing games on Unity, whether it is by myself or with other fellow game developers, as well as dabbling into making web apps. I cannot wait to bring my next ideas into fruition!",
                  style: TextStyle(fontSize: 8 + constraints.maxWidth * .015),
                  textAlign: TextAlign.left,
                ),
                Spacer(),
                Text(
                  "If you would like to reach out to me, feel free to contact me through my Contacts page.",
                  style: TextStyle(fontSize: 8 + constraints.maxWidth * .015),
                  textAlign: TextAlign.left,
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    " p.s. This site was created with Flutter!",
                    style: TextStyle(fontSize: 4 + constraints.maxWidth * .005),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
