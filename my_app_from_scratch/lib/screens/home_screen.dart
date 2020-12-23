import 'package:flutter/material.dart';
import 'package:Hora/common/data.dart';
import 'package:Hora/models/favorite_model.dart';
import 'package:provider/provider.dart';
import 'package:Hora/widgets/home_list.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: Consumer<FavModel>(builder: (context, favModel, child) {
        final snackBar = SnackBar(content: Text('Tu n\'a pas assez de place !'));
        return ListView.builder(
            shrinkWrap: false,
            itemCount: itemData.length,
            itemBuilder: (context, index) {
              favModel.implement();
              return Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  left: 2.0,
                  right: 2.0,
                ),
                child: Row(
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
                          TextObject(itemData[index].title,
                              itemData[index].description),
                          CountObject(
                            itemData[index].countdown,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: GestureDetector(
                                child: Icon(
                                  itemData[index].isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: itemData[index].isFavorite
                                      ? Colors.red
                                      : null,
                                  size: 32,
                                ),
                                onTap: () {
                                  itemData[index].isFavorite
                                      ? null
                                      : favModel.emptyList.length > 0 ?
                                      Provider.of<FavModel>(context,listen: false)
                                          .addInFavorite(
                                          itemData[index],
                                          index,
                                          0,
                                        ) : Scaffold.of(context).showSnackBar(snackBar);
                                  
                                }),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            });
      }),
    );
  }
}
