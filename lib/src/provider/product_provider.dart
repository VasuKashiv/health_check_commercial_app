import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:health_check/src/model/lab_test.dart';

class ProductProvider with ChangeNotifier {
  late Product labProduct;
  List<Product> labItems = [];
  Future<void> getProducData() async {
    List<Product> newList = [];
    QuerySnapshot featureSnapShot = await FirebaseFirestore.instance
        .collection("products")
        .doc("labItems")
        .collection("labTest")
        .get();
    for (var element in featureSnapShot.docs) {
      labProduct = Product(
          name: element.data().toString().contains('name')
              ? element.get('name')
              : '',
          price: element.data().toString().contains('totprice')
              ? element.get("totprice")
              : 0,
          discount: element.data().toString().contains('discount')
              ? element.get("discount")
              : 0,
          numTests: element.data().toString().contains('numTest')
              ? element.get('numTest')
              : 0);
      newList.add(labProduct);
    }
    labItems = newList;
    notifyListeners();
  }

  List<Product> get getLabItemList {
    return labItems;
  }

  List<Product> checkOutModelList = [];
  late Product checkOutModel;
  void getCheckOutData(
      {required num totprice,
      required String name,
      required num discount,
      num numTest = 0}) {
    checkOutModel = Product(
        name: name, price: totprice, discount: discount, numTests: numTest);
    checkOutModelList.add(checkOutModel);
  }

  List<Product> get getCheckOutModelList {
    return List.from(checkOutModelList);
  }

  int get getCheckOutModelListLength {
    return checkOutModelList.length;
  }

  void deleteCheckoutProduct(int index) {
    checkOutModelList.removeAt(index);
    notifyListeners();
  }

  void clearCheckoutProduct() {
    checkOutModelList.clear();
    notifyListeners();
  }
}
