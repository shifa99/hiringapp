// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) => List<CategoryModel>.from(json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  CategoryModel({
    this.categoryId,
    this.locale,
    this.name,
    this.description,
  });

  int categoryId;
  String locale;
  String name;
  String description;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    categoryId: json["category_id"],
    locale: json["locale"],
    name: json["name"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "locale": locale,
    "name": name,
    "description": description,
  };
}
