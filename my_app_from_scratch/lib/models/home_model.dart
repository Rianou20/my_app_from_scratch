import 'package:my_app_from_scratch/common/data.dart';

class Item {
  final String title;
  final String description;
  final String imageURL;
  final int countdown;
  final int id;

  Item({
    this.title,
    this.description,
    this.imageURL,
    this.countdown,
    this.id,
  });

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}

class HomeModel {
  

  Item getById(int id) => itemData[id??0 % itemData.length];

  Item getByPosition(int position) {
    if(position!=null)
    return getById(position);
    return getById(0);
  }
}
