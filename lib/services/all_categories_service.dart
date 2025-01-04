
import 'package:store/helper/api.dart';

class GetAllCategoriesService{
  Future<List<dynamic>> getAllCategoies() async {
    List<dynamic> data=await Api().get(url: 'https://fakestoreapi.com/products/categories');
    return data;
  }
}