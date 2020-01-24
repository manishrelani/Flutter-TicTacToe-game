import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  final player1, player2;
  GamePage(this.player1, this.player2);
  @override
  _GamePageState createState() => _GamePageState(player1, player2);
}

class _GamePageState extends State<GamePage> {
  String player1, player2;

  _GamePageState(this.player1, this.player2);

  var cross = AssetImage("images/cros.png");
  var circle = AssetImage("images/circle.png");
  var empty = AssetImage("images/empty.png");
  bool isCross = false;
  int player1Score = 0;
  int player2Score = 0;
  Color player1Color, player2Color;

  String message;
  List<String> gameState;

  @override
  void initState() {
    super.initState();
    setState(() {
      gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      message = "";
      player1Score = 0;
      player2Score = 0;
      isCross = false;
    });
  }

  resetGame() {
    setState(() {
      gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      message = "";
      player1Score = 0;
      player2Score = 0;
      isCross = false;
    });
  }

  restartGame() {
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }

  playGame(int index) {
    if (this.gameState[index] == "empty") {
      setState(() {
        if (this.isCross) {
          this.gameState[index] = "cross";
        } else {
          this.gameState[index] = "circle";
        }
        this.isCross = !this.isCross;
        if (isCross) {
          player2Color = Colors.red;
          player1Color = Colors.transparent;
        } else {
          player1Color = Colors.red;
          player2Color = Colors.transparent;
        }
        this.checkWin();
      });
    }
  }

  AssetImage getImage(String value) {
    switch (value) {
      case ('empty'):
        return empty;
        break;
      case ('cross'):
        return cross;
        break;
      case ('circle'):
        return circle;
        break;
    }
  }

  Future<void> _neverSatisfied() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Center(
                  child: Text(
                    message,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
                message == "Game Draw"
                    ? CircleAvatar(
                        radius: 75,
                        child: Image.asset("images/face.png"),
                      )
                    : Image.asset("images/win.png"),
              ],
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: FlatButton(
                child: Text(
                  'Restart',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  restartGame();
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }

  checkWin() {
    if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      // if any user Win update the message state
      setState(() {
        _neverSatisfied();
        if (gameState[0] == 'circle') {
          player1Score++;
          message = "$player1 Won the Match";
        } else {
          player2Score++;
          message = "$player2 Won the Match";
        }
      });
    } else if ((gameState[3] != 'empty') &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setState(() {
        _neverSatisfied();
        if (gameState[3] == 'circle') {
          player1Score++;
          message = "$player1 Won the Match";
        } else {
          player2Score++;
          message = "$player2 Won the Match";
        }
      });
    } else if ((gameState[6] != 'empty') &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      setState(() {
        _neverSatisfied();
        if (gameState[6] == 'circle') {
          player1Score++;
          message = "$player1 Won the Match";
        } else {
          player2Score++;
          message = "$player2 Won the Match";
        }
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setState(() {
        _neverSatisfied();
        if (gameState[0] == 'circle') {
          player1Score++;
          message = "$player1 Won the Match";
        } else {
          player2Score++;
          message = "$player2 Won the Match";
        }
      });
    } else if ((gameState[1] != 'empty') &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
        _neverSatisfied();
        if (gameState[1] == 'circle') {
          player1Score++;
          message = "$player1 Won the Match";
        } else {
          player2Score++;
          message = "$player2 Won the Match";
        }
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setState(() {
        _neverSatisfied();
        if (gameState[2] == 'circle') {
          player1Score++;
          message = "$player1 Won the Match";
        } else {
          player2Score++;
          message = "$player2 Won the Match";
        }
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      setState(() {
        _neverSatisfied();
        if (gameState[0] == 'circle') {
          player1Score++;
          message = "$player1 Won the Match";
        } else {
          player2Score++;
          message = "$player2 Won the Match";
        }
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[4]) &&
        (gameState[4] == gameState[6])) {
      setState(() {
        _neverSatisfied();
        if (gameState[2] == 'circle') {
          player1Score++;
          message = "$player1 Won the Match";
        } else {
          player2Score++;
          message = "$player2 Won the Match";
        }
      });
    } else if (!gameState.contains('empty')) {
      setState(() {
        _neverSatisfied();
        this.message = 'Game Draw';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        //  mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: size.height * 0.09,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Image.asset(
                    "images/circle.png",
                    height: 80,
                  ),
                  Text(
                    player1,
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 3,
                      width: 100,
                      color: player1Color),
                ],
              ),
              Text(
                "$player1Score:$player2Score",
                style: TextStyle(fontSize: 70),
              ),
              Column(
                children: <Widget>[
                  Image.asset(
                    "images/cros.png",
                    height: 80,
                  ),
                  Text(
                    player2,
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 3,
                    width: 100,
                    color: player2Color,
                  ),
                ],
              )
            ],
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(9, (index) {
                return Material(
                  elevation: 5,
                  child: GestureDetector(
                    onTap: () {
                      playGame(index);
                    },
                    child: Image(
                      image: this.getImage(this.gameState[index]),
                    ),
                  ),
                );
              }),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MaterialButton(
                height: 50,
                minWidth: 120,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                color: Colors.blue,
                child: Text(
                  "Restart",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: restartGame,
              ),
              MaterialButton(
                height: 50,
                color: Colors.blue,
                minWidth: 120,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Text("Reset", style: TextStyle(color: Colors.white)),
                onPressed: resetGame,
              ),
            ],
          ),
          SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}
