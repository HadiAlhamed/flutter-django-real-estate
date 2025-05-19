import 'package:get/get.dart';
import 'package:real_estate/models/property.dart';
import 'package:real_estate/models/property_image.dart';

class PropertyController extends GetxController {
  List<Property> properties = [];
  Map<int, List<PropertyImage>> propertyImages = {};
  void addProperty(Property property) {
    properties.add(property);
  }
// var multipartImage = await MultipartFile.fromFile(
//     image.path,
//     filename: image.name,
//   );

//   // Create FormData
//   var formData = FormData.fromMap({
//     'image': multipartImage, // 'image' should match your backend's expected key
//     'propertyId': 'your_property_id', // Optional extra fields
//   });

//XFile -> MultiPartFile -> FormData
  void addImageToProperty({
    required int propertyId,
    required PropertyImage image,
  }) {
    if (propertyImages[propertyId] == null) propertyImages[propertyId] = [];
    propertyImages[propertyId]?.add(image);
  }

  void clearProperties() {
    properties.clear();
  }

  void clear() {
    properties.clear();
  }
}
