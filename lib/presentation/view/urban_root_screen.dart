import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urban_culture/core/util/color_constant/urban_color.dart';
import 'package:urban_culture/presentation/logic/urban_root_screen_controller.dart';
import 'package:urban_culture/presentation/view/urban_routine_screen.dart';
import 'package:urban_culture/presentation/view/urban_streak_screen.dart';

class UrbanRootScreen extends StatelessWidget {
  const UrbanRootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch screen dimensions for responsiveness
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider<UrbanRootScreenController>(
      create: (_) {
        return UrbanRootScreenController();
      },
      builder: (context, snapshot) {
        return Consumer<UrbanRootScreenController>(builder: (context, urbanRootScreenController, _) {
          return ValueListenableBuilder(
            valueListenable: urbanRootScreenController.selectedIndex,
            builder: (context, selectedIndex, _) {
              return Scaffold(
                extendBody: true,
                body: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: urbanRootScreenController.pageController,
                  onPageChanged: (index) {
                    urbanRootScreenController.selectedIndex.value = index;
                  },
                  children: const [
                    UrbanRoutineScreen(),
                    UrbanStreakScreen(),
                  ],
                ),
                bottomNavigationBar: Container(
                  height: 80,
                  color: UrbanColor.lightPink,
                  child: BottomNavigationBar(
                      showSelectedLabels: true,
                      showUnselectedLabels: true,
                      currentIndex: selectedIndex,
                      backgroundColor: UrbanColor.lightPink,
                      selectedItemColor: UrbanColor.darkBrown,
                      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                      type: BottomNavigationBarType.fixed,
                      onTap: (position) {
                        selectedIndex = position;
                        urbanRootScreenController.jumpToPage(position);
                      },
                      items: [
                        BottomNavigationBarItem(
                          label: "Routine",
                          icon: Image.asset(
                            'asset/nav_icons/search_icon.png',
                            color: selectedIndex == 0 ? UrbanColor.darkBrown : Colors.grey,
                          ),
                        ),
                        BottomNavigationBarItem(
                          label: "Streaks",
                          icon: Image.asset(
                            'asset/nav_icons/streak_icon.png',
                            color: selectedIndex == 1 ? UrbanColor.darkBrown : Colors.grey,
                          ),
                        ),
                      ]),
                ),
              );
            },
          );
        });
      },
    );
  }
}
