import 'dart:math';

List<Match> matches = [
  Match('Teste 1', '24/11/2023', '13:00', 10, 'venhaaa', 5),
  Match('Teste 2', '24/11/2023', '13:00', 10, 'venhaaa', 5),
  Match('Teste 3', '24/11/2023', '13:00', 10, 'venhaaa', 5),
  Match('Teste 4', '24/11/2023', '13:00', 10, 'venhaaa', 5),
];

List<String> images = [
  'assets/images/matches/partida-1.jpg',
  'assets/images/matches/partida-2.jpg',
  'assets/images/matches/partida-3.jpeg',
];

class Match {
  String matchName;
  String matchDate;
  String matchTime;
  int maxMembers;
  String matchDescription;
  int memberCount;
  String image = images[Random().nextInt(images.length)];
  Match(this.matchName, this.matchDate, this.matchTime, this.maxMembers,
      this.matchDescription, this.memberCount);
}
