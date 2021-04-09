import 'package:flutter/material.dart';

class Quiz with ChangeNotifier {
  final String quizId;
  final String quizImgUrl;
  final String quizTitle;
  final String quizDesc;
  final bool isLoading;
  final Stream quizStream;
  final int total;
  final int correct;
  final int incorrect;
  final int notattempted;
  final Function toogleView;

  Quiz({
    this.quizId,
    this.quizImgUrl,
    this.quizTitle,
    this.quizDesc,
    this.isLoading,
    this.quizStream,
    this.total,
    this.correct,
    this.incorrect,
    this.notattempted,
    this.toogleView,
  });
}
