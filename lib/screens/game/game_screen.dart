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

    animationAlign = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(
          tween: Tween(
            begin: Alignment.center,
            end: Alignment.centerLeft,
          ),
          weight: 40),
      TweenSequenceItem<Alignment>(
          tween: Tween(
            begin: Alignment.centerLeft,
            end: Alignment.center,
          ),
          weight: 40),
      TweenSequenceItem<Alignment>(
          tween: Tween(
            begin: Alignment.centerRight,
            end: Alignment.center,
          ),
          weight: 40),
    ]).animate(
      CurvedAnimation(
        parent: globalAnimationController,
        curve: Curves.decelerate,
      ),
    );

    globalAnimationController.addListener(() {
      setState(() {});
    });
    context.read<GameBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: StatusBarItems.systemUiOverlayStyle(),
      child: Scaffold(
        body: BlocBuilder<GameBloc, GameState>(
          builder: (context, state) {
            return BackGroundContainer(
              widget: Stack(
                children: [
                  Image.asset(
                    AppImages.nature,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        70.getH(),
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
                                      context.read<GameBloc>().add(
                                            RemoveEvent(
                                              state.enteredAnswer[index],
                                            ),
                                          );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          right: 10.wi, bottom: 10.he),
                                      width: 50,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: index < state.enteredAnswer.length
                                            ? Colors.orange
                                            : Colors.grey.shade400,
                                        borderRadius: BorderRadius.circular(15),
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
                          padding: EdgeInsets.only(top: 20.he),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.r),
                              topRight: Radius.circular(15.r),
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
                                    context.read<GameBloc>().add(
                                          CollectEnteredLetterEvent(
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
