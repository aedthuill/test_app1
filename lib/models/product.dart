import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.items,
    this.pagination,
  });

  List<Item>? items;

  Pagination? pagination;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
        "pagination": pagination!.toJson(),
      };
}

class Item {
  Item({
    this.id,
    this.title,
    this.slug,
    this.image,
    this.price,
    this.colors,
  });

  int? id;
  String? title;
  String? slug;

  Image? image;

  int? price;

  List<Color>? colors;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        image: Image.fromJson(json["image"]),
        price: json["price"],
        colors: List<Color>.from(json["colors"].map((x) => Color.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "image": image!.toJson(),
        "price": price,
        "colors": List<dynamic>.from(colors!.map((x) => x.toJson())),
      };
}

class Color {
  Color({
    this.id,
    this.title,
    this.code,
  });

  int? id;

  String? title;

  String? code;

  factory Color.fromJson(Map<String, dynamic> json) => Color(
        id: json["id"],
        title: json["title"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "code": code,
      };
}

class Image {
  Image({
    this.file,
  });

  FileClass? file;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        file: FileClass.fromJson(json["file"]),
      );

  Map<String, dynamic> toJson() => {
        "file": file!.toJson(),
      };
}

class FileClass {
  FileClass({
    this.url,
    this.name,
    this.originalName,
    this.extension,
    this.size,
  });

  String? url;
  String? name;
  String? originalName;
  String? extension;
  String? size;

  factory FileClass.fromJson(Map<String, dynamic> json) => FileClass(
        url: json["url"],
        name: json["name"],
        originalName: json["originalName"],
        extension: json["extension"],
        size: json["size"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "name": name,
        "originalName": originalName,
        "extension": extension,
        "size": size,
      };
}

class Pagination {
  Pagination({
    this.page,
    this.pages,
    this.total,
  });

  int? page;
  int? pages;
  int? total;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pages: json["pages"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "pages": pages,
        "total": total,
      };
}
