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
  List<String> selectedCities = [];
  void init()
  {
      isForRent = Api.box.read('isForRent') ?? true;
      isForSale = Api.box.read('isForSale' ) ?? true;
      orderByArea = Api.box.read('orderByArea') ?? true;
      orderByPrice = Api.box.read('orderByPrice') ?? true;
      orderAsc = Api.box.read('orderAsc') ?? true;
      villa = Api.box.read('villa') ?? true;
      flat = Api.box.read('flat') ?? true;
      house = Api.box.read('house') ?? true;
      selectedCities  = Api.box.read('selectedCities') ?? [];
      priceRange = Api.box.read('minPrice' ) == null ? const RangeValues(0 , 10000) : RangeValues(Api.box.read('minPrice' ),Api.box.read('maxPrice'));
      areaRange = Api.box.read('minArea') == null
        ? const RangeValues(0, 1000)
        :  RangeValues(Api.box.read('minArea'), Api.box.read('maxArea'));
      roomsRange = Api.box.read('minRooms' ) == null ? const RangeValues(0 , 10) : RangeValues(Api.box.read('minRooms'), Api.box.read('maxRooms'));
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
    Future.wait([
      Api.box.write('isForRent', isForRent),
      Api.box.write('isForSale', isForSale),
      Api.box.write('orderByArea', orderByArea),
      Api.box.write('orderByPrice', orderByPrice),
      Api.box.write('orderAsc', orderAsc),
      Api.box.write('villa', villa),
      Api.box.write('flat', flat),
      Api.box.write('house', house),
      Api.box.write('selectedCities', selectedCities),
      Api.box.write('minPrice' , priceRange.start),
      Api.box.write('maxPrice', priceRange.end),
      Api.box.write('minArea', areaRange.start),
      Api.box.write('maxArea', areaRange.end),
      Api.box.write('minRooms', roomsRange.start),
      Api.box.write('maxRooms', roomsRange.end),
    ]);
  }
}
