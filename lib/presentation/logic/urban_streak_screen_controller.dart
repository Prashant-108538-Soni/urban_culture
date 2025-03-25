import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UrbanStreakScreenController extends ChangeNotifier{


  UrbanStreakScreenController(){
    init();
  }

  Future<void> init() async{
    await loadStreak();
  }


  final Map<String, List<FlSpot>> dummyData = {
    '1D': [
      FlSpot(0, 1),
      FlSpot(1, 2),
      FlSpot(2, 1),
      FlSpot(3, 2),
      FlSpot(4, 1.5),
    ],
    '1W': [
      FlSpot(0, 1),
      FlSpot(1, 2),
      FlSpot(2, 3),
      FlSpot(3, 4),
      FlSpot(4, 3.5),
      FlSpot(5, 4.2),
      FlSpot(6, 5),
    ],
    '1M': [
      FlSpot(0, 1),
      FlSpot(1, 3),
      FlSpot(2, 2),
      FlSpot(3, 5),
      FlSpot(4, 4),
      FlSpot(5, 6),
      FlSpot(6, 5.5),
      FlSpot(7, 7),
      FlSpot(8, 6),
      FlSpot(9, 7.5),
      FlSpot(10, 8),
    ],
    '3M': [
      FlSpot(0, 1),
      FlSpot(1, 2),
      FlSpot(2, 2),
      FlSpot(3, 3),
      FlSpot(4, 3),
      FlSpot(5, 4.5),
      FlSpot(6, 6),
      FlSpot(7, 5.5),
      FlSpot(8, 7),
      FlSpot(9, 6.5),
      FlSpot(10, 8),
      FlSpot(11, 7.5),
      FlSpot(12, 9),
    ],
    '1Y': [
      FlSpot(0, 1),
      FlSpot(1, 3),
      FlSpot(2, 2),
      FlSpot(3, 5),
      FlSpot(4, 4),
      FlSpot(5, 6),
      FlSpot(6, 7),
      FlSpot(7, 6.5),
      FlSpot(8, 8),
      FlSpot(9, 9),
      FlSpot(10, 8.5),
      FlSpot(11, 10),
      FlSpot(12, 9.5),
      FlSpot(13, 11),
      FlSpot(14, 10.5),
    ],
  };
  String selectedFilter = '1D';

  void setSelectedFilter({required String filter})
  {
    selectedFilter = filter;
    _streakDays = dummyData[filter] == null ? 0 : dummyData[filter]!.length;
    notifyListeners();
  }

  int _streakDays = 0;
  int get streakDays => _streakDays;
  Future<void> loadStreak() async {
    final prefs = await SharedPreferences.getInstance();
    _streakDays = prefs.getInt('streakDays') ?? 0;
    notifyListeners();
  }
}