import 'package:get/get.dart';
import 'package:real_estate/models/property_details.dart';

class PropertyDetailsController extends GetxController {
  bool isLoading = true;
  PropertyDetails? propertyDetails;
  void changeIsLoading(bool value) {
    isLoading = value;
    update(['main']);
  }
}
