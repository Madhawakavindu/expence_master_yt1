import 'package:expence_master_yt/models/expence.dart';
import 'package:expence_master_yt/widgets/add_new_expences.dart';
import 'package:expence_master_yt/widgets/expence_list.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

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

  Map<String, double> dataMap = {
    "Food": 5,
    "Travel": 3,
    "Leasure": 2,
    "Work": 2,
  };

  //add new expence
  //(3) aluth expence ek hdnw.ita pass expence list ekt add krnw
  void onAddNewExpence(ExepenceModel expence) {
    setState(() {
      _exepenceList.add(expence);
    });
  }

  //function to open a model overlay
  void _openAddExpencesOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        //(4) return krnw new expence eka
        return AddNewExpences(onAddExpence: onAddNewExpence);
      },
    );
  }

  void addNewExpences(ExepenceModel expence) {
    setState(() {
      _exepenceList.add(expence);
    });
  }

  //remove a expence
  void onDeleteExpence(ExepenceModel expence) {
    //store the delecting expence
    ExepenceModel deletingExpence = expence;
    //get the index of the removing expence
    final int removingIndex = _exepenceList.indexOf(expence);
    setState(() {
      _exepenceList.remove(expence);
    });

    //show snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Delete Sucessfull"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _exepenceList.insert(removingIndex, deletingExpence);
            });
          },
        ),
      ),
    );
  }

  //PIE CHART
  double foodVal = 0;
  double travelVal = 0;
  double leasureVal = 0;
  double workVal = 0;

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
      body: Column(
        children: [
          PieChart(dataMap: dataMap),
          ExpenceList(
            expenceList: _exepenceList,
            onDeleExpence: onDeleteExpence,
          ),
        ],
      ),
    );
  }
}
