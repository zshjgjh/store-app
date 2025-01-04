
import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';
import 'package:store/screens/update_product_page.dart';

class CustomCard extends StatefulWidget {
  CustomCard({required this.product}) ;
  ProductModel product;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Color color=Colors.grey;

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0),
      child: Stack(
          clipBehavior:Clip.none,
          children:[
            Container(
              decoration:BoxDecoration(
                  boxShadow:[
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 40,
                        offset: Offset(10,10)
                    )
                  ]
              ),
              height: 110,
              width: 200,
              child: GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, UpdateProductPage.id,arguments: widget.product);
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero
                  ),
                  color: Colors.white,
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.product.title.substring(0,12),style: TextStyle(
                              color: Colors.grey
                          ),),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(r'$''${widget.product.price.toString()}',style: TextStyle(
                                    color: Colors.black
                                ),),
                                IconButton(onPressed: (){}, icon: IconButton(
                                color: color,
                                  onPressed: () {
                                  if(color==Colors.grey){
                                    color=Colors.red;
                                    setState(() {

                                    });
                                  }else{
                                    color=Colors.grey;
                                    setState(() {

                                    });
                                  }
                                  }, icon:const Icon(Icons.favorite),
                                  ))
                              ]

                          ),]
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 20,
              top: -50,
              child: Image(image: NetworkImage(widget.product.image),
                height: 100,
                width: 100,),
            )
          ]
      ),
    );
  }
}