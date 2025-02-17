import 'package:fipe_agora/src/core/injector.dart';
import 'package:fipe_agora/src/presentation/controller/fipe_controller.dart';
import 'package:fipe_agora/src/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

void main() async {
  await setupInjector();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FipeController>(
          create: (_) => getIt<FipeController>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            fontFamily: 'Rubik',
            extensions: const [
              SkeletonizerConfigData(),
            ]),
        home: const HomePage(),
      ),
    );
  }
}
