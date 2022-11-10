import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {
  static void showSnackBar(BuildContext context, String message) =>
      ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );

  static DateTime toDateTime(Timestamp value) {
    if (value == null) return null;

    return value.toDate();
  }

  static dynamic fromDateTimeToJson(DateTime date) {
    if (date == null) return null;

    return date.toUtc();
  }

  static StreamTransformer transformer<T>(
          T Function(Map<String, dynamic> json) fromJson) =>
      StreamTransformer<QuerySnapshot, List<T>>.fromHandlers(
        handleData: (QuerySnapshot data, EventSink<List<T>> sink) {
          final snaps = data.docs.map((doc) => doc.data()).toList();
          final objects = snaps.map((json) => fromJson(json)).toList();

          sink.add(objects);
        },
      );
}
class Palette { 
  static const MaterialColor kToDark = MaterialColor( 
    0xff001a27, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch. 
     <int, Color>{ 
      50: const Color(0xff8099a7),//10% 
      100: const Color(0xff4d7083),//20% 
      200: const Color(0xffa1a4760),//30% 
      300: const Color(0xff1a4760),//40% 
      400: const Color(0xff002437),//50% 
      500: const Color(0xff00141f),//60% 
      600: const Color(0xff000f17),//70% 
      700: const Color(0xff000a10),//80% 
      800: const Color(0xff000508),//90% 
      900: const Color(0xff000000),//100% 
    }, 
  ); 
}