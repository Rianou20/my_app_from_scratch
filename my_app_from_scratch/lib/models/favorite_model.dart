import 'package:flutter/foundation.dart';
import 'package:my_app_from_scratch/models/home_model.dart';

class FavModel extends ChangeNotifier {
  List<Item> favList = [];
  List<bool> isInFav = [];
  

  addInFavorite(title, description, countdown, imageURL, index){
    Item item = Item(title: title, description: description, countdown:countdown, imageURL: imageURL);
    favList.add(item);
    isInFav[index] = true;
    notifyListeners();
  }

  removeOfFavorite(int index, int index2){
    favList.removeAt(index);
    isInFav[index2] = false;
    notifyListeners();
  }

  implement(){
    isInFav.add(false);
  }
}