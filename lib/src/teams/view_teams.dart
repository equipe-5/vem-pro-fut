import 'package:flutter/material.dart';
import 'package:vem_pro_fut_app/src/teams/team_card.dart';

class ViewTeams extends StatefulWidget {
  const ViewTeams({super.key});

  @override
  State<ViewTeams> createState() => _ViewTeamsState();
}

class _ViewTeamsState extends State<ViewTeams> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Times'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ButtonTheme(
              height: 50.0,
              child: ElevatedButton.icon(
                onPressed: () {
                  return;
                },
                icon: const Icon(Icons.add),
                label: const Text('Criar Time'),
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
            const SizedBox(
              height: 150.0,
              child: TeamCard(
                imagePath: 'assets/images/escudo_time_1.jpg',
                teamName: 'Vasco',
                rating: 1.5,
                memberCount: 10,
              ),
            ),
            const SizedBox(
              height: 150.0,
              child: TeamCard(
                imagePath: 'assets/images/escudo_time_2.jpg',
                teamName: 'Chelsea',
                rating: 3.5,
                memberCount: 14,
              ),
            ),
            const SizedBox(
              height: 150.0,
              child: TeamCard(
                imagePath: 'assets/images/escudo_time_3.jpg',
                teamName: 'Real Madrid',
                rating: 4.9,
                memberCount: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
