import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class OtraPagina extends StatefulWidget {
  @override
  _OtraPaginaState createState() => _OtraPaginaState();
}

class _OtraPaginaState extends State<OtraPagina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.local_fire_department_sharp,
            size: 28),
            onPressed: null,
            color: Colors.red[600],
          )
        ],
        title: Text("Calendario",
        style: new TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 23.0,
      color: Colors.black),),
        centerTitle: true,
      ),
      body: TableCalendar(
        focusedDay: DateTime.now(), 
        firstDay: DateTime(1998), 
        lastDay: DateTime(2050),
        ),
    );
  }
}