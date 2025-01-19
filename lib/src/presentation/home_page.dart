import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('FIPE'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Tipos de Veículo'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Carros -1'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Motos - 2'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Caminhao -1'),
                ),
              ],
            ),
            const DropDownMenuWidget(title: 'Marcas'),
            const SizedBox(height: 90),
            const DropDownMenuWidget(title: 'Modelo'),
            const SizedBox(height: 90),
            const DropDownMenuWidget(title: 'Ano'),
            const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('data'),
                    Text('data'),
                  ],
                ),
                Divider(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DropDownMenuWidget extends StatelessWidget {
  final String title;

  const DropDownMenuWidget({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        DropdownMenu(
          width: double.infinity,
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            constraints: BoxConstraints.tight(const Size.fromHeight(40)),
            fillColor: Colors.grey[350],
          ),
          dropdownMenuEntries: const [
            DropdownMenuEntry(value: 0, label: 'label'),
          ],
        ),
      ],
    );
  }
}
