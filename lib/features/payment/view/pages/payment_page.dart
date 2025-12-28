import 'package:ezrent/features/search/model/property_model.dart';
import 'package:flutter/material.dart';
import '../widgets/payment_property_card.dart';
import '../../model/payment_model.dart';
import '../../viewmodel/payment_viewmodel.dart';
import '../../../success/view/pages/success_page.dart';
import 'package:ezrent/features/search/view/pages/search_page.dart';

class PaymentPage extends StatelessWidget {
  final Property property;
  const PaymentPage({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    // Dummy taxes/fees
    final paymentModel = PaymentModel(
      pricePerNight: property.pricePerRoom,
      taxes: 200,
      fees: 150,
    );
    final viewModel = PaymentViewModel(paymentModel);

    return Scaffold(
      appBar: AppBar(title: const Text('Payment')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PaymentPropertyCard(
            imagePath: property.imageUrl,
            name: property.name,
            location: property.location,
            pricePerNight: property.pricePerRoom,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Price per night'),
                    Text('₹${property.pricePerRoom.toStringAsFixed(0)}'),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Taxes'),
                    Text('₹${paymentModel.taxes.toStringAsFixed(0)}'),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Fees'),
                    Text('₹${paymentModel.fees.toStringAsFixed(0)}'),
                  ],
                ),
                const Divider(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '₹${viewModel.totalAmount.toStringAsFixed(0)}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.titleMedium,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SuccessPage()),
                  );
                },
                child: const Text('Proceed to Pay'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
