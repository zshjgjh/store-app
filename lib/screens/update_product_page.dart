
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/helper/snack_bar.dart';
import 'package:store/models/product_model.dart';
import 'package:store/screens/home_page.dart';
import 'package:store/services/update_product_service.dart';
import 'package:store/widgets/custom_button.dart';
import 'package:store/widgets/custom_text_field.dart';

import '../services/get_all_product_service.dart';

class UpdateProductPage extends StatefulWidget {
  static String id = 'Update product page';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
   String? productName,description,image,price;

   bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    ProductModel product=ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Update Product',
        style: TextStyle(
          color: Colors.black
        ),),
        centerTitle: true,
      ),
      body: ModalProgressHUD(
        inAsyncCall:isLoading ,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
                children: [
                  SizedBox(height: 100,),
                  CustomTextField(hintText: 'Product Name',
                    onChanged:(data){
                    productName=data;
                    } ,),
                  SizedBox(height: 5,),
                  CustomTextField(hintText: 'Description',
                  onChanged:(data){
                    description=data;
                  } ,),
                  SizedBox(height: 5,),
                  CustomTextField(hintText: 'Image',
                  onChanged: (data){
                    image=data;
                  } ,),
                  SizedBox(height: 5,),
                  CustomTextField(hintText: 'Price',
                  inputType: TextInputType.number,
                  onChanged: (data){
                    price=data;
                  } ,),
                  SizedBox(height: 40,),
                  CustomButton(text: 'Update',
                  onTap: ()async{
                    isLoading=true;
                    setState(() {

                    });
                    try {
                      await updateProduct(product);

                      setState(() {
                        future=GetAllProductsService().getAllProducts();
                      });
                      snackBar(context, 'Success',Colors.lightBlueAccent);


                    }catch (e){
                      print(e.toString());
                      snackBar(context, 'Success',Colors.lightBlueAccent);
                    }
                    isLoading=false;
                    setState(() {

                    });


                  },)


                ],
              ),
          ),
        ),
      )
      );

  }

  Future<void> updateProduct(ProductModel product) async {
     await UpdateProductService().updateProduct(id: product.id,
         title: productName==null?product.title:productName!,
         price: price==null?product.price.toString():price!,
         desc: description==null?product.description:description!,
         image: image==null?product.image:image!,
         category: product.category
     );
  }
}