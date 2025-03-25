import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:urban_culture/core/util/widget/snackbar.dart';
import 'package:urban_culture/data/repo/skin_care_step.dart';

class UrbanRoutineScreenController extends ChangeNotifier {
  UrbanRoutineScreenController() {
    init();
  }

  Future<void> init() async {
    await loadStreak();
  }

  int _streakDays = 0;
  int get streakDays => _streakDays;

  List<SkinCareStep> routine = [
    SkinCareStep(name: 'Cleanser', description: 'Cetaphil Gentle Skin Cleanser', time: '8:00 PM'),
    SkinCareStep(name: 'Toner', description: 'Thayers Witch Hazel Toner', time: '8:02 PM'),
    SkinCareStep(name: 'Moisturizer', description: 'Kiehl\'s Ultra Facial Cream', time: '8:04 PM'),
    SkinCareStep(name: 'Sunscreen', description: 'Supergoop Unseen Sunscreen SPF 40', time: '8:06 PM'),
    SkinCareStep(name: 'Lip Balm', description: 'Glossier Birthday Balm Dotcom', time: '8:08 PM'),
  ];

  void toggleStepCompletion(int index) {
    routine[index].isCompleted = !routine[index].isCompleted;
    notifyListeners();
  }

  Future<void> loadStreak() async {
    final prefs = await SharedPreferences.getInstance();
    _streakDays = prefs.getInt('streakDays') ?? 0;
    notifyListeners();
  }

  void updateStreak({required BuildContext context}) async {
    if (routine.every((step) => step.isCompleted)) {
      _streakDays++;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('streakDays', _streakDays);
      CommonSnackbarWidget.show(context: context, message: "Streak Saved", isPositiveToast: true);
      clearCheckBoxes();
      notifyListeners();
    } else {
      CommonSnackbarWidget.show(context: context, message: "Please check all skincare", isPositiveToast: false);
    }
  }

  void clearCheckBoxes() {
    for (int i = 0; i < routine.length; i++) {
      routine[i].isCompleted = false;
    }
    notifyListeners();
  }
}
