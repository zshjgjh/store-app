import 'package:store/helper/api.dart';
import 'package:store/models/product_model.dart';

class UpdateProductService{
  Future<ProductModel> updateProduct(
      { required dynamic id,
        required String title,
        required dynamic price,
        required String desc,
        required String image,
        required String category,
      }) async {
    Map<String,dynamic> data=await Api().put(url: 'https://fakestoreapi.com/products/$id', body: {
      'title':title,
      'price':price,
      'description':desc,
      'image':image,
      'category':category
    });
    return ProductModel.fromJson(data);
  }
}