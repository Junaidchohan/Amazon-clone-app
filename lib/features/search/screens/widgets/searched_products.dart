// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amazon_clone_app/common/widgets/stars.dart';
import 'package:flutter/material.dart';

import 'package:amazon_clone_app/models/product.dart';

class SearchedProducts extends StatelessWidget {
  final Product product;
  const SearchedProducts({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                product.images[0],
                fit: BoxFit.fitWidth,
                height: 135,
                width: 135,
              ),
              const SizedBox(width: 10),
              // Replace fixed width Column with Flexible
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(fontSize: 16),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Stars(rating: 4),
                    const SizedBox(height: 5),
                    Text(
                      '\$${product.price}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text("Eligible for FREE Shipping"),
                    const SizedBox(height: 5),
                    Text('In Stock', style: TextStyle(color: Colors.teal)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
