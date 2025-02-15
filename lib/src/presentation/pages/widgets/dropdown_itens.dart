import 'package:fipe_agora/src/domain/entities/brand_entity.dart';
import 'package:fipe_agora/src/domain/entities/reference_table_entity.dart';
import 'package:fipe_agora/src/domain/entities/vehicle_models_entity.dart';
import 'package:fipe_agora/src/domain/entities/year_model_entity.dart';
import 'package:fipe_agora/src/presentation/controller/fipe_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DropDownItens extends StatefulWidget {
  const DropDownItens({
    super.key,
  });

  @override
  State<DropDownItens> createState() => _DropDownItensState();
}

class _DropDownItensState extends State<DropDownItens> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FipeController>(
      builder: (context, controller, _) {
        return Column(
          spacing: 20,
          children: [
            _DropDownMenuWidget<ReferenceTableEntity>(
              title: 'Tabela de Referência',
              isLoading: controller.isLoading,
              enabled: controller.referenceTableList.isNotEmpty &&
                  !controller.isLoading,
              itemList: controller.referenceTableList,
              selectedItem: controller.referenceTable,
              itemLabel: (value) => value.mes,
              onSelect: (value) {
                controller.getBrand(value!);
              },
            ),
            _DropDownMenuWidget<BrandEntity>(
              title: 'Marcas',
              isLoading: controller.isLoading,
              enabled: controller.brandList.isNotEmpty && !controller.isLoading,
              itemList: controller.brandList,
              selectedItem: controller.brandEntity,
              itemLabel: (value) => value.label,
              onSelect: (value) {
                controller.getVehicleModel(value!);
              },
            ),
            _DropDownMenuWidget<ModelEntity>(
              title: 'Modelo',
              isLoading: controller.isLoading,
              enabled: controller.vehicleModel.model.isNotEmpty &&
                  !controller.isLoading,
              itemList: controller.vehicleModel.model,
              selectedItem: controller.modelEntity,
              itemLabel: (value) => value.label,
              onSelect: (value) {
                controller.getYearModel(value!);
              },
            ),
            _DropDownMenuWidget<YearModelEntity>(
              title: 'Ano',
              isLoading: controller.isLoading,
              enabled: controller.vehicleModel.year.isNotEmpty &&
                  !controller.isLoading,
              itemList: controller.yearModelList,
              selectedItem: controller.yearModelEntity,
              itemLabel: (value) => value.label,
              onSelect: (value) {
                controller.getFipeTable(value!);
              },
            ),
          ],
        );
      },
    );
  }
}

class _DropDownMenuWidget<T> extends StatefulWidget {
  final String title;
  final ValueChanged<T?> onSelect;
  final bool enabled;
  final bool isLoading;
  final List<T> itemList;
  final T? selectedItem;
  final String Function(T) itemLabel;

  const _DropDownMenuWidget({
    super.key,
    required this.title,
    required this.onSelect,
    required this.enabled,
    required this.itemList,
    required this.itemLabel,
    this.isLoading = false,
    this.selectedItem,
  });

  @override
  State<_DropDownMenuWidget<T>> createState() => _DropDownMenuWidgetState<T>();
}

class _DropDownMenuWidgetState<T> extends State<_DropDownMenuWidget<T>> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Skeletonizer(
          enabled: widget.isLoading,
          child: DropdownMenu<T>(
            hintText: 'Selecione um valor',
            enableSearch: true,
            requestFocusOnTap: true,
            controller: textController,
            enabled: widget.enabled,
            width: double.infinity,
            initialSelection: widget.selectedItem,
            menuHeight: 300,
            menuStyle: const MenuStyle(
              alignment: AlignmentDirectional.bottomStart,
              backgroundColor: WidgetStatePropertyAll(Colors.white),
            ),
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              constraints: BoxConstraints.tight(const Size.fromHeight(50)),
              fillColor: const Color.fromRGBO(242, 242, 242, 1),
            ),
            dropdownMenuEntries: widget.itemList.map((T item) {
              return DropdownMenuEntry<T>(
                value: item,
                label: widget.itemLabel(item),
              );
            }).toList(),
            onSelected: widget.onSelect,
          ),
        ),
      ],
    );
  }
}
