import 'package:flutter/material.dart';

class SideBarDrawer extends StatelessWidget {
  const SideBarDrawer({super.key});

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
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Meus Times'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Nova Partida'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('Partidas Futuras'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.timeline),
            title: const Text('Partidas Jogadas'),
            onTap: () {},
          ),
          const SizedBox(height: 48),
          const Divider(color: Colors.black54, thickness: 0.2, endIndent: 24, indent: 24),
          const Text('Politica de Privacidade'),
          const SizedBox(height: 12),
          const Text('Termos e Condições')
        ]));
  }
}
