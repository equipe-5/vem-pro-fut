import 'package:flutter/material.dart';
import 'package:vem_pro_fut_app/src/matches/match_card.dart';

class FinishedMatches extends StatefulWidget {
  const FinishedMatches({super.key});

  @override
  State<FinishedMatches> createState() => _FinishedMatchesState();
}

class _FinishedMatchesState extends State<FinishedMatches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Partidas Encerradas'),
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
                            matchDescription: 'Encerrada',
                            memberCount: 0,
                            maxMembers: 10,
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
