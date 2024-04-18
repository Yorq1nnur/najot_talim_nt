import 'dart:math';
import 'package:flutter/material.dart';
import 'package:najot_talim_nt/ui/screen/game/game_screen_presenter.dart';
import 'package:najot_talim_nt/ui/screen/game/section/board.dart';
import 'package:najot_talim_nt/ui/screen/game/section/play_stop_button.dart';
import 'package:najot_talim_nt/ui/screen/game/section/stopwatch.dart';
import 'package:najot_talim_nt/utils/lib/provider/provider_ext.dart';
import '../theme_provider.dart';
// import 'package:slide_puzzle/config/app_themes.dart';

class GameScreen extends StatefulWidget {
  static const kMaxBoardSize = 400.0;
  static const kBoardMargin = 16.0;
  static const kBoardPadding = 4.0;

  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    final presenter = GameScreenPresenter.of(context);

    final screenSize = MediaQuery.of(context).size;
    final screenWidth =
        MediaQuery.of(context).orientation == Orientation.portrait
            ? screenSize.width
            : screenSize.height;
    final screenHeight =
        MediaQuery.of(context).orientation == Orientation.portrait
            ? screenSize.height
            : screenSize.width;

    final isTallScreen = screenHeight > 800 || screenHeight / screenWidth > 1.9;
    final isLargeScreen = screenWidth > 400;

    final fabWidget = _buildFab(context);
    final boardWidget = _buildBoard(context);
    return OrientationBuilder(builder: (context, orientation) {
      final statusWidget = Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GameStopwatchWidget(
            time: presenter.time,
            fontSize: orientation == Orientation.landscape && !isLargeScreen
                ? 50.0
                : 65.0,
          ),
          Text(
            '${presenter.steps ?? -1} steps',
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      );

      if (orientation == Orientation.portrait) {
        //
        // Portrait layout
        //
        return Scaffold(
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                isTallScreen
                    ? SizedBox(
                        height: 50,
                        child: Center(
                            child: Text(
                          'Sliding Puzzle',
                          style: Theme.of(context).textTheme.labelLarge,
                        )),
                      )
                    : const SizedBox(height: 0),
                const SizedBox(height: 16.0),
                Center(child: statusWidget),
                const SizedBox(height: 16.0),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: boardWidget,
                  ),
                ),
                isLargeScreen && isTallScreen
                    ? const SizedBox(height: 116)
                    : const SizedBox(height: 72),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: fabWidget,
        );
      } else {
        //
        // Landscape layout
        //
        return Scaffold(
          body: SafeArea(
            child: Row(
              children: <Widget>[
                Expanded(flex: 3, child: boardWidget),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      statusWidget,
                      const SizedBox(height: 48.0),
                      fabWidget,
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    });
  }

  Widget _buildBoard(final BuildContext context) {
    final presenter = GameScreenPresenter.of(context);
    final background = Theme.of(context).brightness == Brightness.dark
        ? Colors.black54
        : Colors.black12;

    const borderRadius = 14.0;

    return Center(
      child: Container(
        margin: const EdgeInsets.all(GameScreen.kBoardMargin),
        padding: const EdgeInsets.all(GameScreen.kBoardPadding),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final puzzleSize = min(
              min(constraints.maxWidth, constraints.maxHeight),
              GameScreen.kMaxBoardSize -
                  (GameScreen.kBoardMargin + GameScreen.kBoardPadding) * 2,
            );

            return BoardWidget(
              isSpeedRunModeEnabled: false,
              board: presenter.board,
              size: puzzleSize,
              onTap: (point) {
                presenter.tap(point: point);
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildFab(final BuildContext context) {
    final presenter = GameScreenPresenter.of(context);
    final themeProvider = context.provider<ThemeProvider>();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          width: 48,
          height: 48,
          child: Material(
            elevation: 0.0,
            color: Colors.transparent,
            shape: const CircleBorder(),
            child: InkWell(
              onTap: () {
                presenter.reset();
              },
              customBorder: const CircleBorder(),
              child: const Icon(
                Icons.refresh,
                semanticLabel: "Reset",
              ),
            ),
          ),
        ),
        const SizedBox(width: 16.0),
        PlayStopButton(
          isPlaying: presenter.isPlaying(),
          onTap: () => presenter.playStop(),
        ),
        const SizedBox(width: 16.0),
        SizedBox(
          width: 48,
          height: 48,
          child: Material(
            elevation: 0.0,
            color: Colors.transparent,
            shape: const CircleBorder(),
            child: InkWell(
              onTap: () {
                // Show the modal bottom sheet on
                // tap on "More" icon.
                showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return _bottomSheet(presenter, themeProvider);
                  },
                );
              },
              customBorder: const CircleBorder(),
              child: const Icon(
                Icons.more_vert,
                semanticLabel: "Settings",
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _bottomSheet(
      GameScreenPresenterState presenter, ThemeProvider themeProvider) {
    return Container(
      height: 150,
      color: Colors.black,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "SELECT PUZZLE SIZE:",
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    presenter.resize(3);
                  },
                  child: const Text('3x3'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    presenter.resize(4);
                  },
                  child: const Text('4x4'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    presenter.resize(5);
                  },
                  child: const Text('5x5'),
                ),
              ],
            ),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     if (themeProvider.useDarkTheme) {
          //       themeProvider.switchTheme(AppThemeOptions.light);
          //     } else {
          //       themeProvider.switchTheme(AppThemeOptions.dark);
          //     }
          //   },
          //   child: const Text('Switch Theme'),
          // )
        ],
      ),
    );
  }
}
