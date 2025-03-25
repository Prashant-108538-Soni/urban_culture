import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urban_culture/core/util/color_constant/urban_color.dart';
import 'package:urban_culture/core/util/string_constant/constant.dart';
import 'package:urban_culture/presentation/logic/urban_routine_screen_controller.dart';

class UrbanRoutineScreen extends StatelessWidget {
  const UrbanRoutineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UrbanRoutineScreenController>(
      create: (_) {
        return UrbanRoutineScreenController();
      },
      builder: (context, snapshot) {
        return Consumer<UrbanRoutineScreenController>(builder: (context, urbanRoutineScreenController, _) {
          return Scaffold(
            appBar: AppBar(
                centerTitle: true,
                title: const Text(
                  Constants.dailySkincare, // Use constant
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                )),
            body: ListView.builder(
              itemCount: urbanRoutineScreenController.routine.length,
              itemBuilder: (context, index) {
                final step = urbanRoutineScreenController.routine[index];
                return ListTile(
                  leading: GestureDetector(
                    onTap: () {
                      urbanRoutineScreenController.toggleStepCompletion(index);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6.0), // Add padding inside the checkbox
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(4.0),
                        color: UrbanColor.lightPink, // Background color when checked
                      ),
                      child: Icon(
                        step.isCompleted ? Icons.check : null,
                        color: Colors.black87, // Color of the check sign
                        size: 24.0, // Adjust the size of the check icon
                      ),
                    ),
                  ),
                  title: Text(
                    step.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black87,
                    ),
                  ),
                  subtitle: Text(
                    step.description,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      color: UrbanColor.darkBrown,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min, // Ensure the Row takes only as much space as its children
                    children: [
                      const Icon(
                        Icons.camera_alt_outlined,
                        size: 20,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 8), // Add space between icon and text
                      Flexible(
                        child: Text(
                          step.time,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: UrbanColor.darkBrown,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(bottom: 80), // Adjust padding as needed
              child: FloatingActionButton.extended(
                onPressed: () => urbanRoutineScreenController.updateStreak(context: context),
                label: const Text(
                  Constants.saveStreak, // Use constant
                  style: TextStyle(color: UrbanColor.darkBrown),
                ), // Label for the extended button
                icon: const Icon(
                  Icons.check,
                  color: UrbanColor.darkBrown,
                ),
                backgroundColor: UrbanColor.lightPink,
              ),
            ),
          );
        });
      },
    );
  }
}
