import 'package:flutter/material.dart';
import 'package:najot_talim_nt/screens/animated_padding_screen/animated_padding_screen.dart';
import 'package:najot_talim_nt/screens/animation_demo_screen/animation_demo_screen.dart';
import 'package:najot_talim_nt/screens/circular_screen/circular_screen.dart';
import 'package:najot_talim_nt/screens/colors_circle_screen/colors_circle_screen.dart';
import 'package:najot_talim_nt/screens/decorated_box_transition_screen/decorated_box_transition_screen.dart';
import 'package:najot_talim_nt/screens/flutter_tutorial_kart_screen/flutter_tutorial_kart_screen.dart';
import 'package:najot_talim_nt/screens/kindacode_screen/kindacode_screen.dart';
import 'package:najot_talim_nt/screens/loading_screen/loading_screen.dart';
import 'package:najot_talim_nt/screens/opacity_demo_screen/opacity_demo_screen.dart';
import 'package:najot_talim_nt/screens/size_screen/size_screen.dart';
import 'package:najot_talim_nt/screens/square_screen/square_screen.dart';
import 'package:najot_talim_nt/screens/widgets_screen/widgets_screen.dart';
import 'package:najot_talim_nt/screens/woolha_screen/woolha_screen.dart';

class ButtonModels {
  final String title;
  final Color color;
  final Widget screen;

  ButtonModels({
    required this.title,
    required this.color,
    required this.screen,
  });
}

final List<ButtonModels> buttonModels = [
  ButtonModels(
    title: "Widgets",
    color: Colors.red,
    screen: const WidgetsScreen(
      title: 'Widgets',
    ),
  ),
  ButtonModels(
    title: "Circular",
    color: Colors.yellow,
    screen: const CircularScreen(
      title: 'Circular',
    ),
  ),
  ButtonModels(
    title: "Square",
    color: Colors.green,
    screen: const SquareScreen(
      title: 'Square',
    ),
  ),
  ButtonModels(
    title: "Size",
    color: Colors.brown,
    screen: const SizeScreen(
      title: 'Size',
    ),
  ),
  ButtonModels(
    title: "Loading",
    color: Colors.indigoAccent,
    screen: const LoadingScreen(
      title: 'Loading',
    ),
  ),
  ButtonModels(
    title: "Colors circle",
    color: Colors.orange,
    screen: const ColorsCircleScreen(
      title: 'Colors circle',
    ),
  ),
  ButtonModels(
    title: "Animated Padding + Opacity",
    color: Colors.blue,
    screen: const AnimatedPaddingScreen(
      title: 'Animated Padding + Opacity',
    ),
  ),
  ButtonModels(
    title: "Animation Demo",
    color: Colors.pink,
    screen: const AnimatedDemoScreen(
      title: 'Animation Demo',
    ),
  ),
  ButtonModels(
    title: "DecoratedBoxTransition Example",
    color: Colors.teal,
    screen: const DecoratedBoxTransitionScreen(
      title: 'DecoratedBoxTransition Example',
    ),
  ),
  ButtonModels(
    title: "Opacity Demo",
    color: Colors.indigo,
    screen: const OpacityDemoScreen(
      title: 'Opacity Demo',
    ),
  ),
  ButtonModels(
    title: "Woolha.com Flutter Tutorial",
    color: Colors.amber,
    screen: const WoolhaScreen(
      title: 'Woolha.com Flutter Tutorial',
    ),
  ),
  ButtonModels(
    title: "Kindacode.com",
    color: Colors.deepOrange,
    screen: const KindacodeScreen(
      title: 'Kindacode.com',
    ),
  ),
  ButtonModels(
    title: "Flutter - tutorialkart.com",
    color: Colors.indigoAccent,
    screen: const FlutterTutorialKartScreen(
      title: 'Flutter - tutorialkart.com',
    ),
  ),
];
