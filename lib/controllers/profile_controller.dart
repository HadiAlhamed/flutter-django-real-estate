import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_estate/models/profile_info.dart';

class ProfileController extends GetxController {
  XFile? profilePhoto;
  ProfileInfo? currentUserInfo;
  void changeProfilePhoto(XFile photo) {
    profilePhoto = photo;
    update(['profilePhoto']);
  }

  void changeCurrentUserInfo(ProfileInfo profileInfo) {
    currentUserInfo = profileInfo;
    //update what need to be updated...
    update(['fullName']);
  }
}
