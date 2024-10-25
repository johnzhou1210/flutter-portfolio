import 'package:flutter/material.dart';
import 'utils.dart';

List<SocialMedia> Contacts = <SocialMedia>[
  const SocialMedia(
    name: "Github",
    link: "https://github.com/johnzhou1210",
    icon: Icon(Icons.facebook),
  ),
  const SocialMedia(
    name: "LinkedIn",
    link: "https://www.linkedin.com/in/john-zhou-6987181bb/",
    icon: Icon(Icons.facebook),
  ),
  const SocialMedia(
    name: "Itch.io",
    link: "https://zhouj6.itch.io/",
    icon: Icon(Icons.facebook),
  ),
];

class SocialMedia extends StatelessWidget {
  final String link;
  final Icon icon;
  final String name;

  const SocialMedia({
    super.key,
    required this.name,
    required this.link,
    this.icon = const Icon(Icons.close),
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
      ),
      leading: const Icon(Icons.facebook),
      onTap: () {
        LaunchURL('https://www.youtube.com/watch?v=dQw4w9WgXcQ');
      },
    );
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
          const Text('Contact Me!', style: TextStyle(fontSize: 64)),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Spacer(flex: 4),
                Expanded(
                    flex: 1,
                    child:
                        Icon(Icons.email, size: constraints.maxWidth * .035)),
                Expanded(
                  flex: 9,
                  child: SelectableText(
                    'johnzhou256@gmail.com',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: constraints.maxWidth * .035,
                    ),
                  ),
                ),
                Spacer(flex: 1),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: Contacts.length,
                itemBuilder: (context, index) {
                  return Contacts[index];
                }),
          )
        ],
      );
    });
  }
}
