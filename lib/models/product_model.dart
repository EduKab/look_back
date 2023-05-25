class Product {
  final String desc;
  String id;
  final String name;
  final double price;
  final String url;

  Product(
      {required this.desc,
      this.id = '',
      required this.name,
      required this.price,
      required this.url});

  Map<String, dynamic> toJson() =>
      {'id': id, 'desc': desc, 'name': name, 'price': price, 'url': url};

  static Product fromJson(Map<String, dynamic> json) => 
  Product(
    id: json['id'], 
    desc: json['desc'], 
    name: json['name'], 
    price: json['price'], 
    url: json['url'], 
  );
}
