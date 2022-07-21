import 'package:flutter/material.dart';

double getScreenWidth(BuildContext context){
  return MediaQuery.of(context).size.width;
}

double getScreenHeight(BuildContext context){
  return MediaQuery.of(context).size.height;
}

double getAppBarHeight(BuildContext context){
  return getScreenWidth(context) * 0.14;
}

double getBottomBarHeight(BuildContext context){
  return getScreenWidth(context) * 0.15;
}