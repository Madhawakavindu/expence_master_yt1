import 'package:expence_master_yt/models/expence.dart';
import 'package:expence_master_yt/pages/expences.dart';
import 'package:expence_master_yt/server/categories_adapter.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();

  //(7) expence.g.dart eke class eke nama copy paste krgnn
  Hive.registerAdapter(ExepenceModelAdapter());
  //dan categoryadapter eke class eke namath register krgnn (8)
  Hive.registerAdapter(CategoriesAdapter());
  //hive insilation krgnn main ek async krl ptn gnn(5)

  //hive box ekk hdamu (5) data save wena box ekt kamthi namak denna
  await Hive.openBox("expenceDatabase");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Expences(),
    );
  }
}
