import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:task_app_prueba/app/ui/global_widgets/boton.dart';
import 'package:task_app_prueba/app/ui/utils/utilits.dart';

class ItemContainerWhitAnimation extends StatefulWidget {
  final Widget child;
  final Widget opcions;
  const ItemContainerWhitAnimation({Key? key,required  this.child,required this.opcions}) : super(key: key);

  @override
  State<ItemContainerWhitAnimation> createState() => _ItemContainerWhitAnimationState();
}

double normalContainerHeigth = 0.27;

class _ItemContainerWhitAnimationState extends State<ItemContainerWhitAnimation> {
  double containerHeigth = normalContainerHeigth;
  changeHeigth(){
    setState(() {
      containerHeigth == normalContainerHeigth ? containerHeigth = 0.5 : containerHeigth = normalContainerHeigth;
    });
  }
  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 2000),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                offset: const Offset(10,10),
                color: Colors.indigo.shade300.withOpacity(0.5)
              ),
              BoxShadow(
                blurRadius: 20,
                offset: const Offset(-10,-10),
                color: Colors.blue.shade50.withOpacity(0.5)
              )
            ]
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: displayWidth(context)*0.9,
                height: displayHeight(context)*containerHeigth,
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: Colors.grey.shade200.withOpacity(0.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Center(
                    child: Container(
                      height: displayHeight(context),
                      width: displayWidth(context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: Colors.grey.shade200,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 15,
                            offset: const Offset(5,5),
                            color: Colors.grey.shade500
                          ),
                        ]
                      ),
                      child: Column(
                        children: [
                          widget.child,
                          StylizedBottom(callback: ()=> changeHeigth(), title_of_botton: 'Opciones'),
                          containerHeigth == normalContainerHeigth
                            ? Container()
                            : FadeIn(duration: const Duration(milliseconds: 3000),child: widget.opcions)
                        ],
                      ),
                    ),
                  ),
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
}