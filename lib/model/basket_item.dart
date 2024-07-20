class BasketItem {
  String id;
  String price;
  String name;
  String category1;
  String category2;
  String itemType;

  BasketItem({
    required this.id,
    required this.price,
    required this.name,
    required this.category1,
    required this.category2,
    required this.itemType,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'price': price,
        'name': name,
        'category1': category1,
        'category2': category2,
        'itemType': itemType,
      };
}
