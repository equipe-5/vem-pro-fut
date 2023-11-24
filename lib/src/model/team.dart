
import 'dart:math';
import 'package:vem_pro_fut_app/src/model/match.dart';

List<Match> teamMatches = [];

List<Team> teams = [
  Team(0, 'time 1', 'descrição 1'),
  Team(1, 'time 2', 'descrição'),
];

List<String> images = [
  'assets/images/teams/escudo_time_1.jpg',
  'assets/images/teams/escudo_time_2.jpg',
  'assets/images/teams/escudo_time_3.png',
];

int IdTeam = 2;


class Team{
  int id;
  String teamName;
  String teamDescription;
  String teamLogo = images[Random().nextInt(images.length)];
  String rating = '5.0';
  int memberCount = 4;
  List<Match> matches = [];
  Team(this.id, this.teamName, this.teamDescription);
}