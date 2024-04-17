import 'package:najot_talim_nt/models/quiz_model.dart';

class SubjectModel {
  final List<QuizModel> questions;

  SubjectModel({
    required this.questions,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      questions: (json['questions'] as List?)
              ?.map((e) => QuizModel.fromJson(e))
              .toList() ??
          [],
    );
  }
}
