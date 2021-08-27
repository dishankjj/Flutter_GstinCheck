import 'dart:convert';

import 'package:http/http.dart' as http;

String mockUrl = 'https://611f9dc6988f860017ac4326.mockapi.io/api/gst?gstin';

class Gst {
  final String userId;
  final int gstin;
  final String name;
  final bool status;
  final String address;
  final bool taxtype;
  final bool biztype;
  final String ward;
  final String range;
  final String dor;
  final String cancel;

  Gst(
      {required this.userId,
      required this.gstin,
      required this.name,
      required this.status,
      required this.address,
      required this.taxtype,
      required this.biztype,
      required this.ward,
      required this.range,
      required this.dor,
      required this.cancel});

  factory Gst.fromJson(Map<String, dynamic> json) {
    return Gst(
        userId: json['id'],
        gstin: json['gstin'],
        name: json['name'],
        status: json['status'],
        address: json['address'],
        taxtype: json['taxtype'],
        biztype: json['biztype'],
        ward: json['ward'],
        range: json['range'],
        dor: json['dor'],
        cancel: json['cancel']);
  }
}

Future<Gst> fetchGstData(String data) async {
  final response = await http.get(Uri.parse('$mockUrl'+'$data'));

  if (response.statusCode == 200) {
    print(response.body);
    return Gst.fromJson(jsonDecode(response.body)[0]);
  } else {
    throw Exception('Failed to load');
  }
}
