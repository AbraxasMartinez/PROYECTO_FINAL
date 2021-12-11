import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_application_1/models/productos_model.dart';

class   Cart extends StatefulWidget {
  final List<ProductosModel> _cart;
  
  Cart(this._cart);

  @override
  _CartState createState() => _CartState(this._cart);
}

class _CartState extends State<Cart> {

  _CartState(this._cart);
  final _scrollcontroller = ScrollController();
  var _firstScroll = true;
  bool _enabled = false;

  List<ProductosModel> _cart;

  Container pagoTotal(List<ProductosModel>_cart){
return Container(alignment: Alignment.centerRight,
padding: EdgeInsets.only(left: 120),
height: 70,
width: 400,
color: Colors.orange[400],
child: Row(
  children: <Widget>[
    Text("Avance Materia: \%${valorTotal(_cart)}",
    style: new TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: 20.0,
      color: Colors.black),)
    ],
   ),
  );
 }

  String valorTotal(List<ProductosModel> listaProductos){
    double total = 0.0;

    for (int i = 0; i<listaProductos.length; i++){
      total = total + listaProductos[i].price * listaProductos[i].quantity;
    }
    return total.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.local_fire_department_sharp,
            size: 28),
            onPressed: null,
            color: Colors.red[600],
          )
        ],
        title: Text('PORCENTAJE AVANCE MATERIA % ',
            style: new TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 20.0,
                color: Colors.black)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
            setState(() {
              _cart.length;
            });
          },
          color: Colors.orange,
        ),
        backgroundColor: Colors.yellow,
      ),
      body: GestureDetector(
          onVerticalDragUpdate: (details) {
            if (_enabled && _firstScroll) {
              _scrollcontroller
                  .jumpTo(_scrollcontroller.position.pixels - details.delta.dy);
            }
          },
          onVerticalDragEnd: (_) {
            if (_enabled) _firstScroll = false;
          },
          child: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _cart.length,
                itemBuilder: (context, index) {
                  final String imagen = _cart[index].image;
                  var item = _cart[index];
                  //item.quantity = 0;
                  return Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13.0, vertical: 3.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 150,
                                  height: 150,
                                  child: new Image.asset(
                                      "assets/images/$imagen",
                                      fit: BoxFit.contain),
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(item.name,
                                        style: new TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0,
                                            color: Colors.black)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: 100,
                                          height: 35,
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 10.0,
                                                  color: Colors.blue,
                                                  offset: Offset(0.0, 1.0),
                                                )
                                              ],
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(50.0),
                                              )),
                                          margin: EdgeInsets.only(top: 20.0),
                                          padding: EdgeInsets.all(2.0),
                                          child: new Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              SizedBox(
                                                height: 8.0,
                                              ),
                                              IconButton(
                                                icon: Icon(Icons.remove),
                                                onPressed: () {
                                                  _removeProduct(index);
                                                  valorTotal(_cart);
                                                 
                                                },
                                                color: Colors.red,
                                              ),
                                              Text('${_cart[index].quantity}',
                                                  style: new TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20.0,
                                                      color: Colors.white)),
                                              IconButton(
                                                icon: Icon(Icons.add),
                                                onPressed: () {
                                                  _addProduct(index);
                                                  valorTotal(_cart);
                                                },
                                                color: Colors
                                                    .yellow, // print(_cart);
                                              ),
                                              SizedBox(
                                                height: 8.0,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 25.0,
                                ),
                                Text(item.price.toString(),
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24.0,
                                        color: Colors.black))
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.blue[800],
                      )
                    ],
                  );
                },
              ),
              SizedBox(
                width: 10.0,
              ),
              pagoTotal(_cart),
              SizedBox(
                width: 20.0,
              ),
              
            ],
          ))),
    );
  }

  _addProduct(int index) {
    setState(() {
      _cart[index].quantity++;
    });
  }

  _removeProduct(int index) {
    setState(() {
      _cart[index].quantity--;
    });
  }
}