import 'package:flutter/material.dart';
import 'package:health_check/src/asset/colors.dart';
import 'package:health_check/src/config/routes.dart';
import 'package:health_check/src/provider/product_provider.dart';
import 'package:health_check/src/widgets/appbar.dart';
import 'package:health_check/src/widgets/test_item_card.dart';
import 'package:health_check/src/widgets/text.dart';
import 'package:provider/provider.dart';

import '../model/lab_test.dart';

class LabTestScreen extends StatefulWidget {
  const LabTestScreen({super.key});

  @override
  State<LabTestScreen> createState() => _LabTestScreenState();
}

late Product product;
late ProductProvider productProvider;

class _LabTestScreenState extends State<LabTestScreen> {
  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);
    productProvider.getProducData();
    List<Product> labProduct;
    labProduct = productProvider.getLabItemList;
    return Builder(builder: (context) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: topNavigationBar(
                title: "Logo",
                trailingWidget: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Stack(
                    children: [
                      productProvider.getCheckOutModelListLength != 0
                          ? Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                    color: AppColors.color3,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: text2(
                                      productProvider.getCheckOutModelListLength
                                          .toString(),
                                      AppColors.color10,
                                      const EdgeInsets.all(0),
                                      TextDecoration.none),
                                ),
                              ),
                            )
                          : Container(),
                      IconButton(
                        onPressed: () {
                          goToMyCart(context);
                        },
                        icon: const Icon(Icons.shopping_cart),
                        color: AppColors.color1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          heading2("Popular lab tests", AppColors.color1,
                              EdgeInsets.zero, TextDecoration.none),
                          GestureDetector(
                            onTap: () {},
                            child: title3("View More", AppColors.color1,
                                EdgeInsets.zero, TextDecoration.underline),
                          ),
                        ],
                      ),
                    ),
                    GridView.count(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 15,
                      children: labProduct
                          .map((e) => itemCard(
                                e.name,
                                e.numTests,
                                e.price,
                                e.discount,
                                const EdgeInsets.symmetric(horizontal: 5),
                                () {
                                  productProvider.getCheckOutData(
                                      totprice: e.price,
                                      name: e.name,
                                      discount: e.discount);
                                },
                                () {},
                              ))
                          .take(4)
                          .toList(),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          heading2("Popular Packages", AppColors.color1,
                              EdgeInsets.zero, TextDecoration.none),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                      child: popularItemCard(EdgeInsets.zero, () {}),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
