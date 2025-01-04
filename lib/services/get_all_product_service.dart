
import 'package:store/helper/api.dart';
import '../models/product_model.dart';


class GetAllProductsService{
Future<List<ProductModel>> getAllProducts() async {
  
  List<dynamic> data=await Api().get(url: 'https://fakestoreapi.com/products');
  List<ProductModel> productList=[];
  for(int i=0;i<data.length;i++){
      productList.add(ProductModel.fromJson(data[i]));
  }
  return productList;
}
}