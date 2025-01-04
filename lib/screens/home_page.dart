import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';
import 'package:store/screens/add_product_page.dart';
import 'package:store/services/category_product_service.dart';
import 'package:store/services/get_all_product_service.dart';
import '../widgets/custom_card.dart';

Future<List<ProductModel>> future=GetAllProductsService().getAllProducts();
class HomePage extends StatefulWidget {
  static String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearch=false;

  TextEditingController textEditingController=TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: isSearch?TextField(
          onSubmitted:(value){

            setState(() {
              future=GetCategoryProductService().getCategoryProduct(categoryName: value);

            });

          },
        ):
        const Text('New Trend',style: TextStyle(
          color: Colors.grey
        ),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            setState(() {
              isSearch=! isSearch;
              if(! isSearch){
                textEditingController.clear();
              }
            });

          }, icon:Icon(Icons.search,
            size: 30,
            color: Colors.blue.shade100,)),
          IconButton(onPressed: (){},
              icon:Icon(Icons.shopping_cart,
            size: 30,
            color: Colors.blue.shade100,))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 6.0,right: 6,top: 65),
        child: FutureBuilder<List<ProductModel>>(
          future:future,
          builder:(context,snapshot) {
            if(snapshot.hasData){
              List<ProductModel> products=snapshot.data!;
              return GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10
                ),
                itemBuilder: (context, index) {
                  return CustomCard(product: products[index],);
                });
          } else if (snapshot.hasError){
              return   Text('${snapshot.error}');
            }
            else {
              return Center(
                  child: CircularProgressIndicator());
            }
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, AddProductPage.id );
      },
      backgroundColor: Colors.blue.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(90)
        ),
      child: const Icon(Icons.add),),
    );
  }
}

