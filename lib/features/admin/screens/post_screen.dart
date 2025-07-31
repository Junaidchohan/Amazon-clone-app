import 'package:amazon_clone_app/common/widgets/loader.dart';
import 'package:amazon_clone_app/features/account/widgets/single_product.dart';
import 'package:amazon_clone_app/features/admin/screens/add_product_screen.dart';
import 'package:amazon_clone_app/features/admin/services/admin_services.dart';
import 'package:amazon_clone_app/models/product.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Product>? products;
  final AdminServices adminServices = AdminServices();
  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProductScreen.routName);
  }

  @override
  Widget build(BuildContext context) {
    return Product == null
        ? Loader()
        : Scaffold(
          body: GridView.builder(
            itemCount: products!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              final productData = products![index];
              return Column(
                children: [
                  SizedBox(
                    height: 140,
                    child: SingleProduct(image: productData.images[0]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Text(
                          productData.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.delete_outline),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: navigateToAddProduct,
            tooltip: 'Add a Product',
            child: Icon(Icons.add),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
  }
}
