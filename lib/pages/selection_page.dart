import 'dart:html';

import 'package:flutter/material.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  DateTime _dateTime = DateTime.now();

  selectedDate() async {
    DateTime? newDate = await showDatePicker(
        context: context,
        initialDate: _dateTime,
        firstDate: DateTime(1950),
        lastDate: DateTime(2030));

    if (newDate == null) return;
    setState(() => _dateTime = newDate);

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Data Picker"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: '${_dateTime.year}/${_dateTime.month}/${_dateTime.day} ',
              ),
              onTap: () {
                selectedDate();
              },
            ),
          ],
        ),
      ),
    );
  }
}
