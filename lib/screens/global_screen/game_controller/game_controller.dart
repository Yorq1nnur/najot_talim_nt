import 'package:get/get.dart';
import 'package:najot_talim_nt/models/question_model.dart';

class GameController extends GetxController {
  final index = 0.obs;
  final currentInputAnswer = "".obs;
  final forUiErrorMessage = "".obs;
  late List<String> shuffledLetters;

  @override
  void onInit() {
    super.onInit();
    randomAnswers();
  }

  void randomAnswers() {
    shuffledLetters = currentAnswer.split('')..shuffle();
    currentInputAnswer.value = "";
    forUiErrorMessage.value = "";
  }

  String get currentQuestion => questionsList[index.value].question;

  String get currentAnswer => questionsList[index.value].answer;

  void checkGiveAnswer() {
    if (currentInputAnswer.value == currentAnswer) {
      forUiErrorMessage.value = "TRUE ANSWER!";
      nextQuestion();
    } else if (currentInputAnswer.value.length == currentAnswer.length) {
      forUiErrorMessage.value = "FALSE ANSWER!";
    }
  }

  void addQuiz(String letter) {
    if (currentInputAnswer.value.length < currentAnswer.length) {
      currentInputAnswer.value += letter;
      checkGiveAnswer();
    }
  }

  void nextQuestion() {
    if (index.value < questionsList.length - 1) {
      index.value++;
      randomAnswers();
    } else {
      index.value = 0;
      randomAnswers();
    }
  }

  void removeLastQuestion() {
    if (currentInputAnswer.value.isNotEmpty) {
      currentInputAnswer.value = currentInputAnswer.value.substring(
        0,
        currentInputAnswer.value.length - 1,
      );
      forUiErrorMessage.value = "";
    }
  }
}

final questionsList = <QuestionModel>[
  QuestionModel(
    question: "WHAT PROGRAMMING LANGUAGE DOES FLUTTER USE?",
    answer: "DART",
  ),
  QuestionModel(
    question: "WHEN WAS FLUTTER CREATED?",
    answer: "2017",
  ),
  QuestionModel(
    question: "FLUTTER WAS CREATED BY WHOM?",
    answer: "GOOGLE",
  ),
  QuestionModel(
    question: "WHERE IS THE CAPITAL OF UZBEKISTAN?",
    answer: "TASHKENT",
  ),
  QuestionModel(
    question: "WHEN DID UZBEKISTAN GAIN INDEPENDENCE?",
    answer: "1991",
  ),
  QuestionModel(
    question: "WHEN WAS GOOGLE CREATED?",
    answer: "1998",
  ),
  QuestionModel(
    question: "WHERE IS THE CAPITAL OF RUSSIA?",
    answer: "MOSCOW",
  ),
  QuestionModel(
    question: "TYPE OF STATE MANAGEMENT IN FLUTTER?",
    answer: "PROVIDER",
  ),
  QuestionModel(
    question: "WHAT COUNTRY IS UZBEKISTAN?",
    answer: "DEMOCRATIC",
  ),
  QuestionModel(
    question: "WHERE IS THE CAPITAL OF KAZAKHSTAN?",
    answer: "ASTANA",
  ),
].obs;
