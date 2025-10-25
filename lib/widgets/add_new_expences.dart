import 'package:flutter/material.dart';
import 'package:expence_master_yt/models/expence.dart';

class AddNewExpences extends StatefulWidget {
  const AddNewExpences({super.key});

  @override
  State<AddNewExpences> createState() => _AddNewExpencesState();
}

class _AddNewExpencesState extends State<AddNewExpences> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  Category _selectedCategory = Category.leasure;

  //date variables
  final DateTime initialDate = DateTime.now();
  final DateTime firstDate = DateTime(
    DateTime.now().year - 1,
    DateTime.now().month,
    DateTime.now().day,
  );
  final DateTime lastDate = DateTime(
    DateTime.now().year + 1,
    DateTime.now().month,
    DateTime.now().day,
  );
  // date time  variable ekk hdgannw user select krpu dinya save krl thiyaganna
  DateTime _selectedDate = DateTime.now();

  //date picker
  //future eka ganna nisa async aniwryen use krnn one. function ekt kamathi namak dila patan gamu
  Future<void> _openDateModal() async {
    try {
      //show the date model then store the user selected date
      //pickedDate = kamathi namak
      final pickedDate = await showDatePicker(
        context: context,
        firstDate: firstDate,
        lastDate: lastDate,
      );
      // select ek picked ekt = krgttata wdak na state ek wenas wen na.e nisa setState ekkt asin krgnn one.
      setState(() {
        _selectedDate = pickedDate!;
      });
    } catch (err) {
      print(err.toString());
    }
  }

  //handle for submit
  //submit krn title ek or amount ek emty nam eka pennana function ekk hdnw
  void _handleFormSubmit() {
    //form validation
    //convert the amount in to a double

    final userAmount = double.parse(_amountController.text.trim());
    if (_titleController.text.trim().isEmpty || userAmount <= 0) {}
  }

  //dis
  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          //title text feild
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              hintText: "Add new expence title",
              label: Text("Tile"),
            ),
            keyboardType: TextInputType.text,
            maxLength: 50,
          ),

          Row(
            children: [
              //amount
              Expanded(
                child: TextField(
                  controller: _amountController,
                  decoration: const InputDecoration(
                    helperText: "Enter the amount",
                    label: Text("Amount"),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              //date picker
              Expanded(
                child: Row(
                  //amount ek asse thw row ekk hadanawa date ek saha eke icon ek display wenn
                  children: [
                    Text(famattedDate.format(_selectedDate)),
                    IconButton(
                      onPressed: _openDateModal,
                      icon: const Icon(Icons.date_range_outlined),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              //value tika select karanna puluwn widihata hadaganna eka.dropdown button ekk daal.pahala karanne setState ekk dala state ek wenas karanna puluwan wenn hadanwa e kiyanne item select krnn pulun wihihata.
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name),
                      ),
                    )
                    .toList(),
                //state eka wenas wenna hadanawa. select karanna puluwn widiht.mokd meka statefullwidget ekk nisa.setState ekek assata dagannwa e nisa
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value!;
                    //value ekata ! meka use krnne value eka null wenn bari nisa
                  });
                },
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //close the model button
                    // context ek pop krm ek piywrk passt enw. e kiynne contex ek close wenw
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Colors.redAccent,
                        ),
                      ),
                      child: const Text("Close"),
                    ),
                    const SizedBox(width: 10),
                    //save the data and close the model button
                    ElevatedButton(
                      onPressed: _handleFormSubmit,
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Colors.greenAccent,
                        ),
                      ),
                      child: const Text("Save"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
