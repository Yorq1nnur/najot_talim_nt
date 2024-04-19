import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/screens/game/game_screen.dart';
import 'package:najot_talim_nt/screens/widgets/background_contaioner.dart';
import 'package:najot_talim_nt/screens/widgets/button_items.dart';
import 'package:najot_talim_nt/screens/widgets/image_items.dart';
import 'package:najot_talim_nt/screens/widgets/status_bar.dart';
import 'package:najot_talim_nt/utils/size_utils.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  final List<String> imageForItems = [
    "https://w7.pngwing.com/pngs/36/105/png-transparent-4-pics-1-word-4-letters-guessword-word-game-word-game-video-game-word.png",
    "https://assets.podomatic.net/ts/fa/b0/08/stevohays/600x600_16990841.png",
    "https://cdn6.aptoide.com/imgs/f/4/b/f4bcca06f6c763176a1a5f5064a914a1_icon.png",
    "https://img.favpng.com/12/9/23/word-game-4-pics-1-word-riddle-puzzle-png-favpng-NEDKt6W5BrffgqJA1MAGq0F5V.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: StatusBarItems.systemUiOverlayStyle(),
      child: Scaffold(
        body: BackGroundContainer(
          widget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "4 Pics 1 Word",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              20.getH(),
              Wrap(
                children: [
                  ...List.generate(
                    imageForItems.length,
                    (index) => ImageItems(
                      image: imageForItems[index],
                    ),
                  ),
                ],
              ),
              50.getH(),
              ButtonItems(
                title: "PLAY",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GameScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
