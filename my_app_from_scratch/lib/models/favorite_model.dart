import 'package:flutter/foundation.dart';
import 'package:Hora/common/data.dart';
import 'package:Hora/models/home_model.dart';
import 'package:Hora/screens/favorite_screen.dart';

class FavModel extends ChangeNotifier {
  List<Item> favList = [];
  List<bool> isInFav = [];
  List<EmptyItem> emptyList = [];
  Item item = Item();

  addInFavorite(item, index, index2) { 
    favList.add(item);
    itemData[index].isFavorite = true;
    emptyList.removeAt(index2);
    notifyListeners();
  }

  removeOfFavorite(int index, Object emptyItem, Item item) {
    favList.removeAt(index);
    emptyList.add(emptyItem);

    for(int i = 0;i<itemData.length;i++){
      if(itemData[i].id == item.id){
        itemData[i].isFavorite = false;
        break;
      }
    }
    notifyListeners();
  }

  addEmpty(Object emptyItem) {
    emptyList.add(emptyItem);
    notifyListeners();
  }

  implement() {
    isInFav.add(false);
  }
}
