import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseServices {
  Future<void> addQuizData(Map<String, String> quizData, String quizId) async {
    try {
      await FirebaseFirestore.instance
          .collection('Quiz')
          .doc(quizId)
          .set(quizData);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> addQuestionData(Map questionData, String quizId) async {
    try {
      await FirebaseFirestore.instance
          .collection('Quiz')
          .doc(quizId)
          .collection('QNA')
          .add(questionData);
    } catch (e) {
      print(e.toString());
    }
  }

  Stream getQuizData() {
    return FirebaseFirestore.instance.collection('Quiz').snapshots();
  }

  getQuestionsData(String quizId) async {
    return await FirebaseFirestore.instance
        .collection('Quiz')
        .doc(quizId)
        .collection('QNA')
        .get();
  }
}
