import 'package:flutter/cupertino.dart';

class DisplayNameModel with ChangeNotifier {
  var result = "";
  setName(String name) {
    result = name;
    notifyListeners();
  }
}
