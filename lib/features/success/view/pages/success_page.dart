import 'package:flutter/material.dart';
import '../widgets/success_icon.dart';
import '../../model/success_model.dart';
import '../../viewmodel/success_viewmodel.dart';
import '../../../search/view/pages/search_page.dart'; // Adjust import if needed

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy owner info
    final viewModel = SuccessViewModel(
      SuccessModel(ownerName: 'Amit Sharma', contactInfo: '+91 9876543210'),
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Success')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SuccessIcon(),
            const SizedBox(height: 32),
            Text(
              'Booking Successful',
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Owner: ${viewModel.ownerName}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Contact: ${viewModel.contactInfo}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SearchPage()),
                  );
                },
                child: const Text('Back to Search'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
