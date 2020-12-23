import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app_from_scratch/models/favorite_model.dart';

import 'package:my_app_from_scratch/widgets/home_list.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class Favorite extends StatelessWidget {
  final PersistentTabController persistentTabController;

  Favorite({this.persistentTabController});
  @override
  Widget build(BuildContext context) {
    return Consumer<FavModel>(builder: (context, favModel, child) {
      final favList = favModel.favList;

      List<dynamic> finalList =
          [...favModel.favList, ...favModel.emptyList].toSet().toList();
      return Scaffold(
        appBar: AppBar(
          title: Text('Favoris'),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: finalList.length,
                    itemBuilder: (context, index) {
                      return index < favList.length
                          ? FavItem(index, persistentTabController)
                          : EmptyItem(persistentTabController);
                    }),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: FlatButton(
                  child: Text(
                    'Add a place !',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    favModel.addEmpty(EmptyItem(
                      persistentTabController,
                    ));
                  },
                  color: Colors.green,
                ),
              )
            ]),
      );
    });
  }
}

class EmptyItem extends StatefulWidget {
  final PersistentTabController
      persistentTabController;

  EmptyItem(this.persistentTabController);

  @override
  _EmptyItemState createState() => _EmptyItemState();
}

class _EmptyItemState extends State<EmptyItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        left: 2.0,
        right: 2.0,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        color: Colors.blueGrey[100],
        child: FlatButton(
            height: MediaQuery.of(context).size.height / 5,
            onPressed: () {
              widget.persistentTabController.jumpToTab(0);
            },
            child: Text('Ajoute un favoris !')),
      ),
    );
  }
}

class FavItem extends StatelessWidget {
  final int index;
  final PersistentTabController persistentTabController;

  FavItem(this.index, this.persistentTabController);
  @override
  Widget build(BuildContext context) {
    return Consumer<FavModel>(builder: (context, favModel, child) {
      final favList = favModel.favList;
      var now = DateTime.now().millisecondsSinceEpoch;
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
                favList[index].imageURL,
              ),
              flex: 1,
            ),
            Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextObject(favList[index].title, favList[index].description),
                  CountObject(
                    favList[index].countdown,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: GestureDetector(
                        child: Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 32,
                        ),
                        onTap: () {
                          favList[index].countdown - now > 1210000000
                              ? favModel.removeOfFavorite(index, EmptyItem(persistentTabController), favList[index])
                              : Scaffold.of(context).showSnackBar(SnackBar(
                                  content: favList[index].countdown - now > 0
                                      ? Text(
                                          'La sortie est dans moins de 2 semaines.')
                                      : Text(
                                          'L\'élément sera supprimé dans 1 mois')));
                          ;
                        }),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}


// When I delete an item from this screen, it doesn't change the right icon in the main screen
// I know it because i put the index of this list but it was temporary
// May i can use an id for each item but how manage the item by their ids ?
// 