import 'package:flutter/material.dart';
import 'package:my_app_from_scratch/models/favorite_model.dart';

import 'package:my_app_from_scratch/common/home_list.dart';
import 'package:provider/provider.dart';

class Favorite extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var itemAdd = context.watch<FavModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite'),
      ),
      body: ListView.builder(
            itemCount: itemAdd.items.length,
            itemBuilder: (context, index) {
              return itemAdd.items.length > 0
                  ? Row(
                      children: [
                        Flexible(
                          child: ImageObject(
                            itemAdd.items[index].imageURL,
                          ),
                          flex: 1,
                        ),
                        Flexible(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              TextObject(itemAdd.items[index].title, itemAdd.items[index].description),
                              CountObject(
                                itemAdd.items[index].countdown,
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  : Center(
                      child: Text('There\'s nothings',
                          style: TextStyle(color: Colors.black)),
                    );
            }),
    );
  }
}
