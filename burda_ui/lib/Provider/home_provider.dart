import 'package:burda_ui/Models/user_model.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  bool isVisible = false;
  UserModel currenUser = UserModel(
      favorites: 962,
      name: "Tural Selimli",
      pleace: '',
      imageUrl:
          'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?w=1800&t=st=1712091263~exp=1712091863~hmac=c1994e39999b6206d9fe256cd0516e75bbefe1d77f5f73d14187d44e34cf25ce');
  List<UserModel> users = [
    UserModel(
        favorites: 755,

        name: "Sevinc Alieva, 23",
        pleace: "Yaxinlidaq",
        imageUrl:
            'https://img.freepik.com/free-photo/young-blonde-woman-wearing-striped-shirt_273609-14416.jpg?w=1800&t=st=1712091566~exp=1712092166~hmac=a87e59e1ed79990a8e69e6cdeb62bfd21d52578c60bb6283efcac6f02e797025'),
    UserModel(
        favorites: 215,
        name: "Gunel M-va, 4",
        pleace: "100 metr",
        imageUrl:
            'https://img.freepik.com/free-photo/cheerful-curly-business-girl-wearing-glasses_176420-206.jpg?w=1800&t=st=1712091506~exp=1712092106~hmac=a3e614cfdfc12b783c3d2ade647b65856dc9ecfb543ebb8a22ef390f73c5bfc6'),
    UserModel(
        favorites: 621,
        name: "Shefeg Memmedli, 30",
        pleace: "150 metr",
        imageUrl:
            'https://img.freepik.com/free-photo/portrait-beautiful-young-woman-standing-grey-wall_231208-10760.jpg?w=1800&t=st=1712091537~exp=1712092137~hmac=8ceb595260592abe2d00bdbf4bb7889815d0460bd87929a1360283348d3cf815'),
  ];

  void changeVisible(bool value) {
    isVisible = value;
    notifyListeners();
  }

  Future<bool> checkSplash() async {
    await Future.delayed(const Duration(seconds: 3));
    return true;
  }
}
