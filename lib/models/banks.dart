import 'dart:ffi';

class Banks{

  final String id;
  final String name;
  final String bic;
  final String transaction_total_days;
  final String logo;

  Banks({ required this.id, required this.name,  required this.bic,
    required this.transaction_total_days, required this.logo});

  factory Banks.fromJson(Map<String, dynamic> json) {
   return Banks(
       id: json['id'],
       name:  json['name'],
       bic: json['bic'],
       transaction_total_days: json['transaction_total_days'],
       logo: json['logo'],
   );
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['bic'] = bic;
    data['transaction_total_days'] = transaction_total_days;
    data['logo'] = logo;
    return data;
  }
}