import 'package:flutter/material.dart';

class ResultInfoWidget extends StatelessWidget {
  const ResultInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ResultInfoListTile(
          text: 'Marca',
          suffixText: 'suffixText',
        ),
        ResultInfoListTile(
          text: 'Modelo',
          suffixText: 'suffixText',
        ),
        ResultInfoListTile(
          text: 'Modelo',
          suffixText: 'suffixText',
        ),
        ResultInfoListTile(
          text: 'Mês de Referência',
          suffixText: 'suffixText',
        ),
        ResultInfoListTile(
          text: 'Mês de Referência',
          suffixText: 'suffixText',
        ),
        ResultInfoListTile(
          text: 'Combustível',
          suffixText: 'suffixText',
        ),
        ResultInfoListTile(
          text: r'Valor em $',
          suffixText: 'suffixText',
        ),
      ],
    );
  }
}

class ResultInfoListTile extends StatelessWidget {
  final String text;
  final String suffixText;

  const ResultInfoListTile(
      {super.key, required this.text, required this.suffixText});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text),
            Text(suffixText),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
