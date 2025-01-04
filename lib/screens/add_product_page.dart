
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/helper/snack_bar.dart';
import 'package:store/screens/home_page.dart';
import 'package:store/widgets/custom_button.dart';
import 'package:store/widgets/custom_text_form_field.dart';
import '../services/add_product_service.dart';
import '../services/get_all_product_service.dart';

class AddProductPage extends StatefulWidget {
  static String id = 'Add product page';


  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  String? productName,description,image,price,category;

  bool isLoading=false;
  GlobalKey<FormState> formKey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Add New Product',
            style: TextStyle(
                color: Colors.black
            ),),
          centerTitle: true,
        ),
        body: ModalProgressHUD(
          inAsyncCall:isLoading ,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 50,),
                    CustomTextFormField(hintText: 'Product Name',
                      onChanged:(data){
                        productName=data;
                      } ,),
                    SizedBox(height: 5,),
                    CustomTextFormField(hintText: 'Description',
                      onChanged:(data){
                        description=data;
                      } ,),
                    SizedBox(height: 5,),
                    CustomTextFormField(hintText: 'Image',
                      onChanged: (data){
                        image=data;
                      } ,),
                    SizedBox(height: 5,),
                    CustomTextFormField(hintText: 'Price',
                      inputType: TextInputType.number,
                      onChanged: (data){
                        price=data;
                      } ,),
                    SizedBox(height: 5,),
                    CustomTextFormField(hintText: 'Category',
                      onChanged: (data){
                        category=data;
                      } ,),

                    SizedBox(height: 40,),
                    CustomButton(text: 'Add New Product',
                      onTap: ()async{
                     if (formKey.currentState!.validate()) {
                        isLoading=true;
                        setState(() {

                        });
                        try {
                          await addProduct();
                          setState(() {
                            future=GetAllProductsService().getAllProducts();
                          });
                          snackBar(context, 'Success',Colors.lightBlueAccent);
                          print('succsess');
                        }catch (e){
                          print(e.toString());
                          snackBar(context, 'Success',Colors.lightBlueAccent);
                        }
                        isLoading=false;
                        setState(() {

                        });

                      }
                      })


                  ],
                ),
              ),
            ),
          ),
        )
    );

  }

  Future<void> addProduct() async {
    await AddProductService().addProduct(
        title: productName!,
        price: price!,
        desc: description!,
        image: image!,
        category:category!);
  }
}