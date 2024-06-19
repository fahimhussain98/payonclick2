import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:payoneclick/Api_Services/Api_models/TabBarModel/fullTTModel.dart';

class APISerives2{
  //_________________home =>Screen_____________________
  Future<fullTTmodel?> getfullTT(String userID, String dropdownValue2, String selectedState) async { //dropdownValue2 => operatorNmae, //selectedState => circle
    try {
      var url = Uri.parse("http://api.payonclick.in/Vr1.0/74536/DJKIJF09320923JSDFOJDFLMSDS/KVLKMS09232309283KJSDJLWLEEJ203/api/MplanMobileSimplePlan");
      final headers = {
        'Authorization': 'Basic ${base64Encode(utf8.encode('webtech#\$%^solution\$\$&&@@&^&july2k21:basic%%##@&&auth&#&#&#&@@#&pasWtS2021'))}',
        'Content-Type': 'application/json',
      };
      final body = jsonEncode({
        "userID": userID,
        "tokenKey": "1234",
        "deviceInfo": "1234",
        "operatorName": dropdownValue2,
        "circle": selectedState,
      });

      var response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        // Debugging: Print the type and content of jsonResponse
        print('jsonResponse type: ${jsonResponse.runtimeType}');
        print('jsonResponse: $jsonResponse');

        if (jsonResponse is Map<String, dynamic> && jsonResponse['statuscode'] == 'TXN') {
          // Ensure `data` is decoded if necessary
          // if (jsonResponse['data'] is String) {
          //   jsonResponse['data'] = jsonDecode(jsonResponse['data']);
          // }
          return fullTTmodel.fromJson(jsonResponse);
        } else {
          print('Error message getfullTT: $jsonResponse');
        }
      } else {
        print('Failed to fetch getfullTT: ${response.statusCode}');
        print('Response body getfullTT: ${response.body}');
      }
    } catch (e) {
      print('Error getfullTT: $e');
    }
    return null;
  }
}