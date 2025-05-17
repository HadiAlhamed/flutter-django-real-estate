import 'package:get/get.dart';

class AddPropertyController extends GetxController {
  List<bool> selected = List.generate(6, (index) => false);
  void flipSelectedAt(int index) {
    selected[index] = !selected[index];
    index < 3 ? update(['firstRow']) : update(['secondRow']);
  }

  void clear() {
    selected = List.generate(6, (index) => false);
  }
}
