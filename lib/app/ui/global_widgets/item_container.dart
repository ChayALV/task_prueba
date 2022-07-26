import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:task_app_prueba/app/ui/utils/utilits.dart';

class ItemContainer extends StatefulWidget {
  final Widget child;
  const ItemContainer({Key? key,required  this.child}) : super(key: key);

  @override
  State<ItemContainer> createState() => _ItemContainerState();
}


class _ItemContainerState extends State<ItemContainer> {
  
  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
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
              child: Container(
                width: displayWidth(context)*0.9,
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: Colors.grey.shade200.withOpacity(0.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Center(
                    child: Container(
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
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: widget.child,
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