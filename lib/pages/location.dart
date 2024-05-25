import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Choose a location",
          style: TextStyle(
              fontFamily: "Red Hat Display", fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Text("Location choser"),
    );
  }
}
