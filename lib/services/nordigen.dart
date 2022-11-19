import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mugpi/models/banks.dart';

class Nordigen{

  late String bank = "";
  late Map mmap;


  Future<List<Banks>> getBanks() async{

    String token = "Bearer fghfghjfghjfghjf";
      var url = Uri.parse("https://ob.nordigen.com/api/v2/institutions/?country=pl");
      var response = await get(url, headers: {
        "accept": "application/json",
        "Authorization": token,
      }
      );

      if (response.statusCode == 200) {

        final List result = json.decode(response.body);

        return result.map((e) => Banks.fromJson(e)).toList();

      } else {

        throw Exception('Failed to load banks');

      }
  }
}