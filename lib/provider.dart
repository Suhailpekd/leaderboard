import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Providerclass extends ChangeNotifier {
  bool Colorchange = false;
  var color1 = Colors.grey;
  var color2 = Colors.green;
  var color;
  Future<void> Colorchangefn() async {
    if (Colorchange == false) {
      Colorchange = true;
    } else {
      Colorchange = false;
    }
    if (Colorchange == false) {
      color = color1;
    } else {
      color = color2;
    }

    notifyListeners();
  }

  String apiUrl =
      "https://e811e307-bc1a-4f80-8e1f-af2d64f41348.mock.pstmn.io/leaderboard";

  Future<dynamic> fetchData() async {
    try {
      var apicaller = await get(Uri.parse(
          "https://e811e307-bc1a-4f80-8e1f-af2d64f41348.mock.pstmn.io/leaderboard"));

      Map<String, dynamic> data = jsonDecode(apicaller.body);
      String region = data['region'];
      List<dynamic> leaders = data['leaders'];
      leaders.sort((a, b) => b['points'].compareTo(a['points']));
      notifyListeners();
      return leaders;
    } catch (e) {
      // Handle errors here
      print('Error fetching data: $e');
    }
  }
}
