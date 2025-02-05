import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EmployeeForm(),
    );
  }
}

class EmployeeForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EmployeeFormState();
  }
}

class EmployeeFormState extends State<EmployeeForm> {
  final TextEditingController namefield = TextEditingController();
  final TextEditingController agefiled = TextEditingController();
  final TextEditingController salaryfiled = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Employee'),
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: namefield,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextFormField(
              controller: agefiled,
              decoration: InputDecoration(labelText: "Age"),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: salaryfiled,
              decoration: InputDecoration(labelText: "Salary"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                child: Text("Add Employee"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
