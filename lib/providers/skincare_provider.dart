// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../models/skincare_step.dart';
//
// class SkincareProvider with ChangeNotifier {
//
//
//   int _streakDays = 0;
//
//   List<SkincareStep> get routine => _routine;
//   int get streakDays => _streakDays;
//
//   void toggleStepCompletion(int index) {
//     _routine[index].isCompleted = !_routine[index].isCompleted;
//     notifyListeners();
//   }
//
//   void updateStreak() async {
//     if (_routine.every((step) => step.isCompleted)) {
//       _streakDays++;
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.setInt('streakDays', _streakDays);
//       notifyListeners();
//     }
//   }
//
//   Future<void> loadStreak() async {
//     final prefs = await SharedPreferences.getInstance();
//     _streakDays = prefs.getInt('streakDays') ?? 0;
//     notifyListeners();
//   }
// }
