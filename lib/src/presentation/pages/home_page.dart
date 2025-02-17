import 'package:fipe_agora/src/core/typography.dart';
import 'package:fipe_agora/src/presentation/controller/fipe_controller.dart';
import 'package:fipe_agora/src/presentation/pages/widgets/clear_button.dart';
import 'package:fipe_agora/src/presentation/pages/widgets/dropdown_itens.dart';
import 'package:fipe_agora/src/presentation/pages/widgets/result_info_widget.dart';
import 'package:fipe_agora/src/presentation/pages/widgets/vehicle_buttons.dart';
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
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('TABELA FIPE', style: CustomTypography.bold),
        leading: Image.asset('assets/images/fipe_icon.png'),
      ),
      body: SingleChildScrollView(
        reverse: true,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8.0),
              Text('Tipo de Veículo', style: CustomTypography.bold),
              const VehicleButtons(),
              const SizedBox(height: 24.0),
              const DropDownItens(),
              const SizedBox(height: 24.0),
              Consumer<FipeController>(
                builder: (context, controller, _) {
                  return Column(
                    children: [
                      if (!controller.fipeTable.isEmpty) ...[
                        const ResultInfoWidget(),
                        const ClearButton(),
                      ],
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
