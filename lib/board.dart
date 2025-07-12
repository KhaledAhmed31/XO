import 'package:flutter/material.dart';
import 'package:xo_game/board_manager.dart';
import 'package:xo_game/player.dart';

class Board extends StatefulWidget {
  const Board({super.key});
  static const String routeName = 'BoardScrean';

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  Player p1 = Player(name: "X Player", op: 'X', color: const Color(0xffbe202f));

  Player p2 = Player(name: "O Player", op: 'O', color: const Color(0xff424244));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        shape: const Border.symmetric(
            horizontal: BorderSide(color: Colors.black, width: 1)),
        elevation: 10,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  p1.name,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: (BoardManager.isP1Turn)
                          ? Colors.purple
                          : const Color.fromARGB(255, 0, 0, 0)),
                ),
                Text("Score:${p1.score.toString()}",
                    style: const TextStyle(
                      fontSize: 18,
                    ))
              ],
            ),
            Container(
              width: 2.5,
              height: 60,
              color: Colors.black,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(p2.name,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: (!BoardManager.isP1Turn)
                            ? Colors.purple
                            : const Color.fromARGB(255, 0, 0, 0))),
                Text("Score:${p2.score.toString()}",
                    style: const TextStyle(
                      fontSize: 18,
                    ))
              ],
            )
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 30),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.sizeOf(context).width - 40,
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 235, 234, 234),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              BoardManager.winnerName,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.black, width: 2.5)),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemBuilder: (context, index) {
                return Container(
                    color: const Color(0xfff3f2f7),
                    child: TextButton(
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0))),
                        onPressed: () {
                          setState(() {
                            BoardManager.setAction(
                                p1: p1, p2: p2, index: index);

                            if (BoardManager.round == 10) {
                              BoardManager.reSet();
                              BoardManager.winnerName = 'Draw!!';
                              BoardManager.isP1Turn = true;
                            }
                          });
                        },
                        child: Text(
                          BoardManager.action[index],
                          style: TextStyle(
                              color: (BoardManager.action[index] == 'X')
                                  ? p1.color
                                  : p2.color,
                              fontSize: 55),
                        )));
              },
            ),
          )
        ],
      ),
    );
  }
}
