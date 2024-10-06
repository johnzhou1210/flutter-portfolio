import 'utils.dart';
import 'package:flutter/material.dart';

List<ShowCase> items = <ShowCase>[
  const ShowCase(
    title: "Shroomies DEMO",
    subtitle:
        "Remake of the game jam version of Shroomies. Created with Unity C#.",
    images: ["assets/images/shroomies.png"],
    link: 'https://tomawash.itch.io/shroomies-demo',
  ),
  const ShowCase(
    title: "Shroomies",
    subtitle:
        "Arcade shooter game made for the 2022 itch.io BWGJ with Unity C#.",
    images: ["assets/images/shroomiesgamejamver.png"],
    link: 'https://awesomeflow.itch.io/shroomies',
  ),
  const ShowCase(
    title: "The Journey of Bob",
    subtitle: "Whimsical short platformer game made with Unity C#.",
    images: ["assets/images/thejourneyofbob.png"],
    link: 'https://zhouj6.itch.io/the-journey-of-bob',
  ),
  const ShowCase(
    title: "Aeternum Rift",
    subtitle:
        "Ambitious turn-based combat prototype made in Roblox Studio with Lua.",
    images: ["assets/images/aeternumrift.png"],
    link: 'https://www.roblox.com/games/6357293380/Aeternum-Rift-Prototype',
  ),
  const ShowCase(
    title: "Procedural Dungeon Generator",
    subtitle: "Random dungeon generator made in Roblox Studio with Lua.",
    images: ["assets/images/proceduraldungen.png"],
    link:
        'https://www.roblox.com/games/6332092364/Procedural-Dungeon-Generator',
  ),
  const ShowCase(
    title: "ROgueBLOX",
    subtitle:
        "Roguelike dungeon crawler prototype made in Roblox Studio with Lua.",
    images: ["assets/images/rogueblox.png"],
    link: 'https://www.roblox.com/games/5095945163/ROgueBLOX-Discontinued',
  ),
  // const ShowCase(
  //   title: "Bastion Blitz",
  //   subtitle:
  //       "Projectile battle simulation prototype made in Roblox Studio with Lua.",
  //   images: ["assets/images/bastionblitz.png"],
  //   link: '',
  // ),
  const ShowCase(
    title: "Ratffiti",
    subtitle:
        "3D Fast-paced scavenger hunt game made with Unity C# for BrookLAN October 2021 Game Jam.",
    images: ["assets/images/ratffiti.png"],
    link: 'https://zhouj6.itch.io/ratffiti',
  ),
  const ShowCase(
    title: "Chrysalis",
    subtitle: "2D Action shooter made for itch.io Freeze Jam with Unity C#.",
    images: ["assets/images/chrysalis.png"],
    link: 'https://sinnabebe.itch.io/chrysalis',
  ),
  const ShowCase(
    title: "Gobi",
    subtitle: "2D Jumping platformer made for itch.io ScoreSpace Jam #19.",
    images: ["assets/images/gobi.png"],
    link: 'https://zhouj6.itch.io/gobi',
  ),
  const ShowCase(
    title: "Bob's Dungeon",
    subtitle: "3D short horror maze game made with Unity C#.",
    images: ["assets/images/bobdungeon.png"],
    link: 'https://zhouj6.itch.io/bobs-dungeon',
  ),
];

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});
  @override
  _PortfolioState createState() => _PortfolioState();
}

class ShowCase extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<String> images;
  final String link;

  const ShowCase({
    super.key,
    required this.title,
    required this.subtitle,
    this.images = const <String>[],
    this.link = '',
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 26,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => LaunchURL(link),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
              child: Image.asset(
                images[0],
                height: 400,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            onTap: () => LaunchURL(link),
            title: Text(
              title,
              style: const TextStyle(fontSize: 24),
            ),
            subtitle: Text(subtitle),
          ),
        ],
      ),
    );
  }
}

class _PortfolioState extends State<Portfolio> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Column(
        children: [
          const Text(
            'My Portfolio',
            style: TextStyle(
              fontSize: 64,
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: constraints.maxWidth >= 2400
                    ? 4
                    : constraints.maxWidth >= 1750
                        ? 3
                        : constraints.maxWidth >= 1200
                            ? 2
                            : 1,
                childAspectRatio: constraints.maxWidth >= 800 ? 1.2 : .9,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.center,
                child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Wrap(children: [items[index]])),
              ),
            ),
          ),
        ],
      );
    });
  }
}
