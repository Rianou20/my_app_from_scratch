import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

import 'package:my_app_from_scratch/models/home_model.dart';


class ImageObject extends StatelessWidget {
  final String itemData;
  const ImageObject(this.itemData);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.only(top: 5.0, left: 0.0),
      child: CachedNetworkImage(
        imageUrl: itemData,
        fit: BoxFit.cover,
      ),
    );
  }
}

class TextObject extends StatelessWidget {
  final String title;
  final String description;
  const TextObject(this.title, this.description);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Spacer(),
        Container(
          padding: const EdgeInsets.only(top: 15.0),
          child: FittedBox(
            child: Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10.0, top: 15.0),
          child: Text(
            description,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
        ),
        Spacer(),
      ],
    );
  }
}

class CountObject extends StatelessWidget {
  final int date;
  const CountObject(
    this.date,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 10.0),
        child: CountdownTimer(
          daysSymbol: new Text("j "),
          hoursSymbol: new Text(" : "),
          minSymbol: new Text(" : "),
          secSymbol: new Text(""),
          endTime: date,
          textStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          emptyWidget: Center(child: Text('Va sur Netflix !')),
        ));
  }
}

class FavWidget extends StatefulWidget {
  final List<Item>savedItems;
  final Object item;

  FavWidget(this.savedItems, this.item);
  @override
  _FavWidgetState createState() => _FavWidgetState();
}

class _FavWidgetState extends State<FavWidget> { 
  @override
  Widget build(BuildContext context) {
    bool isSaved = widget.savedItems.contains(widget.item);
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: GestureDetector(
        child: Icon(
          isSaved ? Icons.favorite : Icons.favorite_border,
          color: isSaved ? Colors.red : null,
          size: 32,
        ),
        onTap: () {
            
              //Provider.of<ItemAdd>(context).addItem(widget.savedItems[index].title, );
              isSaved = true;
        },
      ),
    );
  }
}
