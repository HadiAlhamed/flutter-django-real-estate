import 'package:get/get.dart';
import 'package:real_estate/models/facility.dart';
import 'package:real_estate/models/property.dart';
import 'package:real_estate/models/property_image.dart';

class PropertyController extends GetxController {
  List<Property> properties = [];
  Map<int, List<PropertyImage>> propertyImages = {};
  Map<int, List<Facility>> propertyFacilities = {};

  void addProperty(Property property) {
    properties.add(property);
  }

//XFile -> MultiPartFile -> FormData
  void addImageToProperty({
    required int propertyId,
    required PropertyImage image,
  }) {
    if (propertyImages[propertyId] == null) propertyImages[propertyId] = [];
    propertyImages[propertyId]?.add(image);
  }

  void addFacilityToProperty({
    required int propertyId,
    required Facility facility,
  }) {
    if (propertyFacilities[propertyId] == null) {
      propertyFacilities[propertyId] = [];
    }
    propertyFacilities[propertyId]?.add(facility);
  }

  void clearProperties() {
    properties.clear();
    propertyImages.clear();
    propertyFacilities.clear();
  }

  void clear() {
    properties.clear();
    propertyImages.clear();
    propertyFacilities.clear();
  }
}
