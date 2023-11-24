import 'package:flutter/material.dart';
import 'package:vem_pro_fut_app/src/commons/components/header.dart';
import 'package:vem_pro_fut_app/src/model/team.dart';
import 'package:vem_pro_fut_app/src/teams/create_team.dart';
import 'package:vem_pro_fut_app/src/teams/team_card.dart';
import 'package:vem_pro_fut_app/src/commons/components/navbar.dart';

class ViewTeams extends StatefulWidget {
  const ViewTeams({super.key});

  @override
  State<ViewTeams> createState() => _ViewTeamsState();
}

class _ViewTeamsState extends State<ViewTeams> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBarDrawer(),
      appBar: const Header(
          title: 'Meus Times', subtitle: 'Reuna seus amigos em um só lugar!'),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: [
            Container(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton.icon(
                  onPressed: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateTeam()));
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Criar Time'),
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
              itemCount: teams.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 8.0,
                  ),
                  child: SizedBox(
                    height: 150.0,
                    child: TeamCard(
                      team: teams[index],
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
