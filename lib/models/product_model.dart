class Product {
  final String desc;
  String id;
  final String name;
  final double price;
  final String url;

  Product({
    required this.desc,
    this.id = '',
    required this.name,
    required this.price,
    required this.url
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'desc': desc,
    'name': name,
    'price': price,
    'url': url
  };
}
