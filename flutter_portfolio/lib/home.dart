import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Container(
          // color: Colors.red,
          width: constraints.maxWidth,
          padding: EdgeInsets.only(top: 64),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: " Hello!\n",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: (constraints.maxWidth < constraints.maxHeight
                                ? constraints.maxWidth
                                : constraints.maxHeight) *
                            .04,
                        color: Theme.of(context).textTheme.bodyLarge?.color ??
                            Colors.black,
                      ),
                  children: <TextSpan>[
                    TextSpan(
                      text: " My name is\n",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize:
                                (constraints.maxWidth < constraints.maxHeight
                                        ? constraints.maxWidth
                                        : constraints.maxHeight) *
                                    .04,
                          ),
                    ),
                    TextSpan(
                      text: "John Zhou.",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.normal,
                            fontSize:
                                (constraints.maxWidth < constraints.maxHeight
                                        ? constraints.maxWidth
                                        : constraints.maxHeight) *
                                    .13,
                          ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Text(
                "Nice to meet you! I'm a hobbyist game programmer.",
                style: TextStyle(
                  fontSize: (constraints.maxWidth < constraints.maxHeight
                          ? constraints.maxWidth
                          : constraints.maxHeight) *
                      .04,
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      );
    });
  }
}
