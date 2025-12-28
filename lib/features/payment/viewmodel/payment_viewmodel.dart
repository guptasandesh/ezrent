import '../model/payment_model.dart';

class PaymentViewModel {
  final PaymentModel paymentModel;
  PaymentViewModel(this.paymentModel);

  double get totalAmount => paymentModel.total;
}
