// Dummy PaymentModel for MVVM structure (not used for real logic)
class PaymentModel {
  final double pricePerNight;
  final double taxes;
  final double fees;

  PaymentModel({
    required this.pricePerNight,
    required this.taxes,
    required this.fees,
  });

  double get total => pricePerNight + taxes + fees;
}
