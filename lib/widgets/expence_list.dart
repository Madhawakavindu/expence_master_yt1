import 'package:expence_master_yt/models/expence.dart';
import 'package:expence_master_yt/widgets/expence_tile.dart';
import 'package:flutter/material.dart';

class ExpenceList extends StatelessWidget {
  final List<ExepenceModel> expenceList;
  final void Function(ExepenceModel expence) onDeleExpence;
  const ExpenceList({
    super.key,
    required this.expenceList,
    required this.onDeleExpence,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: expenceList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Dismissible(
              key: ValueKey(expenceList[index]),
              direction: DismissDirection.startToEnd,
              onDismissed: (direction) {
                onDeleExpence(expenceList[index]);
              },
              child: ExpenceTile(expence: expenceList[index]),
            ),
          );
        },
      ),
    );
  }
}
