//data delate krnn save krnn(9)
import 'package:expence_master_yt/models/expence.dart';
import 'package:hive/hive.dart';

class Database {
  //create a database reference
  final _myBox = Hive.box("expenceDatabase");

  List<ExepenceModel> expenceList = [];

  //create the init expence list function

  void createInitialDatabase() {
    expenceList = [
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
  }

  // load the data
  void loadData() {
    final dynamic data = _myBox.get("EXP_DATA");
    //validate the data
    if (data != null && data is List<dynamic>) {
      expenceList = data.cast<ExepenceModel>().toList();
    }
  }

  // update the data

  Future<void> updateData() async {
    await _myBox.put("EXP_DATA", expenceList);
  }
}
