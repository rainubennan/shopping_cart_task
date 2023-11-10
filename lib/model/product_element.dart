class ProductElement {
  int? id;
  String title;
  String description;
  int? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String brand;
  String category;
  String thumbnail;
  List<String>? images;

  ProductElement({
    this.id,
    required this.title,
    required this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    this.images,
  });

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        discountPercentage: json["discountPercentage"]?.toDouble(),
        rating: json["rating"]?.toDouble(),
        stock: json["stock"],
        brand: json["brand"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "brand": brand,
        "category": category,
        "thumbnail": thumbnail,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
      };
}
