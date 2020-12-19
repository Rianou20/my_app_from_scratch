import 'package:flutter/foundation.dart';
import 'package:my_app_from_scratch/models/home_model.dart';


class FavModel extends ChangeNotifier {
  HomeModel _list;

  final List<int> _ids = [];


  set list(HomeModel newList) {
    assert(newList != null);
    assert(_ids.every((id) => newList.getById(id) != null),);
    _list = newList;
    notifyListeners();
  }

  List<Item> get items => _ids.map((id) => _list.getById(id)).toList();


  void add(Item item) {
    _ids.add(item.id);
    notifyListeners();
  }

  void remove(Item item) {
    _ids.remove(item.id);
    notifyListeners();
  }
}