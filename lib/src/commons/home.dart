import 'package:flutter/material.dart';
import 'package:vem_pro_fut_app/src/matches/match_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: [
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) => ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    for (int i = 0; i < 5; i++)
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 8.0,
                        ),
                        child: SizedBox(
                          height: 150.0,
                          width: constraints.maxWidth,
                          child: const MatchCard(
                            matchDescription: 'Faltam X Dias',
                            memberCount: 10,
                            maxMembers: 15,
                            matchDate: '01/01/2022',
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
