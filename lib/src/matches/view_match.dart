import 'package:flutter/material.dart';

class ViewMatch extends StatefulWidget {
  const ViewMatch({super.key});

  @override
  State<ViewMatch> createState() => _ViewMatchState();
}

class _ViewMatchState extends State<ViewMatch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visualizar Partida'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'NOME DA PARTIDA',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.calendar_today),
                SizedBox(width: 8.0),
                Text(
                  '01/01/2023',
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.access_time),
                SizedBox(width: 8.0),
                Text(
                  '16:00',
                ),
                Icon(Icons.arrow_forward),
                Text(
                  '18:00',
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
                child: const Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage('URL_TO_PROFILE_PICTURE'),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nome do Host',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
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
              initialValue: 'Trazer cincão pra Coca.',
              decoration: const InputDecoration(
                labelText: 'Observações',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ButtonTheme(
              // Set the minimum width of the button to match the screen width
              height: 50.0, // Set the height of the button
              child: ElevatedButton.icon(
                onPressed: () {
                  return;
                },
                icon: const Icon(Icons.arrow_upward),
                label: const Text('Participar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(0), // Set the button shape
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
