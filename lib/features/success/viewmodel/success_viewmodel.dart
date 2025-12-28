import '../model/success_model.dart';

class SuccessViewModel {
  final SuccessModel model;
  SuccessViewModel(this.model);

  String get ownerName => model.ownerName;
  String get contactInfo => model.contactInfo;
}
