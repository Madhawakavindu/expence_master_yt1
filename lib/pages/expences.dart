import 'package:flutter/material.dart';

class Expences extends StatefulWidget {
  const Expences({super.key});

  @override
  State<Expences> createState() => _ExpencesState();
}

class _ExpencesState extends State<Expences> {
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
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
