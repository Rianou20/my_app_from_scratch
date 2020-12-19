import 'package:flutter/material.dart';
import 'package:my_app_from_scratch/common/data.dart';
import 'package:my_app_from_scratch/models/favorite_model.dart';
import 'package:my_app_from_scratch/models/home_model.dart';
import 'package:provider/provider.dart';
import './favorite_screen.dart';
import 'package:my_app_from_scratch/common/home_list.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                fullscreenDialog: true,
                builder: (context) {
                  return Favorite();
                },
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
          shrinkWrap: false,
          itemCount: itemData.length,
          itemBuilder: (context, index) {
            return _MyListItem(index);
          }),
    );
  }
}

class _MyListItem extends StatelessWidget {
  final int index;
  _MyListItem(this.index, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var item = context.select<HomeModel, Item>((list) => list.getByPosition(index),
    );
    var isInFav =context.select<FavModel, bool>((fav) => fav.items.contains(item),
    );
    return Row(
      children: [
        Flexible(
          child: ImageObject(
            itemData[index].imageURL,
          ),
          flex: 1,
        ),
        Flexible(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextObject(itemData[index].title, itemData[index].description),
              CountObject(
                itemData[index].countdown,
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: GestureDetector(
                    child: Icon(
                      isInFav ? Icons.favorite : Icons.favorite_border,
                      color: isInFav ? Colors.red : null,
                      size: 32,
                    ),
                    onTap: () {
                      isInFav
                          ? context.read<FavModel>().remove(item)
                          : context.read<FavModel>().add(item);
                    }),
              ),
            ],
          ),
        )
      ],
    );
  }
}
