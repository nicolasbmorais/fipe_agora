import 'package:fipe_agora/src/core/typography.dart';
import 'package:fipe_agora/src/presentation/controller/fipe_controller.dart';
import 'package:fipe_agora/src/presentation/pages/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';

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
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tipo de Veículo', style: CustomTypography.bold),
                    const VehicleButtons(),
                    const SizedBox(height: 24.0),
                    const DropDownItens(),
                    const SizedBox(height: 24.0),
                  ],
                ),
              ),
              Consumer<FipeController>(
                builder: (context, controller, _) {
                  return Column(
                    children: [
                      if (!controller.fipeTable.isEmpty) ...[
                        Screenshot(
                          controller: controller.screenshotController,
                          child: Container(
                            color: Colors.white,
                            child: ResultInfoWidget(
                              controller: controller,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            spacing: 8,
                            children: [
                              FipeButton(
                                text: 'Compartilhar',
                                onPressed: () async =>
                                    await controller.captureAndShare(),
                              ),
                              FipeButton(
                                text: 'Limpar dados',
                                onPressed: () => controller.reset(),
                              ),
                            ],
                          ),
                        ),
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
