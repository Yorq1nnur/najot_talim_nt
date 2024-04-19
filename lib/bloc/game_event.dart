// ignore_for_file: must_be_immutable
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class WordGameEvent extends Equatable {
  const WordGameEvent();
}

class LoadWordQuestionsEvent extends WordGameEvent {
  @override
  List<Object?> get props => [];
}

class StartWordGameAnimationEvent extends WordGameEvent {
  const StartWordGameAnimationEvent(
    this.isStartAnimation,
  );

  final bool isStartAnimation;

  @override
  List<Object?> get props => [
        isStartAnimation,
      ];
}

class NextQuestionEvent extends WordGameEvent {
  NextQuestionEvent(
    this.context,
  );

  BuildContext context;

  @override
  List<Object?> get props => [
        context,
      ];
}

class CollectedEnteredLetterEvent extends WordGameEvent {
  CollectedEnteredLetterEvent(
    this.enteredLetter,
    this.context,
  );

  final String enteredLetter;
  BuildContext context;

  @override
  List<Object?> get props => [
        enteredLetter,
        context,
      ];
}

class RemoveWordEvent extends WordGameEvent {
  const RemoveWordEvent(
    this.alphabet,
  );

  final String alphabet;

  @override
  List<Object?> get props => [
        alphabet,
      ];
}
