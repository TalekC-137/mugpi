import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MainActivity())  );
}

class MainActivity extends StatelessWidget {

  String helloWorlds  ="hello there";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent[200],
      body: Center(
        child: Container(

          child: Text(helloWorlds),

        ),
      ),
    );
  }
}
