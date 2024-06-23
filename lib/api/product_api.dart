import 'dart:convert';
import 'package:fzc_app/models/product_model.dart';
import "package:http/http.dart" as http;

Future<List<ProductModel>> getProducts() async {
  final response = await http.get(Uri.parse("https://dummyjson.com/products"));

  if (response.statusCode == 200) {
    List jsonRepsonse = json.decode(response.body)['products'];
    return jsonRepsonse.map((item) => ProductModel.fromJson(item)).toList();
  } else {
    throw Exception("Failed to load products!");
  }
}
