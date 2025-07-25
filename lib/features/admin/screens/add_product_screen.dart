import 'dart:io';

import 'package:amazon_clone_app/common/widgets/custom_button.dart';
import 'package:amazon_clone_app/common/widgets/custome_textfield.dart';
import 'package:amazon_clone_app/constants/global_variables.dart';
import 'package:amazon_clone_app/constants/utils.dart';
import 'package:amazon_clone_app/features/admin/services/admin_services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class AddProductScreen extends StatefulWidget {
  static const String routName = '/add-product';
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  final AdminServices adminServices = AdminServices();

  String category = 'Mobiles';
  List<File> images = [];
  final _addProductFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion',
  ];

  void sellProducts() {
    if (_addProductFormKey.currentState!.validate() && images.isNotEmpty) {
      adminServices.sellProducts(
        context: context,
        name: productNameController.text,
        description: descriptionController.text,
        price: double.parse(priceController.text),
        quantity: double.parse(quantityController.text),
        category: category,
        images: images,
      );
    } else {
      showSnackBar(context, "Please fill all fields and select images.");
    }
  }

  void selectImages() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.image,
    );

    if (result != null) {
      setState(() {
        images = result.paths.map((path) => File(path!)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Text("Add Product", style: TextStyle(color: Colors.black)),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addProductFormKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(height: 20),
                images.isNotEmpty
                    ? CarouselSlider(
                      items:
                          images.map((i) {
                            return Builder(
                              builder:
                                  (BuildContext context) => Image.file(
                                    i,
                                    fit: BoxFit.cover,
                                    height: 200,
                                  ),
                            );
                          }).toList(),
                      options: CarouselOptions(
                        viewportFraction: 1,
                        height: 200,
                      ),
                    )
                    : GestureDetector(
                      onTap: selectImages,
                      child: DottedBorder(
                        options: RectDottedBorderOptions(
                          dashPattern: [10, 5],
                          strokeWidth: 2,
                          padding: EdgeInsets.all(10),
                        ),

                        child: Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.folder_open, size: 40),
                              SizedBox(height: 15),
                              Text(
                                "Select Product Image",
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                SizedBox(height: 30),
                CustomeTextfield(
                  controller: productNameController,
                  hintText: "Product Name",
                ),
                SizedBox(height: 10),
                CustomeTextfield(
                  controller: descriptionController,
                  hintText: "Description",
                  maxLines: 7,
                ),
                SizedBox(height: 10),
                CustomeTextfield(
                  controller: priceController,
                  hintText: "Price",
                ),
                SizedBox(height: 10),
                CustomeTextfield(
                  controller: quantityController,
                  hintText: "Quantity",
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: category,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items:
                        productCategories.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),

                    onChanged: (String? newVal) {
                      setState(() {
                        category = newVal!;
                      });
                    },
                  ),
                ),
                SizedBox(height: 10),
                CustomButton(text: "Sell", onTap: sellProducts),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
