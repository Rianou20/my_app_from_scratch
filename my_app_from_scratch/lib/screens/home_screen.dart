import 'package:flutter/material.dart';
import 'package:my_app_from_scratch/common/data.dart';
import 'package:my_app_from_scratch/models/favorite_model.dart';
import 'package:provider/provider.dart';
import './favorite_screen.dart';
import 'package:my_app_from_scratch/common/home_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<bool> isInFav = List<bool>();
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
            isInFav.add(false);
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
                      TextObject(
                          itemData[index].title, itemData[index].description),
                      CountObject(
                        itemData[index].countdown,
                      ),
                      Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: GestureDetector(
                              child: Icon(
                                isInFav.elementAt(index)
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isInFav[index] ? Colors.red : null,
                                size: 32,
                              ),
                              onTap: () {                              
                                isInFav[index] ? null : Provider.of<FavModel>(context,
                                            listen: false)
                                        .addInFavorite(
                                        itemData[index].title,
                                        itemData[index].description,
                                        itemData[index].countdown,
                                        itemData[index].imageURL,
                                      );
                                      isInFav[index] ? null :
                                setState(() {
                                  isInFav[index] = true;
                                });
                              }),
                       ),
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
