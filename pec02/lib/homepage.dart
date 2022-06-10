import 'package:flutter/material.dart';
import 'package:pec02/Card.dart';
import 'dart:math';

class CardGame extends StatefulWidget {
  const CardGame({Key? key}) : super(key: key);

  @override
  State<CardGame> createState() => _CardGameState();
}

class _CardGameState extends State<CardGame> {
  String generateRandomString(int len) {
    var r = Random();
    const _chars = 'CDHS';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }

  int randomNumber(int min, int max) {
    int random = min + Random().nextInt(max - min);
    return random;
  }

  int count = 0;
  int score = 0;
  int card1 = 0;
  var letter1 = 'C';
  int card_1 = 0;
  var letter_1 = 'C';
  int card_2 = 0;
  var letter_2 = 'C';
  int card_3 = 0;
  var letter_3 = 'C';
  int card_4 = 0;
  var letter_4 = 'C';
  int card_5 = 0;
  var letter_5 = 'C';
  void restart() {
    score = 0;
    card1 = 0;
    letter1 = 'C';
    card_2 = 0;
    letter_2 = 'C';
    card_3 = 0;
    letter_3 = 'C';
    card_4 = 0;
    letter_4 = 'C';
    card_5 = 0;
    letter_5 = 'C';
  }

  void pasa() {
    card_5 = card_4;
    card_4 = card_3;
    card_3 = card_2;
    card_2 = card_1;
    card_2 = card_1;
    card_1 = card1;
    card1 = 0;
    letter_5 = letter_4;
    letter_4 = letter_3;
    letter_3 = letter_2;
    letter_2 = letter_1;
    letter_1 = letter1;
    letter1 = 'C';
  }

  showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.pink[100],
          title: Text('You Win!!'),
          content: Text("Are You Sure Want To Proceed ?"),
          actions: <Widget>[
            FlatButton(
              child: Text("YES"),
              onPressed: () {
                setState(() {
                  pasa();
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  showAlertGAmeover(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.redAccent,
          title: Text('Gameover!!'),
          content: Text("Do you want to play again?"),
          actions: <Widget>[
            FlatButton(
              child: Text("YES"),
              onPressed: () {
                setState(() {
                  restart();
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void greatEqual() {
    if (card1 >= card_1) {
      score++;
      Future.delayed(Duration(milliseconds: 800), () {
        showAlert(context);
      });
    } else {
      Future.delayed(Duration(milliseconds: 800), () {
        showAlertGAmeover(context);
      });
    }
  }

  void lower() {
    if (card1 < card_1) {
      score++;
      Future.delayed(Duration(milliseconds: 800), () {
        showAlert(context);
      });
    } else {
      Future.delayed(Duration(milliseconds: 800), () {
        showAlertGAmeover(context);
      });
    }
  }

  void randomCard() {
    card1 = randomNumber(1, 13);
    letter1 = generateRandomString(1);
  }

  void firstOpenCard() {
    if (score == 0 && count == 0) {
      card_1 = randomNumber(1, 13);
      letter_1 = generateRandomString(1);
    }
    if (score == 0 && count > 0) {
      card_1 = card_1;
      letter_1 = letter_1;
    }
  }

  @override
  Widget build(BuildContext context) {
    firstOpenCard();
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.orange])),
      child: Column(
        children: [
          Text(
            'Score: $score',
            style: TextStyle(fontSize: 50.0, color: Colors.black),
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Cardd(
                number: card_2,
                letter: letter_2,
              ),
              Cardd(
                number: card_3,
                letter: letter_3,
              ),
              Cardd(
                number: card_4,
                letter: letter_4,
              ),
              Cardd(
                number: card_5,
                letter: letter_5,
              ),
            ],
          ),
          SizedBox(
            height: 60.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Cardd(
                number: card_1,
                letter: letter_1,
              ),
              SizedBox(
                width: 40.0,
              ),
              Cardd(
                number: card1,
                letter: letter1,
              ),
            ],
          ),
          SizedBox(
            height: 40.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                      colors: [
                        Colors.purple,
                        Colors.red,
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    )),
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      count++;
                      randomCard();
                      greatEqual();
                    });
                  },
                  child: Text(
                    '>=',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                      colors: [
                        Colors.purple,
                        Colors.red,
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    )),
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      count++;
                      randomCard();
                      lower();
                    });
                  },
                  child: Text(
                    '<',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
