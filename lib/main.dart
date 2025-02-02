
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
                    hintText: 'Enter the name of the contact'),
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 16),
              TextField(
                controller: phoneContact,
                decoration: InputDecoration(labelText: 'Number',
                border: OutlineInputBorder(),
                hintText:  'Enter the phone of the contact'),
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
              ),

              SizedBox(height: 16),
              Expanded(
                  child: ListView.builder(
                    itemCount: contacts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.person),
                        title: Text(contacts[index]['name']!),
                        subtitle: Text(contacts[index]['phone']!),
                        trailing: Icon(Icons.call),
                        onLongPress: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Confirmation',
                                style: TextStyle(fontWeight: FontWeight.bold),),
                                content: Text('Are you sure for Delete?'),
                                actions: [
                                IconButton(onPressed: ()
                                {

                                  Navigator.pop(context);
                                },
                                    icon: Icon(Icons.signal_cellular_no_sim_outlined),
                                  color: Colors.blue
                                ),

                                  IconButton(onPressed: ()
                                      {
                                        setState(() {
                                          contacts.removeAt(index);
                                        });
                                        Navigator.pop(context);
                                      },
                                    icon: Icon(Icons.delete),
                                  color: Colors.blue,
                                  )
                                ],
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }


final nameContact = TextEditingController();
  final phoneContact = TextEditingController();
List<Map<String, String>> contacts = [];
  void addContact()
  {
    final name = nameContact.text.trim();
    final phone = phoneContact.text.trim();

    String nameHelperText = "Name alreadu exists";
    String phoneHelperText = "Phone already exists";

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
      nameContact.clear();
      phoneContact.clear();
    }
  }


  @override
  Widget build(BuildContext context) {
    // Add your App widget implementation here
    return Container();
  }
