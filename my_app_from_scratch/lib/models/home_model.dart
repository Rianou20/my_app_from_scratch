class Item {
  final String title;
  final String description;
  final String imageURL;
  final int countdown;
  final int id;
  bool isFavorite;

  Item({
    this.title,
    this.description,
    this.imageURL,
    this.countdown,
    this.id,
    this.isFavorite,
  });
}