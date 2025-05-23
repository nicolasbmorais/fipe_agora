import 'package:fipe_agora/src/core/typography.dart';
import 'package:fipe_agora/src/presentation/controller/fipe_controller.dart';
import 'package:flutter/material.dart';

class ResultInfoWidget extends StatelessWidget {
  final FipeController controller;

  const ResultInfoWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final fipeTable = controller.fipeTable;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _ResultInfoListTile(
            text: 'Marca',
            suffixText: fipeTable.brand,
          ),
          _ResultInfoListTile(
            text: 'Modelo',
            suffixText: fipeTable.model,
          ),
          _ResultInfoListTile(
            text: 'Mês de Referência',
            suffixText: fipeTable.referenceMonth,
          ),
          _ResultInfoListTile(
            text: 'Combustível',
            suffixText: fipeTable.fuel,
          ),
          _ResultInfoListTile(
            text: r'Valor em R$',
            suffixText: fipeTable.price,
          ),
          _ResultInfoListTile(
            text: 'Data da consulta',
            suffixText: controller.formatDate(),
          ),
        ],
      ),
    );
  }
}

class _ResultInfoListTile extends StatelessWidget {
  final String text;
  final String suffixText;

  const _ResultInfoListTile({required this.text, required this.suffixText});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text, style: CustomTypography.regular),
            const SizedBox(width: 30),
            Flexible(
              flex: 1,
              child: Text(
                suffixText,
                textAlign: TextAlign.end,
                style: CustomTypography.semiBold,
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
