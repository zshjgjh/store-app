
import 'package:store/helper/api.dart';
import '../models/product_model.dart';


class GetCategoryProductService{
  Future<List<ProductModel>> getCategoryProduct({required String categoryName}) async {
    List<dynamic> data=await Api().get(url: 'https://fakestoreapi.com/products/category/$categoryName');
    List<ProductModel> productList=[];
    for(int i=0;i<data.length;i++){
      productList.add(ProductModel.fromJson(data[i]));
      print(ProductModel.fromJson(data[i]));
    }
    return productList;
  }
}