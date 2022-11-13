import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

class Nordigen{

  late String bank = "";
  late Map mmap;
  late var test;


  Future <void> getBanks() async{

    String token = "asd";

    try {
      var url = Uri.parse("https://ob.nordigen.com/api/v2/institutions/?country=gb");
      var response = await get(url, headers: {
        "accept": "application/json",
        "Authorization": token,
      }

      );

    //  mmap = data;

    //  String offset = data['utc_offset'];

      test = jsonDecode(response.body);

    //  print(jsonDecode(response.body));


    }catch(e){
      print ('error: $e');
    }
  }

}