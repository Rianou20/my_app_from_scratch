import 'package:flutter/foundation.dart';
import 'package:my_app_from_scratch/models/home_model.dart';


class FavModel extends ChangeNotifier {
  List<Item> favList = [];
  

  addInFavorite(title, description, countdown, imageURL){
    Item item = Item(title: title, description: description, countdown:countdown, imageURL: imageURL);
    favList.add(item);
    notifyListeners();
  }

  removeOfFavorite(int index){
    favList.removeAt(index);
    notifyListeners();
  }
}