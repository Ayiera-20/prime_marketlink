import 'package:flutter/material.dart';

class Industries extends StatefulWidget {
  const Industries({super.key});

  @override
  State<Industries> createState() => _IndustriesState();
}

class _IndustriesState extends State<Industries> {

//  final double appBarHeight = 100.0;
//   final double spaceAroundRoundButton = 4.0;
//   final double roundedButtonSize = 64.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(20.0), bottomLeft: Radius.circular(20))),
      centerTitle: true,
      title: const Text(
        'Connecting businesses',
        style: TextStyle(color: Colors.white, fontStyle: FontStyle.normal, fontSize: 20),
      ),
      backgroundColor: Colors.teal,
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        IconButton(
           icon: const Icon(Icons.notification_add_rounded),
              onPressed: () {
              },
        ),
        IconButton(
           icon: const Icon(Icons.star),
              onPressed: () {
              },
        ),
      ],
    ),
    );
  }
}