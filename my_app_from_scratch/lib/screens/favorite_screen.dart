import 'package:flutter/material.dart';
import 'package:my_app_from_scratch/models/favorite_model.dart';

import 'package:my_app_from_scratch/common/home_list.dart';
import 'package:provider/provider.dart';

class Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite'),
      ),
      body: Consumer<FavModel>(
        builder: (context, favModel, child) {
          return ListView.builder(
              itemCount: favModel.favList.length,
              itemBuilder: (context, index) {
                return favModel.favList.length > 0
                    ? Row(
                        children: [
                          Flexible(
                            child: ImageObject(
                              favModel.favList[index].imageURL,
                            ),
                            flex: 1,
                          ),
                          Flexible(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                TextObject(favModel.favList[index].title,
                                    favModel.favList[index].description),
                                CountObject(
                                  favModel.favList[index].countdown,
                                ),
                                Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: GestureDetector(
                              child: Icon(Icons.favorite,
                                color: Colors.red,
                                size: 32,
                              ),
                              onTap: () {                              
                                favModel.removeOfFavorite(index);
                              }),
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
              });
        },
      ),
    );
  }
}