import 'package:expence_master_yt/models/expence.dart';
import 'package:flutter/material.dart';

class ExpenceTile extends StatelessWidget {
  const ExpenceTile({super.key, required this.expence});

  final ExepenceModel expence;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.greenAccent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expence.title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(expence.amount.toStringAsFixed(2)),
                const Spacer(),
                Row(
                  children: [
                    Icon(CategoryIcons[expence.category]),
                    const SizedBox(width: 8),
                    Text(expence.getFormatedDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
    ;
  }
}
