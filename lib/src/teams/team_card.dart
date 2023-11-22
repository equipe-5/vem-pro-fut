import 'package:flutter/material.dart';

class TeamCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Card(
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
                image: AssetImage(imagePath),
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
                    teamName,
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
                        ' ${rating.toString()}',
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
                    Text(' $memberCount'),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
