
import 'package:http/http.dart' as http;
import 'dart:convert';
class ProductService {
  Future<void> fetchProducts() async {
    final url = Uri.parse(
      'https://dummyjson.com/products',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      print(data['products'][0]['title']);
      print(data['products'][0]['price']);
    }

    print(response.statusCode);
    print(response.body);
  }
}
