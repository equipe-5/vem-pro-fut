import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vem_pro_fut_app/src/commons/components/header.dart';
import 'package:vem_pro_fut_app/src/matches/match_card.dart';
import 'package:vem_pro_fut_app/src/commons/components/navbar.dart';
import 'package:vem_pro_fut_app/src/model/match.dart';

List<Match> finishedMatches = [];

class FinishedMatches extends StatefulWidget {
  const FinishedMatches({super.key});

  @override
  State<FinishedMatches> createState() => _FinishedMatchesState();
}

class _FinishedMatchesState extends State<FinishedMatches> {
  void _finish() {
    List<Match> toRemove = [];
    List<Match> toAdd = [];

    for (var element in futureMatches) {
      if (DateFormat('dd/MM/yyyy').parse(element.matchDate).isBefore(
          DateFormat('yyyy-MM-dd')
              .parse(DateTime.now().toString().split(' ')[0]))) {
        toAdd.add(element);
        toRemove.add(element);
      }
    }

    finishedMatches.addAll(toAdd);
    futureMatches.removeWhere((element) => toRemove.contains(element));
  }

  @override
  Widget build(BuildContext context) {
    _finish();
    return Scaffold(
      drawer: const SideBarDrawer(),
      appBar: const Header(
          title: 'Partidas Encerradas', subtitle: 'Veja seus resultados'),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: [
            const SizedBox(height: 16.0),
            Expanded(
                child: ListView.builder(
              itemCount: finishedMatches.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 8.0,
                  ),
                  child: SizedBox(
                    height: 150.0,
                    child: MatchCard(
                      match: finishedMatches[index],
                    ),
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
