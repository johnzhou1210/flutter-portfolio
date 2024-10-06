import 'package:flutter/material.dart';
import 'utils.dart';

List<SocialMedia> Contacts = <SocialMedia>[
  const SocialMedia(
    name: "Facebook",
    link: "",
    icon: Icon(Icons.facebook),
  ),
  const SocialMedia(
    name: "Facebook",
    link: "",
    icon: Icon(Icons.facebook),
  ),
  const SocialMedia(
    name: "Facebook",
    link: "",
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
        LaunchURL('https://google.com');
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
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.email, size: 86),
              Text(
                '    johnzhou256@gmail.com',
                style: TextStyle(
                  fontSize: 64,
                ),
              ),
            ],
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
