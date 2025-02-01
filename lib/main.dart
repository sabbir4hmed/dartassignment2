
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContactList()
    );

  }
}

class ContactList extends StatefulWidget {
  @override
  ContactList createState() => ContactList();
}

class ContactList extends state<>

