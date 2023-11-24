import 'package:flutter/material.dart';
import 'package:vem_pro_fut_app/src/commons/components/header_home.dart';
import 'package:vem_pro_fut_app/src/commons/components/navbar.dart';
import 'package:vem_pro_fut_app/src/matches/match_card.dart';
import 'package:vem_pro_fut_app/src/model/match.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBarDrawer(),
      appBar: const HeaderHome(),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: matches.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 8.0,
                  ),
                  child: SizedBox(
                    height: 150.0,
                    child: MatchCard(
                      match: matches[index],
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
