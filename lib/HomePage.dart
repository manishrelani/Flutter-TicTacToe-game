import 'package:flutter/material.dart';
import 'GamePage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String txt = "";

  final player1 = TextEditingController();

  final player2 = TextEditingController();

  void next() {
    if (player1.text.isNotEmpty && player2.text.isNotEmpty) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => GamePage(player1.text,player2.text)));
    } else {
      setState(() {
        txt = "Please Enter Name";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 1,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Color(0xFF00F260), Color(0xFF0575E6)])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: size.height * 0.09,
          ),
          Text(
            "Tic Tac Toe",
            style: TextStyle(
                fontFamily: "DancingScript",
                fontSize: 80,
                color: Colors.white),
          ),
          SizedBox(
            height: size.height * 0.07,
          ),
          Image.asset(
            "images/tic_tac.png",
            height: size.height * 0.25,
          ),
          SizedBox(
            height: size.height * 0.09,
          ),
          Container(
            height: size.height * 0.1,
            width: size.width * 0.7,
            child: TextField(
              controller: player1,
              textAlign: TextAlign.center,
              maxLength: 10,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Player 1 Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Container(
            height: size.height * 0.1,
            width: size.width * 0.7,
            child: TextField(
              controller: player2,
              textAlign: TextAlign.center,
              maxLength: 10,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Player 2 Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          MaterialButton(
            height: size.height * 0.05,
            color: Colors.white,
            textColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text("Start"),
            onPressed: () {
              next();
            },
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Text(
            txt,
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
