import 'package:flutter/material.dart';
import 'package:vem_pro_fut_app/src/commons/home.dart';
import 'package:vem_pro_fut_app/src/matches/create_match.dart';
import 'package:vem_pro_fut_app/src/matches/finished_matches.dart';
import 'package:vem_pro_fut_app/src/matches/future_matches.dart';
import 'package:vem_pro_fut_app/src/teams/view_teams.dart';

class SideBarDrawer extends StatefulWidget {
  const SideBarDrawer({super.key});

  @override
  State<SideBarDrawer> createState() => _SideBarDrawerState();
}

class _SideBarDrawerState extends State<SideBarDrawer> {
  void _home() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Home()) 
    );
  }

  void _newMatch(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CreateMatch()) 
    );
  }

  void _viewTeams(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ViewTeams()) 
    );
  }

  void _futureMatch(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FutureMatches()) 
    );
  }

  void _finishedMatch(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FinishedMatches()) 
    );
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              builderMenuItems(context)
            ]),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Material(
        color: Colors.green,
        child: Container(
            padding: EdgeInsets.only(
                top: 24 + MediaQuery.of(context).padding.top, bottom: 24),
            child: Column(children: [
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Column(children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 52,
                          backgroundImage: AssetImage('images/perfil.jpg'),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Vinicius da Silva',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ],
                    ),
                  ])),
              const Divider(
                  color: Colors.black54,
                  thickness: 0.2,
                  endIndent: 24,
                  indent: 24),
              const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('20 partidas jogadas',
                        style: TextStyle(color: Colors.white)),
                    Text('4/5 Score', style: TextStyle(color: Colors.white)),
                    Icon(Icons.notifications, color: Colors.white),
                  ])
            ])));
  }

  Widget builderMenuItems(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(runSpacing: 16, children: [
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              _home();
            },
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Meus Times'),
            onTap: () {
              _viewTeams();
            },
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Nova Partida'),
            onTap: () {
              _newMatch();
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('Partidas Futuras'),
            onTap: () {
              _futureMatch();
            },
          ),
          ListTile(
            leading: const Icon(Icons.timeline),
            title: const Text('Partidas Jogadas'),
            onTap: () {
              _finishedMatch();
            },
          ),
          const SizedBox(height: 48),
          const Divider(color: Colors.black54, thickness: 0.2, endIndent: 24, indent: 24),
          const Text('Politica de Privacidade'),
          const SizedBox(height: 12),
          const Text('Termos e Condições')
        ]));
  }
}
