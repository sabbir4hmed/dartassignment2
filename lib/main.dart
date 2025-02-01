
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContactList();
  }
}

class ContactList extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Contact List',
          style: TextStyle(color: Colors.white),),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: nameContact,
                decoration: InputDecoration(labelText: 'Name',
                border: OutlineInputBorder(),
                helperText: 'Enter the name of the contact'),
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 16),
              TextField(
                controller: phoneContact,
                decoration: InputDecoration(labelText: 'Phone',
                border: OutlineInputBorder(),
                helperText: 'Enter the phone of the contact'),
                keyboardType: TextInputType.number,
                cursorColor: Colors.blueGrey,
                maxLength: 11,
              ),
              SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: addContact,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                  ),
                  child: Text('Add Contact',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
final nameContact = TextEditingController();
final phoneContact = TextEditingController();  List<Map<String, String>> contacts = [];

  void addContact()
  {
    final name = nameContact.text.trim();
    final phone = phoneContact.text.trim();

    if(name.isNotEmpty && phone.isNotEmpty)
    {
      setState(() {
        contacts.add(
            {
              'name' : name,
              'phone' : phone
            });
      });
    }
  }
}

