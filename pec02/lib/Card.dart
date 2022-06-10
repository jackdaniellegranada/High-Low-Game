import 'package:flutter/material.dart';

class Cardd extends StatefulWidget {
  final number;
  final letter;

  Cardd({this.number, this.letter});

  @override
  State<Cardd> createState() => _CarddState();
}

class _CarddState extends State<Cardd> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 120,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('img/${widget.number}${widget.letter}.png')),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
