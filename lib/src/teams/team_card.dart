import 'package:flutter/material.dart';
import 'package:vem_pro_fut_app/src/teams/view_team.dart';

class TeamCard extends StatefulWidget {
  final String imagePath;
  final String teamName;
  final double rating;
  final int memberCount;

  const TeamCard({
    super.key,
    required this.imagePath,
    required this.teamName,
    required this.rating,
    required this.memberCount,
  });

  @override
  State<TeamCard> createState() => _TeamCardState();
}

class _TeamCardState extends State<TeamCard> {
  void _viewTeam() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ViewTeam()));
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
            onTap: () {
              _viewTeam();
            },
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              margin: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  // Left side: Team Logo
                  Container(
                    width: 130.0, // Adjust as needed
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0),
                      ),
                      image: DecorationImage(
                        image: AssetImage(widget.imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Center: Team Name, Rating
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.teamName,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              // Display Rating as stars
                              const Icon(Icons.star, color: Colors.black),
                              Text(
                                ' ${widget.rating.toString()}',
                                style: const TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.people),
                            Text(' ${widget.memberCount}'),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
