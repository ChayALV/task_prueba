// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app_prueba/app/ui/utils/utilits.dart';

class Boton extends StatelessWidget {
  final VoidCallback callback;
  final String titulo_del_boton;
  const Boton({Key? key,required this.callback,required this.titulo_del_boton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15,),
        child: Container(
          width: displayWidth(context),
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue.shade50,
                Colors.indigo.shade300
              ]
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Colors.grey.shade500,
                offset: const Offset(10, 10)
              ),
              const BoxShadow(
                blurRadius: 10,
                color: Colors.white,
                offset: Offset(-5, -5)
              )
            ]
          ),
          child: Center(child: Text(
            titulo_del_boton,
            style:  GoogleFonts.roboto(
              fontWeight: FontWeight.w100,
              fontSize: 20,
          ))),
        ),
      ),
    );
  }
}