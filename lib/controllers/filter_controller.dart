import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/services/api.dart';

class FilterController extends GetxController {
  bool isForRent = true, isForSale = true;
  bool orderByArea = true, orderByPrice = true, orderAsc = true;
  bool villa = true, flat = true, house = true;
  bool isSaveLoading = false;
  RangeValues priceRange = const RangeValues(0, 10000);
  RangeValues areaRange = const RangeValues(0, 1000);
  RangeValues roomsRange = const RangeValues(0, 10);
  List<String> selectedCities = <String>[];
  void init() {
    isForRent = Api.box.read('isForRent')  as bool? ?? true;
    isForSale = Api.box.read('isForSale') as bool? ?? true;
    orderByArea = Api.box.read('orderByArea') as bool? ?? true;
    orderByPrice = Api.box.read('orderByPrice') as bool? ?? true;
    orderAsc = Api.box.read('orderAsc') as bool? ?? true;
    villa = Api.box.read('villa') as bool? ?? true;
    flat = Api.box.read('flat') as bool? ?? true;
    house = Api.box.read('house') as bool? ?? true;
    // selectedCities  = Api.box.read('selectedCities') == null || Api.box.read('selectedCities')
    //       .length < 1? <String>[] : Api.box.read('selectedCities');
    priceRange = Api.box.read('minPrice') == null
        ? const RangeValues(0, 10000)
        : RangeValues(Api.box.read('minPrice'), Api.box.read('maxPrice'));
    areaRange = Api.box.read('minArea') == null
        ? const RangeValues(0, 1000)
        : RangeValues(Api.box.read('minArea'), Api.box.read('maxArea'));
    roomsRange = Api.box.read('minRooms') == null
        ? const RangeValues(0, 10)
        : RangeValues(Api.box.read('minRooms'), Api.box.read('maxRooms'));
  }

  void setSelectedCities(List<String> cities) {
    selectedCities = cities;
  }

  void changePriceRange(RangeValues range) {
    priceRange = range;
    update(["priceRange"]);
  }

  void changeRoomsRange(RangeValues range) {
    roomsRange = range;
    update(["roomsRange"]);
  }

  void changeAreaRange(RangeValues range) {
    areaRange = range;
    update(["areaRange"]);
  }

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
    await Api.box.write('isForRent', isForRent);
    await Api.box.write('isForSale', isForSale);
    await Api.box.write('orderByArea', orderByArea);
    await Api.box.write('orderByPrice', orderByPrice);
    await Api.box.write('orderAsc', orderAsc);
    await Api.box.write('villa', villa);
    await Api.box.write('flat', flat);
    await Api.box.write('house', house);
    await Api.box.write('selectedCities', selectedCities);
    await Api.box.write('minPrice', priceRange.start);
    await Api.box.write('maxPrice', priceRange.end);
    await Api.box.write('minArea', areaRange.start);
    await Api.box.write('maxArea', areaRange.end);
    await Api.box.write('minRooms', roomsRange.start);
    await Api.box.write('maxRooms', roomsRange.end);
  }
}
