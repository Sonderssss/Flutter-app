import 'package:get/get.dart';

class CurrentPageController extends GetxController {
  var selectedPage = 0.obs;

  updateSelectedPage(index) => selectedPage.value = index;
}
