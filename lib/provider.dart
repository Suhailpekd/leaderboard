import 'package:flutter/material.dart';

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
}
