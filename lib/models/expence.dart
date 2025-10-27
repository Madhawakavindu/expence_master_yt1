//create a unique id using uuid
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
// type id ek import karaganna mulinma(1)
import 'package:hive/hive.dart';

//(6) next you can open terminal and type > dart run build_runner build
part 'expence.g.dart';

final uuid = const Uuid().v4();

//date formatter
final famattedDate = DateFormat.yMd();

//enum for category userta awashya mona category ekd kiyala select krnn pulun wenna
enum Category { food, travel, leasure, work }

//category icons
final CategoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.leasure: Icons.leak_add,
  Category.travel: Icons.travel_explore,
  Category.work: Icons.work,
};

//hive type ekk hadaganna (2)
@HiveType(typeId: 1)
class ExepenceModel {
  //constructor
  ExepenceModel({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid;

  // dan hive field hadaganna(3)
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final double amount;

  @HiveField(3)
  final DateTime date;

  @HiveField(4)
  final Category category;

  //getter > formated date
  String get getFormatedDate {
    return famattedDate.format(date);
  }
}
