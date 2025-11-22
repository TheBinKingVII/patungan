import 'package:flutter/material.dart';

class RatingSummary extends StatelessWidget {
  final List<double> ratingValues;

  const RatingSummary({super.key, required this.ratingValues});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min, 
      children: List.generate(5, (index) {
        String starLabel = (5 - index).toString();
        double progressValue = ratingValues[index];

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: Row(
            children: [
              // Label Angka 
              SizedBox(
                width: 12,
                child: Text(
                  starLabel,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              
              // Bar Progress
              SizedBox(width: 8),
              Expanded(
                child: LinearProgressIndicator(
                  minHeight: 6,
                  borderRadius: BorderRadius.circular(30),
                  value: progressValue,
                  color: Theme.of(context).colorScheme.secondary,
                  backgroundColor: Colors.grey.shade200,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
