import 'dart:ffi';

import 'package:expence_master_yt/models/expence.dart';
import 'package:expence_master_yt/server/database.dart';
import 'package:expence_master_yt/widgets/add_new_expences.dart';
import 'package:expence_master_yt/widgets/expence_list.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pie_chart/pie_chart.dart';

class Expences extends StatefulWidget {
  const Expences({super.key});

  @override
  State<Expences> createState() => _ExpencesState();
}

class _ExpencesState extends State<Expences> {
  //expenceList
  //final List<ExepenceModel> _exepenceList = [];
  final _myBox = Hive.box("expenceDatabase");
  Database db = Database();

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
      db.expenceList.add(expence);
      calCategoryValues();
    });
    db.updateData();
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

  //remove a expence
  void onDeleteExpence(ExepenceModel expence) {
    //store the delecting expence
    ExepenceModel deletingExpence = expence;
    //get the index of the removing expence
    final int removingIndex = db.expenceList.indexOf(expence);
    setState(() {
      db.expenceList.remove(expence);
      db.updateData();
      calCategoryValues();
    });

    //show snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Delete Sucessfull"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              db.expenceList.insert(removingIndex, deletingExpence);
              db.updateData();
              calCategoryValues();
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

  void calCategoryValues() {
    double foodValTotal = 0;
    double travelValTotal = 0;
    double leasureValTotal = 0;
    double workValTotal = 0;

    for (final expence in db.expenceList) {
      if (expence.category == Category.food) {
        foodValTotal += expence.amount;
      }
      if (expence.category == Category.leasure) {
        leasureValTotal += expence.amount;
      }
      if (expence.category == Category.travel) {
        travelValTotal += expence.amount;
      }
      if (expence.category == Category.work) {
        workValTotal += expence.amount;
      }
    }
    setState(() {
      foodVal = foodValTotal;
      leasureVal = leasureValTotal;
      travelVal = travelValTotal;
      workVal = workValTotal;
    });

    //update the datamap
    dataMap = {
      "Food": foodVal,
      "Travel": travelVal,
      "Leasure": leasureVal,
      "Work": workVal,
    };
  }

  @override
  void initState() {
    //widget ek build wenwth ekkm calCategory ek run krnn
    super.initState();
    //if this is the first time create the initial data
    if (_myBox.get("EXP_DATA") == null) {
      db.createInitialDatabase();
      calCategoryValues();
    } else {
      db.loadData();
      calCategoryValues();
    }
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
      body: Column(
        children: [
          PieChart(dataMap: dataMap),
          ExpenceList(
            expenceList: db.expenceList,
            onDeleExpence: onDeleteExpence,
          ),
        ],
      ),
    );
  }
}
