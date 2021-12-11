import 'dart:html';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/models/productos_model.dart';
import 'package:flutter_application_1/pages/otra_pagina.dart';
import 'package:flutter_application_1/pages/pedido_lista.dart';
import 'package:flutter_application_1/pages/evaluacion.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: '              !HELP ME¡   '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ProductosModel> _productosModel = <ProductosModel>[];
  List<ProductosModel> _listCarro = <ProductosModel>[];

  @override
  void initState() {
    super.initState();
    _productosDb();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar:  AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 8.0),
            child: GestureDetector(
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Icon(
                    Icons.alarm,
                    size: 38,
                  ),
                  if (_listCarro.length > 0)
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: CircleAvatar(
                        radius:7.5,
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        child: Text(
                          _listCarro.length.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 13.0),
                        ),
                      ),
                    ),
                ],
              ),
              onTap: () {
                if (_listCarro.isNotEmpty)
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Cart(_listCarro),
                    ),
                  );
              },
            ),
          )
        ],
      ),
      drawer: Container(
        width: 170.0,
        child: Drawer(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            color: Colors.blue[200],
            child: new ListView(
              padding: EdgeInsets.only(top: 50.0),
              children: <Widget>[
                Container(
                  height: 120,
                  child: new UserAccountsDrawerHeader(
                    accountName: new Text('Help'),
                    accountEmail: new Text('Me',
                    style: new TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 15.0,
      color: Colors.black),),
                    decoration: new BoxDecoration(
                      image: new DecorationImage(image: AssetImage('assets/images/sirena.jpg'),
                      fit: BoxFit.fill)
                  ),
                  
                ),
              ),
              new Divider(),
              new ListTile(
                title: new Text(
                  'Calendario',
                   style: new TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 20.0,
      color: Colors.black),
                   ),
                   trailing: new Icon(
                     Icons.library_books_outlined,
                     size: 30.0,
                     color: Colors.black,
                   ),
                   onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                     builder: (BuildContext context) => OtraPagina()
                   )),
              ),
            ],
            
          ),
        ),

      ),
    ),
      body: _cuadroProductos(),
    );
  }
   GridView _cuadroProductos(){
     return GridView.builder( 
     padding: const EdgeInsets.all(8.0),
     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
     itemCount: _productosModel.length,
     itemBuilder: (context, index){
       final String image = _productosModel[index].image;
       var item = _productosModel[index];
       return Card(
         elevation: 30.0,
         child: Stack(
           fit: StackFit.loose,
           alignment: Alignment.center,
           children: <Widget>[
             Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Expanded(child:  new Image.asset("assets/images/$image",
                 fit: BoxFit.contain,),),
                 Text(item.name,
                 textAlign: TextAlign.center,
                 style:  TextStyle(fontSize: 20.0,fontWeight: FontWeight.w900),),
               SizedBox(
                 height: 15,
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   SizedBox(
                     height: 25,
                   ),
                   Text(item.price.toString(),style:  TextStyle(
                     fontWeight: FontWeight.w900,
                     fontSize: 10.0,
                   ),),
                   RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => evaluacion()));
                },
              child: Text("Evaluacion",
              style: TextStyle(fontSize: 18, fontWeight:
                FontWeight.w500),),
              ),


                   Padding(padding: const EdgeInsets.only(
                     right: 8.0,
                     bottom: 8.0,
                   ),
                   child:  Align(alignment: Alignment.bottomRight,
                   child: GestureDetector(
                     child: (!_listCarro.contains(item))
                      ? Icon(Icons.warning_amber_rounded,
                      color: Colors.red,
                      size: 35,
                      ) :
                      Icon(Icons.add_reaction,
                      color: Colors.green,
                      size: 35,
                      ),
                     onTap: (){
                       setState(() {
                         if(!_listCarro.contains(item))
                          _listCarro.add(item);
                          else
                          _listCarro.remove(item);
                       });
                     }, 
                   ),),),
                 ],
               )
               ],
             )
           ],
         ));
      },
    );
   }
  void _productosDb(){
    
    var list = <ProductosModel>[
    ProductosModel(' TAREA  ', 'tarea.png',2),
    ProductosModel(' PROYECTO  ', 'proyecto.jpg', 40),
    ProductosModel(' EXAMEN  ', 'examen.jpg', 13.3),
    ProductosModel(' DUDA  ', 'duda.jpg', 0),
    ];
    setState(() {
      _productosModel = list;
    });
  }
  
}