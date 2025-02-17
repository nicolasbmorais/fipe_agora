import 'package:fipe_agora/src/core/typography.dart';
import 'package:fipe_agora/src/presentation/controller/fipe_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClearButton extends StatelessWidget {
  const ClearButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 12.0,
        ),
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
            onPressed: () => context.read<FipeController>().reset(),
            child: Text('Limpar dados', style: CustomTypography.bold),
          ),
        ),
      ),
    );
  }
}
