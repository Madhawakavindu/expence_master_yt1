//create a unique id using uuid
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

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

class ExepenceModel {
  //constructor
  ExepenceModel({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid;

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  //getter > formated date
  String get getFormatedDate {
    return famattedDate.format(date);
  }
}
