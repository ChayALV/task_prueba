import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Size displaySize(BuildContext context) {
  // debugPrint('Size = ' + MediaQuery.of(context).size.toString());
  return MediaQuery.of(context).size;
}

Orientation displayOrientation(BuildContext context) {
  // debugPrint('Size = ' + MediaQuery.of(context).size.toString());
  return MediaQuery.of(context).orientation;
}

double displayHeight(BuildContext context) {
  // debugPrint('Height = ' + displaySize(context).height.toString());
  return displaySize(context).height;
}

double displayWidth(BuildContext context) {
  // debugPrint('Width = ' + displaySize(context).width.toString());
  return displaySize(context).width;
}


Map<String,String> headers = {
  'Authorization' : 'Bearer e864a0c9eda63181d7d65bc73e61e3dc6b74ef9b82f7049f1fc7d9fc8f29706025bd271d1ee1822b15d654a84e1a0997b973a46f923cc9977b3fcbb064179ecd',
};

Map<String,dynamic> params = {
  'token' : 'e864a0c9eda63181d7d65bc73e61e3dc6b74ef9b82f7049f1fc7d9fc8f29706025bd271d1ee1822b15d654a84e1a0997b973a46f923cc9977b3fcbb064179ecd',
};

const String baseUrlOfTasks = 'ecsdevapi.nextline.mx';
const String token = 'e864a0c9eda63181d7d65bc73e61e3dc6b74ef9b82f7049f1fc7d9fc8f29706025bd271d1ee1822b15d654a84e1a0997b973a46f923cc9977b3fcbb064179ecd';


DateTime now = DateTime.now();
String fechaActual = DateFormat('yyyy-MM-dd').format(now);
String yearNow = DateFormat('yyyy').format(now);