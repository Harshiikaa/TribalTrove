class Product {
  int? quantity;
  num? total;
  num? discountPercentage;
  num? discountedPrice;
  String seller;
  String? category;
  String? description;
  num? rating;
  int id;
  String title;
  num price;
  String images;
  bool isFavorite = false;

  Product(
      {this.quantity,
      this.total,
      this.discountPercentage,
      this.discountedPrice,
      required this.seller,
      this.category,
      this.description,
      this.rating,
      required this.id,
      required this.title,
      required this.price,
      required this.images});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      quantity: json['quantity'],
      total: json['total'],
      discountPercentage: json['discountPercentage'],
      discountedPrice: json['discountedPrice'],
      id: json['id'],
      title: json['title'],
      seller: json['seller'],
      price: json['price'],
      category: json['category'],
      description: json['description'],
      rating: json['rating'],
      images: json['images']);

  Map<String, dynamic> toJson() => {
        'quantity': quantity,
        'total': total,
        'discountPercentage': discountPercentage,
        'discountedPrice': discountedPrice,
        'id': id,
        'title': title,
        'seller': seller,
        'price': price,
        'category': category,
        'description': description,
        'rating': rating,
        'images': images,
      };
}
