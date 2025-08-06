import 'package:amazon_clone_app/common/widgets/custom_button.dart';
import 'package:amazon_clone_app/common/widgets/stars.dart';
import 'package:amazon_clone_app/constants/global_variables.dart';
import 'package:amazon_clone_app/features/product_details/services/product_details_services.dart';
import 'package:amazon_clone_app/features/search/screens/search_screen.dart';
import 'package:amazon_clone_app/models/product.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const String routName = '/product-details';
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ProductDetailsServices productDetailsServices =
      ProductDetailsServices();

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted: navigateToSearchScreen,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 10),
                        hintText: 'Search Amazon.in',
                        hintStyle: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                        border: InputBorder.none,
                        prefixIcon: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(left: 6),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 23,
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                height: 42,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.mic, color: Colors.black, size: 25),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(widget.product.id!), Stars(rating: 4)],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Text(widget.product.name, style: TextStyle(fontSize: 15)),
            ),
            CarouselSlider(
              items:
                  widget.product.images.map((i) {
                    return Builder(
                      builder:
                          (BuildContext context) => Image.network(
                            i,
                            fit: BoxFit.contain,
                            height: 200,
                          ),
                    );
                  }).toList(),
              options: CarouselOptions(viewportFraction: 1, height: 300),
            ),
            Container(color: Colors.black12, height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(
                  text: "Deal Price: ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: '\$${widget.product.price}',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.product.description),
            ),
            Container(color: Colors.black12, height: 5),
            Padding(
              padding: const EdgeInsets.all(10),
              child: CustomButton(text: "Bay Now", onTap: () {}),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10),
              child: CustomButton(
                text: "Add to Cart",
                onTap: () {},
                color: Color.fromRGBO(254, 216, 19, 1),
              ),
            ),
            SizedBox(height: 10),
            Container(color: Colors.black12, height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Rate The Product',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ),
            RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              allowHalfRating: true,
              direction: Axis.horizontal,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4),
              itemBuilder:
                  (context, _) =>
                      Icon(Icons.star, color: GlobalVariables.secondaryColor),
              onRatingUpdate: (rating) {
                productDetailsServices.rateProduct(
                  context: context,
                  product: widget.product,
                  rating: rating,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
