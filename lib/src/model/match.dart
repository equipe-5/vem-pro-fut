import 'dart:math';

List<Match> matches = [
  Match('Teste 1', '24/11/2023', '13:00', '16:00', 10, 'venhaaa', 5, 'Paulo', 0),
  Match('Teste 2', '24/11/2023', '13:00', '16:00', 10, 'venhaaa', 5, 'Fulano', 1),
  Match('Teste 3', '24/11/2023', '13:00', '16:00', 10, 'venhaaa', 5, 'Ciclano', 2),
  Match('Teste 4', '21/11/2023', '13:00', '16:00', 10, 'venhaaa', 5, 'Vinicius', 3),
];

List<Match> futureMatches = [];

List<String> images = [
  'assets/images/matches/partida-1.jpg',
  'assets/images/matches/partida-2.jpg',
  'assets/images/matches/partida-3.jpeg',
];

int IdMatches = 4;

class Match {
  int id;
  String matchName;
  String matchDate;
  String matchStartTime;
  String matchEndTime;
  int maxMembers;
  String matchDescription;
  int memberCount;
  String matchOner;
  String image = images[Random().nextInt(images.length)];
  Match(this.matchName, this.matchDate, this.matchStartTime, this.matchEndTime, this.maxMembers,
      this.matchDescription, this.memberCount, this.matchOner, this.id);
}
