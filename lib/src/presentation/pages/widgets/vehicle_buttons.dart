import 'package:fipe_agora/src/presentation/controller/fipe_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VehicleButtons extends StatelessWidget {
  const VehicleButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<FipeController>(builder: (context, controller, _) {
      return Row(
        children: List.generate(
          controller.categories.length,
          (index) {
            final category = controller.categories[index];
            final isSelected = controller.selectedCategory == category;
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ChoiceChip(
                label: Text(
                  category.name,
                  style: TextStyle(
                    color: isSelected ? Colors.blue.shade900 : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                selected: isSelected,
                onSelected: (value) => controller.selectCategory(category),
                selectedColor: Colors.blue.shade50,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(
                    color: isSelected
                        ? Colors.blue.shade900
                        : Colors.grey.shade400,
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
