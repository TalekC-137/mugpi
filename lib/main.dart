import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mugpi/services/nordigen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'models/banks.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      body: Container(
        padding: EdgeInsets.all(50),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            ElevatedButton(
                onPressed: ()async{
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.pinkAccent),
                ),
                child: Text(helloThere,
                  style: TextStyle(color: Colors.white),
                )
            ),
            SizedBox(height: 20),

            FutureBuilder<List<Banks>>(
              future: Nordigen().getBanks(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                      itemBuilder: (context, index){
                      return ListTile(
                          onTap: () => testbitch(snapshot.data!.length, snapshot.data),
                          leading: CircleAvatar(
                          child: Image.network(
                          snapshot.data![index].logo.toString()),
                        ),
                        title: Text(snapshot.data![index].name.toString()),
                        trailing:
                        Text(snapshot.data![index].transaction_total_days.toString()),
                        subtitle: Text(snapshot.data![index].id.toString()),
                      );
                      }
                  );

                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            )
          ],
        ),
      ),
    );
  }

  void testbitch(int len, List<Banks>? lista){

    for(int i =0; i< len; i++){
      print(i.toString() + "  " + lista![i].name.toString());

    }
  }
}

