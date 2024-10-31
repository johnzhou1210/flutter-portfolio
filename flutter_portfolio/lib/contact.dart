import 'package:flutter/material.dart';
import 'utils.dart';

List<SocialMedia> Contacts = <SocialMedia>[
  const SocialMedia(
    name: "Github",
    link: "https://github.com/johnzhou1210",
    icon: Icons.code,
  ),
  const SocialMedia(
    name: "LinkedIn",
    link: "https://www.linkedin.com/in/john-zhou-6987181bb/",
    icon: Icons.work,
  ),
  const SocialMedia(
    name: "Itch.io",
    link: "https://zhouj6.itch.io/",
    icon: Icons.videogame_asset,
  ),
];

class SocialMedia extends StatelessWidget {
  final String link;
  final IconData icon;
  final String name;

  const SocialMedia({
    super.key,
    required this.name,
    required this.link,
    this.icon = Icons.close,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return ListTile(
        visualDensity: VisualDensity.comfortable,
        leading: Transform.translate(
          offset: Offset(
              constraints.maxWidth * -.015, -constraints.maxWidth * .0175),
          child: Icon(
            icon,
            size: constraints.maxWidth * .05,
          ),
        ),
        title: Text(
          name,
          style: TextStyle(fontSize: constraints.maxWidth * .035),
        ),
        subtitle: Text(
          link,
          style: TextStyle(fontSize: constraints.maxWidth * .02),
        ),
        trailing: Icon(
          Icons.arrow_forward,
          size: constraints.maxWidth * .05,
        ),
        onTap: () {
          // LaunchURL('https://www.youtube.com/watch?v=dQw4w9WgXcQ');
          LaunchURL(link);
        },
      );
    });
  }
}

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Column(
        children: [
          Text('Contact Me!',
              style: TextStyle(fontSize: constraints.maxWidth * .05)),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Spacer(flex: 3),
                Expanded(
                    flex: 1,
                    child:
                        Icon(Icons.email, size: constraints.maxWidth * .035)),
                Expanded(
                  flex: 8,
                  child: SelectableText(
                    'johnzhou256@gmail.com',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: constraints.maxWidth * .035,
                    ),
                  ),
                ),
                const Spacer(flex: 1),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Spacer(flex: 3),
              Expanded(
                  flex: 1,
                  child: Icon(Icons.phone, size: constraints.maxWidth * .035)),
              Expanded(
                flex: 9,
                child: SelectableText(
                  '(929) 253-7008',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: constraints.maxWidth * .035,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(64.0),
              child: ListView.builder(
                  itemCount: Contacts.length,
                  itemBuilder: (context, index) {
                    return Contacts[index];
                  }),
            ),
          ),
        ],
      );
    });
  }
}
