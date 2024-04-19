import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/bloc/game_bloc.dart';
import 'package:najot_talim_nt/bloc/game_event.dart';
import 'package:najot_talim_nt/bloc/game_state.dart';
import 'package:najot_talim_nt/screens/game/widgets/letter_items.dart';
import 'package:najot_talim_nt/screens/widgets/background_contaioner.dart';
import 'package:najot_talim_nt/screens/widgets/image_items.dart';
import 'package:najot_talim_nt/screens/widgets/status_bar.dart';
import 'package:najot_talim_nt/utils/app_images.dart';
import 'package:najot_talim_nt/utils/size_utils.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen>
    with SingleTickerProviderStateMixin {
  late Animation<Alignment> animationAlign;

  @override
  void initState() {
    globalAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );
    animate();

    globalAnimationController.addListener(() {
      setState(() {});
    });
    context.read<WordGameBloc>();
    super.initState();
  }

  void animate() {
    animationAlign = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(
        tween: Tween(
          begin: Alignment.center,
          end: Alignment.centerLeft,
        ),
        weight: 50,
      ),
      TweenSequenceItem<Alignment>(
        tween: Tween(
          begin: Alignment.centerLeft,
          end: Alignment.center,
        ),
        weight: 50,
      ),
      TweenSequenceItem<Alignment>(
        tween: Tween(
          begin: Alignment.centerRight,
          end: Alignment.center,
        ),
        weight: 50,
      ),
    ]).animate(
      CurvedAnimation(
        parent: globalAnimationController,
        curve: Curves.decelerate,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: StatusBarItems.systemUiOverlayStyle(),
      child: Scaffold(
        body: BlocBuilder<WordGameBloc, WordGameState>(
          builder: (context, state) {
            return BackGroundContainer(
              widget: Stack(
                children: [
                  Image.asset(
                    AppImages.nature,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      100.getH(),
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          ...List.generate(
                            state.allQuestions[state.currentQuestionIndex]
                                .images.length,
                            (index) {
                              return ImageItems(
                                image: state
                                    .allQuestions[state.currentQuestionIndex]
                                    .images[index],
                              );
                            },
                          ),
                        ],
                      ),
                      20.getH(),
                      Align(
                        alignment: animationAlign.value,
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            ...List.generate(
                              state.allQuestions[state.currentQuestionIndex]
                                  .trueAnswer.length,
                              (index) {
                                return InkWell(
                                  onTap: () {
                                    context.read<WordGameBloc>().add(
                                          RemoveWordEvent(
                                            state.enteredAnswer[index],
                                          ),
                                        );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      right: 10.wi,
                                      bottom: 10.he,
                                    ),
                                    width: 50,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: index < state.enteredAnswer.length
                                          ? Colors.orange
                                          : Colors.grey.shade400,
                                      borderRadius: BorderRadius.circular(
                                        15.r,
                                      ),
                                      border: Border.all(
                                        width: 5.wi,
                                        color: state.isStartAnimation
                                            ? Colors.red
                                            : Colors.white,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        index < state.enteredAnswer.length
                                            ? state.enteredAnswer[index]
                                            : "",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: EdgeInsets.only(
                          top: 20.he,
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            tileMode: TileMode.repeated,
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.amberAccent,
                              Colors.yellowAccent,
                              Colors.yellow,
                              Colors.amber,
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.amberAccent,
                              blurRadius:
                                  MediaQuery.sizeOf(context).height / 3.r,
                            )
                          ],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              15.r,
                            ),
                            topRight: Radius.circular(
                              15.r,
                            ),
                          ),
                        ),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: List.generate(
                            state.letterList.length,
                            (index) {
                              return alphabetButton(
                                title: state.letterList[index],
                                onPressed: () {
                                  context.read<WordGameBloc>().add(
                                        CollectedEnteredLetterEvent(
                                          state.letterList[index],
                                          context,
                                        ),
                                      );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

late AnimationController globalAnimationController;
bool isStartAnimation = false;
