import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mugpi/services/nordigen.dart';

void main() {
  runApp(MaterialApp(home: MainActivity())  );
}


class MainActivity extends StatefulWidget {
  const MainActivity({Key? key}) : super(key: key);

  @override
  State<MainActivity> createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {

  String helloThere = "hello World";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent[200],
      body: Center(
        child: Container(

          child:  ElevatedButton(
              onPressed: ()async{
                tryThis();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.pinkAccent),
              ),
              child: Text(helloThere,
                style: TextStyle(color: Colors.white),
              )
          ),
        ),
      ),

    );
  }

  void tryThis() async {
      Nordigen instance = Nordigen();
     await instance.getBanks();
     print(instance.test);
    setState(() {
      helloThere = "asdfasd";
    });
    
  }
}

