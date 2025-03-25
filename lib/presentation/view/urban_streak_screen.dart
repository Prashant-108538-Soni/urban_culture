import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:urban_culture/core/util/color_constant/urban_color.dart';
import 'package:urban_culture/core/util/string_constant/constant.dart';
import 'package:urban_culture/presentation/logic/urban_streak_screen_controller.dart';

class UrbanStreakScreen extends StatelessWidget {
  const UrbanStreakScreen({super.key}); // Default filter

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UrbanStreakScreenController>(
      create: (_) {
        return UrbanStreakScreenController();
      },
      builder: (context, snapshot) {
        return Consumer<UrbanStreakScreenController>(builder: (context, urbanStreakScreenController, _) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                Constants.streaks, // Use constant
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              iconTheme: const IconThemeData(color: Colors.black),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${Constants.todaysGoal} ${urbanStreakScreenController.streakDays} streak days', // Use constant
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      color: UrbanColor.lightPink,
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 200, top: 20, bottom: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              Constants.streakDays, // Use constant
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              urbanStreakScreenController.streakDays.toString(),
                              style: const TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      Constants.dailyStreak, // Use constant
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      urbanStreakScreenController.streakDays.toString(),
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        Text(
                          Constants.last30Days, // Use constant
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: UrbanColor.darkBrown,
                          ),
                        ),
                        Text(
                          Constants.percentageChange, // Use constant
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: UrbanColor.green,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 26),
                    AspectRatio(
                      aspectRatio: 2,
                      child: LineChart(
                        LineChartData(
                          titlesData: FlTitlesData(
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            rightTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                          ),
                          borderData: FlBorderData(show: false),
                          gridData: FlGridData(show: false),
                          lineBarsData: [
                            LineChartBarData(
                              spots: urbanStreakScreenController.dummyData[urbanStreakScreenController.selectedFilter]!, // Use selected filter data
                              isCurved: true,
                              color: UrbanColor.darkBrown,
                              barWidth: 4,
                              isStrokeCapRound: true,
                              belowBarData: BarAreaData(show: true, color: Colors.transparent),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Add filter buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: ['1D', '1W', '1M', '3M', '1Y'].map((filter) {
                        return GestureDetector(
                          onTap: () {
                            urbanStreakScreenController.setSelectedFilter(filter: filter);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                            child: Text(
                              filter,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: urbanStreakScreenController.selectedFilter == filter ? UrbanColor.darkBrown : Colors.grey,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      Constants.keepItUp, // Use constant
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: UrbanColor.lightPink,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Center(
                        child: Text(
                          Constants.getStarted, // Use constant
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
