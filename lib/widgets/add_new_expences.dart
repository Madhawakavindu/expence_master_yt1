import 'package:flutter/material.dart';

class AddNewExpences extends StatefulWidget {
  const AddNewExpences({super.key});

  @override
  State<AddNewExpences> createState() => _AddNewExpencesState();
}

class _AddNewExpencesState extends State<AddNewExpences> {

  final _titleController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //title text feild
        TextField(
          controller: ,
          decoration:const InputDecoration(
            hintText: "Add new expence title",
            label: Text("Tile"),
            ),
            keyboardType: TextInputType.text,
            maxLength: 50,
        ),
      ],
    );
  }
}
