import 'package:flutter/material.dart';
import 'package:vem_pro_fut_app/src/commons/components/header.dart';
import 'package:vem_pro_fut_app/src/commons/components/navbar.dart';
import 'package:vem_pro_fut_app/src/matches/match_card.dart';

class FutureMatches extends StatefulWidget {
  const FutureMatches({super.key});

  @override
  State<FutureMatches> createState() => _FutureMatchesState();
}

class _FutureMatchesState extends State<FutureMatches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBarDrawer(),
      appBar: const Header(title: 'Partidas Futuras', subtitle: 'Não perca o Horário!'),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: [
            ButtonTheme(
              height: 50.0,
              child: ElevatedButton.icon(
                onPressed: () {
                  return;
                },
                icon: const Icon(Icons.add),
                label: const Text('Criar Partida'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
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
                          child: const MatchCard(cardText: 'Faltam X Dias'),
                        ),
                      )
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
