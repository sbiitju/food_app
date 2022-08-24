import 'package:get/get.dart';

import '../data/repo/base_repo.dart';

abstract class BaseController extends GetxController {
  final BaseRepo _repository = Get.find(tag: (BaseRepo).toString());
  final logoutController = false.obs;
  var isCartPopUpShowing = true.obs;

  //Reload the page
  final _refreshController = false.obs;

  refreshPage(bool refresh) => _refreshController(refresh);

  //Controls page state

  final _messageController = ''.obs;

  String get message => _messageController.value;

  showMessage(String msg) => _messageController(msg);

  final _errorMessageController = ''.obs;

  String get errorMessage => _errorMessageController.value;

  showErrorMessage(String msg) {
    _errorMessageController(msg);
  }

  final _successMessageController = ''.obs;

  String get successMessage => _messageController.value;

  showSuccessMessage(String msg) => _successMessageController(msg);
}
