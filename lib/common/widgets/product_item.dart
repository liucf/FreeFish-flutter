import 'package:flutter/material.dart';
import 'package:freefish/common/models/product_model.dart';
import 'package:freefish/common/utils/app_constants.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // return ImageWidget.url(
    //   product.thumbs.isNotEmpty
    //       ? '${AppConstants.serverAssetUrl}product/${product.thumbs.first.name}'
    //       : "${AppConstants.serverAssetUrl}default/computer.jpeg",
    //   width: 100,
    //   height: 100,
    //   fit: BoxFit.cover,
    // );
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed('product_detail', arguments: product.id);
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              product.thumbs.isNotEmpty
                  ? '${AppConstants.serverAssetUrl}product/${product.thumbs.first.name}'
                  : "${AppConstants.serverAssetUrl}default/computer.jpeg",
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                color: Colors.black.withOpacity(0.6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 40,
                    child: Text(product.name,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                        overflow: TextOverflow.fade),
                  ),
                  Text(
                    "\$${product.price}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      overflow: TextOverflow.clip,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
