import 'package:flutter/cupertino.dart';

class Global {
  static height(context) => MediaQuery.of(context).size.height;
  static width(context) => MediaQuery.of(context).size.width;
  static String apikey = "paste your key here";
}
