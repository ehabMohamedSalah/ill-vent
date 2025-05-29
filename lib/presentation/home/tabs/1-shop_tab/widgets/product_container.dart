import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ill_vent/core/utils/Appstyle.dart';
import 'package:ill_vent/data_layer/model/get_product_response/ProductsResponse.dart';
import 'package:ill_vent/presentation/home/tabs/1-shop_tab/widgets/product_details_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductContainer extends StatefulWidget {
  final ProductsResponse model;
  const ProductContainer({super.key, required this.model});

  @override
  State<ProductContainer> createState() => _ProductContainerState();
}

class _ProductContainerState extends State<ProductContainer>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Container(

      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ClipOval(
                     child: Image.network(
                      widget.model.thumbnail ?? "",
                      fit: BoxFit.cover,
                      height: 150,
                      width: 200,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(child: CircularProgressIndicator());
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Icon(Icons.image_not_supported, size: 50),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          widget.model.name ?? "",
                          style: Appstyle.small15(context)
                              .copyWith(color: Colors.black, fontSize: 20),
                          maxLines: 1,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "${widget.model.rating ?? ""}",
                            style: Appstyle.small15(context)
                                .copyWith(color: Colors.black26),
                          ),
                          Icon(Icons.star, color: Colors.yellow, size: 15),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Price :  ",
                            style: Appstyle.small15(context)
                                .copyWith(color: Colors.black),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Expanded(
                            child: Text(
                              "${widget.model.price} EGP ",
                              style: Appstyle.small15(context)
                                  .copyWith(color: Color(0xff5774BA)),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "Description :" ,
                            style: Appstyle.VerySmall15(context).copyWith(color: Colors.black),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),

                        ],
                      ),
                      Text(
                        " ${widget.model.description}" ,
                        style: Appstyle.VerySmall15(context).copyWith(color: Colors.grey),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap:  () {
                  Navigator.push(context,  MaterialPageRoute(builder:  (context) => ProductDetailsScreen(
                    "${widget.model.productId}"),));
                },
                child: Container(
                  height: 36,
                  width: 108,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "View More",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
