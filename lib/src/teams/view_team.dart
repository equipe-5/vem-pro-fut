import 'package:flutter/material.dart';
import 'package:vem_pro_fut_app/src/commons/components/header.dart';
import 'package:vem_pro_fut_app/src/commons/components/navbar.dart';
import 'package:vem_pro_fut_app/src/matches/match_card.dart';
import 'package:vem_pro_fut_app/src/matches/schedule_matches.dart';
import 'package:vem_pro_fut_app/src/model/team.dart';

class ViewTeam extends StatefulWidget {
  final Team team;

  const ViewTeam({super.key, required this.team});

  @override
  State<ViewTeam> createState() => _ViewTeamState();
}

class _ViewTeamState extends State<ViewTeam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const SideBarDrawer(),
        appBar:
            Header(title: widget.team.teamName, subtitle: 'Detalhes do time'),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: [
              const Text(
                'Participantes',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/perfil.jpg'),
                  ),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/jogador-1.jpg'),
                  ),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/jogador-2.webp'),
                  ),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/jogador-3.webp'),
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              Container(
                height: 2,
                color: Colors.grey,
                margin: const EdgeInsets.symmetric(horizontal: 64.0),
              ),
              const SizedBox(height: 32.0),
              Container(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ScheduleMatches(team: widget.team)));
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Agendar nova partida'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: widget.team.matches.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    child: SizedBox(
                      height: 150.0,
                      child: MatchCard(
                        match: widget.team.matches[index],
                      ),
                    ),
                  );
                },
              )),
            ],
          ),
        ));
  }
}
