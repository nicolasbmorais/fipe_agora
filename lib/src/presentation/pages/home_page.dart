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
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tipo de Veículo',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Consumer<FipeController>(builder: (context, controller, _) {
                  return OutlinedButton(
                    onPressed: () {},
                    child: const Text('Carros -1'),
                  );
                }),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Motos - 2'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Camin-3'),
                ),
              ],
            ),
            const DropDownItens(),
            const SizedBox(height: 24.0),
            const ResultInfoWidget(),
          ],
        ),
      ),
    );
  }
}
