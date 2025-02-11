import 'package:fipe_agora/src/presentation/controller/fipe_controller.dart';
import 'package:fipe_agora/src/presentation/pages/widgets/dropdown_itens.dart';
import 'package:fipe_agora/src/presentation/pages/widgets/result_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FipeController>().getReferenceTable();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'FIPE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Consumer<FipeController>(builder: (context, controller, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tipo de Veículo',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: List.generate(
                    controller.categories.length,
                    (index) {
                      final category = controller.categories[index];
                      final isSelected =
                          controller.selectedCategory == category;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ChoiceChip(
                          label: Text(
                            category.name,
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.blue.shade900
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          selected: isSelected,
                          onSelected: (value) =>
                              controller.selectCategory(category),
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
                ),
                const DropDownItens(),
                const SizedBox(height: 24.0),
                if (!controller.fipeTable.isEmpty) ...[
                  const ResultInfoWidget(),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 24),
                    child: Center(
                      child: SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          style: ButtonStyle(
                              shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                color: Colors.grey.shade800,
                              ),
                            ),
                          )),
                          onPressed: () => controller.reset(),
                          child: const Text('Limpar dados'),
                        ),
                      ),
                    ),
                  ),
                ]
              ],
            );
          }),
        ),
      ),
    );
  }
}
