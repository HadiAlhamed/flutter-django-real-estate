import 'package:get/get.dart';
import 'package:real_estate/models/property_details.dart';

class PropertyDetailsController extends GetxController {
  bool isLoading = true;
  PropertyDetails? propertyDetails;
  List<bool> isFavorite = List.generate(100005, (index)=>false);
  void changeIsLoading(bool value) {
    isLoading = value;
    update(['main']);
  }

  void flipIsFavorite({required int propertyId}) {
    isFavorite[propertyId] = !isFavorite[propertyId];
    update(['isFavorite']);
  }
}
