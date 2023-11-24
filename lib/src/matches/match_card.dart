import 'package:flutter/material.dart';
import 'package:vem_pro_fut_app/src/matches/view_match.dart';
import 'package:vem_pro_fut_app/src/model/match.dart';

class MatchCard extends StatefulWidget {
  const MatchCard(
      {Key? key, required this.match})
      : super(key: key);
  
  final Match match;

  @override
  State<MatchCard> createState() => _MatchCard();
}

class _MatchCard extends State<MatchCard> {
  void _matchInfo() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ViewMatch(match: widget.match,)));
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            _matchInfo();
          },
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Stack(
                  children: [
                    Image.asset(
                      widget.match.image,
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(15.0),
                          bottomRight: Radius.circular(15.0),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.8),
                            Colors.transparent
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              widget.match.matchName,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.match.matchDate,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 8,
                        right: 8,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.people,
                              color: Colors.white,
                            ),
                            Text(
                              '${widget.match.memberCount}/${widget.match.maxMembers}',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              )),
        ));
  }
}
