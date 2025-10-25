import 'package:expence_master_yt/models/expence.dart';
import 'package:expence_master_yt/widgets/add_new_expences.dart';
import 'package:expence_master_yt/widgets/expence_list.dart';
import 'package:flutter/material.dart';

class Expences extends StatefulWidget {
  const Expences({super.key});

  @override
  State<Expences> createState() => _ExpencesState();
}

class _ExpencesState extends State<Expences> {
  //expenceList
  final List<ExepenceModel> _exepenceList = [
    ExepenceModel(
      title: "Football",
      amount: 12.5,
      date: DateTime.now(),
      category: Category.leasure,
    ),

    ExepenceModel(
      title: "Carrot",
      amount: 18,
      date: DateTime.now(),
      category: Category.food,
    ),

    ExepenceModel(
      title: "Bag",
      amount: 20,
      date: DateTime.now(),
      category: Category.travel,
    ),
  ];

  //function to open a model overlay
  void _openAddExpencesOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return AddNewExpences();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expence Master"),
        backgroundColor: Colors.lightBlue,
        elevation: 0,
        actions: [
          Container(
            color: const Color.fromARGB(255, 94, 208, 73),
            child: IconButton(
              color: Colors.black,
              onPressed: _openAddExpencesOverlay,
              icon: const Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: Column(children: [ExpenceList(expenceList: _exepenceList)]),
    );
  }
}
