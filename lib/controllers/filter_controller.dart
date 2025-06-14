import 'package:get/get.dart';
import 'package:real_estate/services/api.dart';

class FilterController extends GetxController {
  bool isForRent = true, isForSale = true;
  bool orderByArea = true, orderByPrice = true, orderAsc = true;
  bool villa = true, flat = true, house = true;
  bool isSaveLoading = false;
  void changeIsSaveLoading(bool value) {
    isSaveLoading = value;
    update(['saveButton']);
  }

  void flipVilla() {
    villa = !villa;
    update(["villa"]);
  }

  void flipFlat() {
    flat = !flat;
    update(["flat"]);
  }

  void flipHouse() {
    house = !house;
    update(["house"]);
  }

  void flipIsForRent() {
    isForRent = !isForRent;
    update(["isForRent"]);
  }

  void flipIsForSale() {
    isForSale = !isForSale;
    update(["isForSale"]);
  }

  void flipOrderByArea() {
    orderByArea = !orderByArea;
    update(["orderByArea"]);
  }

  void flipOrderByPrice() {
    orderByPrice = !orderByPrice;
    update(["orderByPrice"]);
  }

  void flipOrderAsc() {
    orderAsc = !orderAsc;
    update(["orderAsc"]);
  }

  Future<void> save() async {
    Future.wait([
      Api.box.write('isForRent', isForRent),
      Api.box.write('isForSale', isForSale),
      Api.box.write('orderByArea', orderByArea),
      Api.box.write('orderByPrice', orderByPrice),
      Api.box.write('orderAsc', orderAsc),
      Api.box.write('villa', villa),
      Api.box.write('flat', flat),
      Api.box.write('house', house),
    ]);
  }
}
