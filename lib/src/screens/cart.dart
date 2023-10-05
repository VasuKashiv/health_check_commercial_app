import 'package:flutter/material.dart';
import 'package:health_check/src/asset/colors.dart';
import 'package:health_check/src/config/routes.dart';
import 'package:health_check/src/model/lab_test.dart';
import 'package:health_check/src/provider/appointment_provider.dart';
import 'package:health_check/src/provider/product_provider.dart';
import 'package:health_check/src/widgets/appbar.dart';
import 'package:health_check/src/widgets/buttons.dart';
import 'package:health_check/src/widgets/cart_items.dart';
import 'package:health_check/src/widgets/text.dart';
import 'package:provider/provider.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

late ProductProvider productProvider;
late BookAppointmentsProvider bookAppointmentsProvider;

class _MyCartState extends State<MyCart> {
  Set<num> calculateBill(List<Product> productCartList) {
    num subTotal = 0;
    num totaldiscount = 0;
    for (var element in productCartList) {
      subTotal += element.price * 1;
      totaldiscount += element.discount;
    }
    if (productProvider.checkOutModelList.isEmpty) {
      subTotal = 0.0;
      totaldiscount = 0.0;
    }
    return {subTotal, totaldiscount};
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context);
    List<Product> productCartList = productProvider.getCheckOutModelList;
    bookAppointmentsProvider = Provider.of<BookAppointmentsProvider>(context);

    num subTotal = calculateBill(productCartList).first;
    num totaldiscount = calculateBill(productCartList).last;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: topNavigationBar(
                title: "My Cart",
                leadingWidget: IconButton(
                    onPressed: () {
                      goBack(context);
                    },
                    icon: const Icon(Icons.arrow_back))),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  heading2("Order Review", AppColors.color1,
                      const EdgeInsets.only(left: 20), TextDecoration.none),
                  productProvider.getCheckOutModelListLength == 0
                      ? Center(
                          child: heading1(
                              "Your cart is empty",
                              AppColors.color9,
                              const EdgeInsets.symmetric(vertical: 10),
                              TextDecoration.none),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: productCartList.length,
                          itemBuilder: (context, index) => cartItemCard(
                              productCartList[index].name,
                              productCartList[index].price,
                              productCartList[index].discount,
                              const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5), () {
                            productProvider.deleteCheckoutProduct(index);
                          }),
                        ),
                  cartDateSelector(
                      bookAppointmentsProvider.getDetails.isEmpty
                          ? "Select Date"
                          : bookAppointmentsProvider.getDetails['date'] +
                              " (" +
                              bookAppointmentsProvider.getDetails['time'] +
                              ")",
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      () async {
                    await goToBookScreen(context);
                  }),
                  billCard(subTotal, totaldiscount,
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5)),
                  consentCard(
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      1,
                      1,
                      (val) {}),
                ],
              ),
            ),
          ),
          bookAppointmentsProvider.getDetails.isEmpty || productCartList.isEmpty
              ? outlinedFlexedTextButton(
                  "Schedule",
                  40,
                  const EdgeInsets.only(
                      top: 5, bottom: 20, left: 20, right: 20),
                  () {})
              : flexedTextButton(
                  "Schedule",
                  40,
                  const EdgeInsets.only(
                      top: 5, bottom: 20, left: 20, right: 20), () {
                  confirmOrder(context);
                }),
        ],
      ),
    );
  }
}
