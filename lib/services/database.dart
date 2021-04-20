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
}
