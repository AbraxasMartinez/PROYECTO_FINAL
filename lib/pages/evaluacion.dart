import 'package:flutter/material.dart';

 class  evaluacion extends StatelessWidget{
   const evaluacion({ Key? key }) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title:  Text("*   Evaluacion   *"),
         ),
         body: Padding(
           padding: const EdgeInsets.all(30.0),
           child: Column(
             children: [
               Text("Evaluacion General de tu Curso:",
               style: TextStyle(fontSize: 33, fontWeight:
                FontWeight.w900)),
                
               Text("Examen: 40%",style: TextStyle(fontSize: 18, fontWeight:
                FontWeight.w500)),

               Text("Proyecto: 40%",style: TextStyle(fontSize: 18, fontWeight:
                FontWeight.w500)),

               Text("Tareas: 20%",style: TextStyle(fontSize: 18, fontWeight:
                FontWeight.w500)),
                
               Text("\n Tu correo estudiantil es: 419081966@pcpuma.acatlan.unam.mx",style: TextStyle(fontSize: 18, fontWeight:
                FontWeight.w700)), 
             ],
           ),
         ),
     );
   }
 }