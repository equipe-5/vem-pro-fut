import 'package:flutter/material.dart';

class ViewTeam extends StatefulWidget {
  const ViewTeam({super.key});

  @override
  State<ViewTeam> createState() => _ViewTeamState();
}

class _ViewTeamState extends State<ViewTeam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visualizar Time'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
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
                backgroundImage: NetworkImage('URL_TO_PROFILE_PICTURE'),
              ),
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage('URL_TO_PROFILE_PICTURE'),
              ),
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage('URL_TO_PROFILE_PICTURE'),
              ),
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage('URL_TO_PROFILE_PICTURE'),
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

          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: double.infinity,
                height: 160,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    // Trocar para AssetImage e usar o caminho local da imagem
                    image: NetworkImage('https://t4.ftcdn.net/jpg/00/86/41/89/360_F_86418998_mQ7NZfxcfR1hK1PDbVDSUkr6TFZbNRc0.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Próximo Jogo',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 4.0
                            ..color = Colors.black,
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Próximo Jogo',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 32.0),

          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton.icon(
                onPressed: () {
                  return;
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
          ),
        ],
      ),
    );
  }
}
