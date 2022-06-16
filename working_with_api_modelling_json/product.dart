
import 'dart:convert';
import 'package:http/http.dart' as http;

class Product {
  Product({
    this.id,
    this.brand,
    this.name,
    this.price,
    this.priceSign,
    this.currency,
    this.imageLink,
    this.productLink,
    this.websiteLink,
    this.description,
    this.rating,
    this.category,
    this.productType,
    this.tagList,
    this.createdAt,
    this.updatedAt,
    this.productApiUrl,
    this.apiFeaturedImage,
    this.productColors,
  });

  int? id;
  String? brand;
  String? name;
  String? price;
  dynamic priceSign;
  dynamic currency;
  String? imageLink;
  String? productLink;
  String? websiteLink;
  String? description;
  double? rating;
  String? category;
  String? productType;
  List<dynamic>? tagList;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? productApiUrl;
  String? apiFeaturedImage;
  List<ProuctColor>? productColors;

  // converts a map object to a Product object
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      brand: json["brand"],
      name: json["name"],
      price: json["price"],
      priceSign: json["price_sign"],
      currency: json["currency"],
      imageLink: json["image_link"],
      productLink: json["product_link"],
      websiteLink: json["website_link"],
      description: json["description"],
      rating: json["rating"]?.toDouble(),
      category: json["category"],
      productType: json["product_type"],
      tagList: List<dynamic>.from(json["tag_list"].map((x) => x)),
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      productApiUrl: json["product_api_url"],
      apiFeaturedImage: json["api_featured_image"],
      productColors: List<ProuctColor>.from(
          json["product_colors"].map((x) => ProuctColor.fromJson(x))),
    );
  }

  // Product to json (map)
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "brand": brand,
      "name": name,
      "price": price,
      "price_sign": priceSign,
      "currency": currency,
      "image_link": imageLink,
      "product_link": productLink,
      "website_link": websiteLink,
      "description": description,
      "rating": rating,
      "category": category,
      "product_type": productType,
      "tag_list": List<dynamic>.from(tagList!.map((e) => e)),
      "created_at": createdAt!.toIso8601String(),
      "updated_at": updatedAt!.toIso8601String(),
      "product_api_url": productApiUrl,
      "api_featured_image": apiFeaturedImage,
      "product_colors":
          List<ProuctColor>.from(productColors!.map((x) => x.toJson())),
    };
  }
}

// product color as there is a list in the product list
class ProuctColor {
  String? hexValue;
  String? colourName;

  ProuctColor({this.hexValue, this.colourName});

  factory ProuctColor.fromJson(Map<String, dynamic> json) {
    return ProuctColor(
        hexValue: json["hex_value"], colourName: json["colour_name"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "hex_value": hexValue,
      "colour_name": colourName,
    };
  }
}



// --------------------------------



class RemoteService {
  static var client = http.Client();

  static Future<List<Product>?> fetchProducts() async {
    var response = await client.get(Uri.parse(
        "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"));
    
    if(response.statusCode == 200) {
      var jsonString = response.body;
      return List<Product>.from(json.decode(jsonString).map((x)=>Product.fromJson(x)));
    } else {
      return null;
    }
  }
}