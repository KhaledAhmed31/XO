import 'package:xo_game/player.dart';

class BoardManager {
  static List<String> action = List.filled(9, '');
  static bool isP1Turn = true;
  static String winnerName = '';
  static int round = 1;

  static bool isWin() {
    if (round < 5) return false;
    if (action[0] == action[4] && action[4] == action[8] && action[8] != '') {
      return true;
    }
    if (action[2] == action[4] && action[4] == action[6] && action[6] != '') {
      return true;
    }
    if (action[0] == action[1] && action[1] == action[2] && action[2] != '') {
      return true;
    }
    if (action[3] == action[4] && action[4] == action[5] && action[5] != '') {
      return true;
    }
    if (action[6] == action[7] && action[7] == action[8] && action[8] != '') {
      return true;
    }
    if (action[0] == action[3] && action[3] == action[6] && action[6] != '') {
      return true;
    }
    if (action[1] == action[4] && action[4] == action[7] && action[7] != '') {
      return true;
    }
    if (action[2] == action[5] && action[5] == action[8] && action[8] != '') {
      return true;
    }

    return false;
  }

  static void setAction(
      {required Player p1, required Player p2, required int index}) {
    winnerName = '';
    if (action[index] == '') {
      (isP1Turn) ? action[index] = p1.op : action[index] = p2.op;
      if (isWin()) {
        isP1Turn ? ++p1.score : ++p2.score;
        winnerName = isP1Turn ? 'X is winner' : 'O is winner';
        reSet();
        return;
      }
      isP1Turn = !isP1Turn;
      ++round;
    }
  }

  static void reSet() {
    action = List.filled(9, '');
    round = 1;
  }
}
