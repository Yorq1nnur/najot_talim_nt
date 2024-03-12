import 'package:flutter/material.dart';

class ButtonModels {
  final String title;
  final Color color;

  ButtonModels({
    required this.title,
    required this.color,
  });
}


final List<ButtonModels> buttonModels = [
  ButtonModels(title: "Widgets", color: Colors.red,),
  ButtonModels(title: "Circular", color: Colors.yellow,),
  ButtonModels(title: "Square", color: Colors.green,),
  ButtonModels(title: "Size", color: Colors.brown,),
  ButtonModels(title: "Loading", color: Colors.black,),
  ButtonModels(title: "Colors circle", color: Colors.orange,),
  ButtonModels(title: "Animated Padding + Opacity", color: Colors.blue,),
  ButtonModels(title: "Animation Demo", color: Colors.pink,),
  ButtonModels(title: "DecoratedBoxTransition Examole", color: Colors.teal,),
  ButtonModels(title: "Opacity Demo", color: Colors.indigo,),
  ButtonModels(title: "DecoratedBoxTransition Example", color: Colors.purpleAccent,),
  ButtonModels(title: "Woolha.com Flutter Tutorial", color: Colors.amber,),
  ButtonModels(title: "Kindacode.com", color: Colors.deepOrange,),
  ButtonModels(title: "Flutter - tutorialkart.com", color: Colors.indigoAccent,),
];