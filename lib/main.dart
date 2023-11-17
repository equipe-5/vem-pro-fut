import 'package:flutter/material.dart';
import 'package:vem_pro_fut_app/src/teams/create_team.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.greenAccent.shade400),
        useMaterial3: true,
      ),
      home: const CreateTeam(),
    );
  }
}
