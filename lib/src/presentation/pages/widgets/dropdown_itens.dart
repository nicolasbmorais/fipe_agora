import 'package:fipe_agora/src/domain/entities/brand_entity.dart';
import 'package:fipe_agora/src/domain/entities/vehicle_models_entity.dart';
import 'package:fipe_agora/src/domain/entities/reference_table_entity.dart';
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
          children: [
            const SizedBox(height: 20),
            DropDownMenuWidget<ReferenceTableEntity>(
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
            const SizedBox(height: 20),
            DropDownMenuWidget<BrandEntity>(
              title: 'Marcas',
              isLoading: controller.isLoading,
              enabled: controller.brandList.isNotEmpty && !controller.isLoading,
              itemList: controller.brandList,
              selectedItem: controller.brandEntity,
              itemLabel: (value) => value.value,
              onSelect: (value) {
                controller.getVehicleModel(value!);
              },
            ),
            const SizedBox(height: 20),
            // DropDownMenuWidget<VehicleModels>(
            //   title: 'Modelos',
            //   isLoading: controller.isLoading,
            //   enabled: controller.vehicleModelList.isNotEmpty &&
            //       !controller.isLoading,
            //   itemList: controller.vehicleModelList,
            //   selectedItem: controller.vehicleModel,
            //   itemLabel: (value) => value.value.toString(),
            //   onSelect: (value) {
            //     controller.getYearModel(value!);
            //   },
            // ),
            const SizedBox(height: 20),
            DropDownMenuWidget<ReferenceTableEntity>(
              title: 'Ano',
              isLoading: controller.isLoading,
              enabled: controller.referenceTableList.isNotEmpty &&
                  !controller.isLoading,
              itemList: controller.referenceTableList,
              selectedItem: controller.referenceTable,
              itemLabel: (value) => value.mes,
              onSelect: (value) {
                // controller.selectReferenceTable(value!);
              },
            ),
          ],
        );
      },
    );
  }
}

class DropDownMenuWidget<T> extends StatelessWidget {
  final String title;
  final ValueChanged<T?> onSelect;
  final bool enabled;
  final bool isLoading;
  final List<T> itemList;
  final T? selectedItem;
  final String Function(T) itemLabel;

  const DropDownMenuWidget({
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
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 5),
        Skeletonizer(
          enabled: isLoading,
          child: DropdownMenu<T>(
            enabled: enabled,
            width: double.infinity,
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
              constraints: BoxConstraints.tight(const Size.fromHeight(40)),
              fillColor: const Color.fromRGBO(242, 242, 242, 1),
            ),
            dropdownMenuEntries: itemList.map((T item) {
              return DropdownMenuEntry<T>(
                value: item,
                label: itemLabel(item),
              );
            }).toList(),
            onSelected: onSelect,
          ),
        ),
      ],
    );
  }
}
