import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najot_talim_nt/bloc/game_event.dart';
import 'package:najot_talim_nt/bloc/game_state.dart';
import 'package:najot_talim_nt/data/models/game_models.dart';
import 'package:najot_talim_nt/screens/game/game_screen.dart';
import 'package:najot_talim_nt/screens/lottie/lottie_screen.dart';

class WordGameBloc extends Bloc<WordGameEvent, WordGameState> {
  WordGameBloc()
      : super(
          WordGameState(
            currentQuestionIndex: 0,
            allQuestions: questions,
            trueCount: 0,
            enteredAnswer: "",
            letterList: const [],
            isStartAnimation: false,
          ),
        ) {
    on<LoadWordQuestionsEvent>(onInit);
    on<NextQuestionEvent>(onNext);
    on<CollectedEnteredLetterEvent>(onCollect);
    on<RemoveWordEvent>(onRemove);
  }

  onInit(LoadWordQuestionsEvent event, emit) {
    String answerText = questions[state.currentQuestionIndex].trueAnswer;

    emit(
      state.copyWith(
        allQuestions: questions,
        letterList: getOptionLetters(answerText),
      ),
    );
  }

  onRemove(RemoveWordEvent event, emit) {
    emit(
      state.copyWith(
        enteredAnswer: state.enteredAnswer.replaceAll(event.alphabet, ""),
      ),
    );
  }

  onNext(NextQuestionEvent event, emit) {
    if (state.currentQuestionIndex < questions.length - 1) {
      int newQuestionIndex = state.currentQuestionIndex + 1;
      getOptionLetters(
          state.allQuestions[state.currentQuestionIndex].trueAnswer);
      emit(state.copyWith(currentQuestionIndex: newQuestionIndex));
      emit(
        state.copyWith(
          enteredAnswer: "",
          letterList:
              getOptionLetters(state.allQuestions[newQuestionIndex].trueAnswer),
        ),
      );
    } else {
      Navigator.push(
        event.context,
        MaterialPageRoute(
          builder: (context) => const LottieScreen(),
        ),
      );
    }
  }

  onCollect(CollectedEnteredLetterEvent event, emit) async {
    String text = state.enteredAnswer;
    text += event.enteredLetter;
    emit(state.copyWith(enteredAnswer: text));
    if (state.enteredAnswer ==
        state.allQuestions[state.currentQuestionIndex].trueAnswer) {
      add(NextQuestionEvent(event.context));
    } else if (state.enteredAnswer.length ==
        state.allQuestions[state.currentQuestionIndex].trueAnswer.length) {
      if (isStartAnimation) {
        globalAnimationController.reverse();
        emit(
          state.copyWith(isStartAnimation: false),
        );
      } else {
        globalAnimationController.forward();
        emit(state.copyWith(isStartAnimation: true));
        await Future.delayed(const Duration(seconds: 1));
        emit(state.copyWith(isStartAnimation: false));
      }
      emit(
        state.copyWith(
          enteredAnswer: "",
        ),
      );
    }
  }
}

String alphabet = "qwertyuiopasdfghjklzxcvbnm";

List<String> getOptionLetters(String answerText) {
  int len = answerText.length;

  for (int i = 0; i < (12 - len); i++) {
    Random random = Random();
    int index = random.nextInt(26);
    answerText += alphabet[index];
  }
  List<String> letterList = answerText.split('');
  letterList.shuffle();
  return letterList;
}

List<GameModels> questions = [
  GameModels(
    trueAnswer: "book",
    images: [
      "https://readabilityformulas.com/wp-content/uploads/img-fry-sight-words01.png",
      "https://www.pngitem.com/pimgs/m/31-313555_research-paper-hd-png-download.png",
      "https://epica.com/cdn/shop/articles/Handwriting.png",
      "https://cdn2.psychologytoday.com/assets/styles/manual_crop_1_1_1200x1200/public/field_blog_entry_teaser_image/2021-07/handwriting_literacy_learning.png.jpg",
    ],
  ),
  GameModels(
    trueAnswer: "laptop",
    images: [
      "https://png.pngtree.com/png-vector/20190328/ourmid/pngtree-programmers-code-the-website-from-the-command-line-flat-vector-illustration-png-image_878368.jpg",
      "https://www.aalto.fi/sites/g/files/flghsv161/files/styles/1_6_567w_354h_n/public/2023-05/Microsoft365.png",
      "https://img.freepik.com/free-vector/console-gamepad-hitech-technology-live-gaming-service-video-gaming-controller-joystick-with-buttons-joypad-gamers-peripheral-input-device-vector-isolated-concept-metaphor-illustration_335657-4310.jpg",
      "https://png.pngtree.com/png-vector/20190803/ourmid/pngtree-calculator-calculation-math-progress-graph-flat-color-icon-v-png-image_1648951.jpg",
    ],
  ),
  GameModels(
    trueAnswer: "country",
    images: [
      "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Flag_of_Uzbekistan.png/1200px-Flag_of_Uzbekistan.png",
      "https://upload.wikimedia.org/wikipedia/commons/a/ad/Russia-flag.png",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Flag_of_the_United_States.png/800px-Flag_of_the_United_States.png",
      "https://upload.wikimedia.org/wikipedia/commons/6/62/Flag_of_France.png",
    ],
  ),
  GameModels(
    trueAnswer: "physics",
    images: [
      "https://cdn1.byjus.com/wp-content/uploads/2019/07/Rutherford.jpg",
      "https://ichef.bbci.co.uk/images/ic/480x270/p0bypq4v.png",
      "https://hips.hearstapps.com/hmg-prod/images/professor-stephen-hawking-british-theoretical-physicist-news-photo-1695324822.jpg",
      "https://cdn1.byjus.com/wp-content/uploads/2019/08/Moment-of-Inertia-Shapes-and-Formula.png",
    ],
  ),
];
