import 'package:flutter/material.dart';
import 'package:vem_pro_fut_app/src/commons/components/header.dart';
import 'package:vem_pro_fut_app/src/commons/components/navbar.dart';
import 'package:vem_pro_fut_app/src/matches/future_matches.dart';
import 'package:vem_pro_fut_app/src/model/match.dart';

class ViewMatch extends StatefulWidget {
  const ViewMatch({super.key, required this.match});
  final Match match;

  @override
  State<ViewMatch> createState() => _ViewMatchState();
}

class _ViewMatchState extends State<ViewMatch> {
  void _participate() {
    bool exists = false;
    for (var futureMatch in futureMatches) {
      if (futureMatch.id == widget.match.id) {
        exists = true;
        break;
      }
    }

    if (!exists) {
      futureMatches.add(widget.match);
      widget.match.memberCount += 1;
      matches.removeWhere((element) => element.id == widget.match.id);
      setState(() {});
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const FutureMatches()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBarDrawer(),
      appBar: Header(
          title: widget.match.matchName, subtitle: '1 KM próximo a você'),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              widget.match.matchName,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.calendar_today),
                const SizedBox(width: 8.0),
                Text(
                  widget.match.matchDate,
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.access_time),
                const SizedBox(width: 8.0),
                Text(
                  widget.match.matchStartTime,
                ),
                const Icon(Icons.arrow_forward),
                Text(
                  widget.match.matchEndTime,
                )
              ],
            ),
            const SizedBox(height: 16.0),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('images/perfil.jpg'),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.match.matchOner,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Column(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle button click here
                  },
                  icon: const Icon(Icons.people),
                  label: const Text('Ver Participantes'),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle button click here
                  },
                  icon: const Icon(Icons.location_on),
                  label: const Text('Local da Partida'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              readOnly: true,
              initialValue: widget.match.matchDescription,
              decoration: const InputDecoration(
                labelText: 'Observações',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton.icon(
                onPressed: () {
                  _participate();
                },
                icon: const Icon(Icons.add),
                label: const Text('Participar'),
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
          ],
        ),
      ),
    );
  }
}
