import 'package:burda_ui/Models/user_model.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  bool isVisible = false;
  List<UserModel> users = [
    UserModel(name: "Sevinc Alieva, 23", pleace: "Yaxinlidaq"),
    UserModel(name: "Gunel M-va, 4", pleace: "100 metr"),
    UserModel(name: "Shefeg Memmedli, 30", pleace: "150 metr"),
  ];

  void changeVisible(bool value) {
    isVisible = value;
    notifyListeners();
  }
}
