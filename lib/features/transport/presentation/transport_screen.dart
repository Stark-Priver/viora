import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../core/database/tables.dart';
import '../../../core/design_system/tokens/spacing.dart';
import '../../../core/design_system/widgets/viora_button.dart';
import '../../../core/design_system/widgets/viora_card.dart';
import '../../../core/design_system/widgets/viora_chip.dart';
import '../../../core/design_system/widgets/viora_empty_state.dart';
import '../../../core/design_system/widgets/viora_form_sheet.dart';
import '../../../core/design_system/widgets/viora_input.dart';
import '../../../core/design_system/widgets/viora_section.dart';
import '../../../core/design_system/widgets/viora_stat.dart';
import 'providers/transport_providers.dart';
import '../../../core/design_system/theme/viora_neu_theme.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class TransportScreen extends ConsumerWidget {
  const TransportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehiclesAsync = ref.watch(vehiclesProvider);
    final selectedId = ref.watch(selectedVehicleIdProvider);
    final fmt = NumberFormat.decimalPattern();

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.lg, VioraSpacing.xl6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          VioraSection(
            title: 'Transport',
            subtitle: 'Fuel, maintenance, cost per km',
            trailing: VioraButton(
              label: 'Add vehicle',
              icon: IconsaxPlusBold.add,
              onPressed: () => showVioraFormSheet(context: context, title: 'New vehicle', icon: IconsaxPlusBroken.car, accentColor: context.neu.domainTransport, builder: (_) => const _VehicleForm()),
            ),
          ),
          vehiclesAsync.when(
            data: (vehicles) {
              if (vehicles.isEmpty) {
                return VioraEmptyState(
                  icon: IconsaxPlusBroken.car,
                  title: 'No vehicles yet',
                  message: 'Add a motorcycle, car, or bike to start logging fuel and maintenance.',
                  actionLabel: 'Add vehicle',
                  onAction: () => showVioraFormSheet(context: context, title: 'New vehicle', icon: IconsaxPlusBroken.car, accentColor: context.neu.domainTransport, builder: (_) => const _VehicleForm()),
                );
              }

              final activeId = selectedId != null && vehicles.any((v) => v.id == selectedId) ? selectedId : vehicles.first.id;
              if (selectedId != activeId) {
                WidgetsBinding.instance.addPostFrameCallback((_) => ref.read(selectedVehicleIdProvider.notifier).state = activeId);
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: VioraSpacing.sm,
                    children: [
                      for (final v in vehicles)
                        VioraChip(
                          label: v.name,
                          icon: IconsaxPlusBroken.car,
                          selected: v.id == activeId,
                          onTap: () => ref.read(selectedVehicleIdProvider.notifier).state = v.id,
                        ),
                    ],
                  ),
                  const SizedBox(height: VioraSpacing.xl2),
                  Row(
                    children: [
                      Expanded(
                        child: VioraButton(
                          label: 'Log fuel',
                          icon: IconsaxPlusBroken.gas_station,
                          expand: true,
                          onPressed: () => showVioraFormSheet(context: context, title: 'Log fuel', icon: IconsaxPlusBroken.gas_station, accentColor: context.neu.domainTransport, builder: (_) => _FuelForm(vehicleId: activeId)),
                        ),
                      ),
                      const SizedBox(width: VioraSpacing.md),
                      Expanded(
                        child: VioraButton(
                          label: 'Log service',
                          icon: IconsaxPlusBroken.setting_2,
                          expand: true,
                          onPressed: () => showVioraFormSheet(context: context, title: 'Log maintenance', icon: IconsaxPlusBroken.setting_2, accentColor: context.neu.domainTransport, builder: (_) => _MaintenanceForm(vehicleId: activeId)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: VioraSpacing.xl2),
                  Consumer(builder: (context, ref, _) {
                    final fuelAsync = ref.watch(fuelLogsProvider);
                    return fuelAsync.when(
                      data: (logs) {
                        if (logs.isEmpty) return const SizedBox.shrink();
                        final totalLitres = logs.fold<double>(0, (s, l) => s + l.litres);
                        final totalCost = logs.fold<double>(0, (s, l) => s + l.cost);
                        return VioraCard(
                          orbColors: [context.neu.domainTransport, context.neu.brand],
                          child: Row(
                            children: [
                              Expanded(child: VioraStat(label: 'Total spent', value: totalCost, formatter: fmt.format, icon: IconsaxPlusBroken.money, metricSize: 22)),
                              Expanded(child: VioraStat(label: 'Litres', value: totalLitres, formatter: (v) => v.toStringAsFixed(1), icon: IconsaxPlusBroken.gas_station, metricSize: 22)),
                              Expanded(child: VioraStat(label: 'Cost/L', value: totalLitres == 0 ? 0 : totalCost / totalLitres, formatter: fmt.format, icon: IconsaxPlusBroken.calculator, metricSize: 22)),
                            ],
                          ),
                        );
                      },
                      loading: () => const SizedBox.shrink(),
                      error: (e, st) => const SizedBox.shrink(),
                    );
                  }),
                  const SizedBox(height: VioraSpacing.xl2),
                  const VioraSection(title: 'Fuel log'),
                  Consumer(builder: (context, ref, _) {
                    final fuelAsync = ref.watch(fuelLogsProvider);
                    return fuelAsync.when(
                      data: (logs) {
                        if (logs.isEmpty) return const VioraEmptyState(icon: IconsaxPlusBroken.gas_station, title: 'No fuel logs', message: 'Log a fill-up to start tracking cost.');
                        return Column(
                          children: [
                            for (final l in logs)
                              Padding(
                                padding: const EdgeInsets.only(bottom: VioraSpacing.md),
                                child: VioraCard(
                                  padding: const EdgeInsets.symmetric(horizontal: VioraSpacing.lg, vertical: VioraSpacing.lg),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text('${l.litres}L · ${DateFormat('d MMM').format(l.date)}', style: Theme.of(context).textTheme.bodyLarge),
                                      ),
                                      Text(fmt.format(l.cost), style: Theme.of(context).textTheme.titleMedium),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                      loading: () => const Padding(padding: EdgeInsets.symmetric(vertical: VioraSpacing.xl2), child: Center(child: CircularProgressIndicator())),
                      error: (e, st) => Text('Failed to load fuel logs: $e'),
                    );
                  }),
                  const SizedBox(height: VioraSpacing.xl2),
                  const VioraSection(title: 'Maintenance log'),
                  Consumer(builder: (context, ref, _) {
                    final maintAsync = ref.watch(maintenanceLogsProvider);
                    return maintAsync.when(
                      data: (logs) {
                        if (logs.isEmpty) return const VioraEmptyState(icon: IconsaxPlusBroken.setting_2, title: 'No maintenance logs', message: 'Log an oil change, tyres, or repair.');
                        return Column(
                          children: [
                            for (final l in logs)
                              Padding(
                                padding: const EdgeInsets.only(bottom: VioraSpacing.md),
                                child: VioraCard(
                                  padding: const EdgeInsets.symmetric(horizontal: VioraSpacing.lg, vertical: VioraSpacing.lg),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text('${l.type} · ${DateFormat('d MMM').format(l.date)}', style: Theme.of(context).textTheme.bodyLarge),
                                      ),
                                      if (l.cost != null) Text(fmt.format(l.cost), style: Theme.of(context).textTheme.titleMedium),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                      loading: () => const Padding(padding: EdgeInsets.symmetric(vertical: VioraSpacing.xl2), child: Center(child: CircularProgressIndicator())),
                      error: (e, st) => Text('Failed to load maintenance logs: $e'),
                    );
                  }),
                ],
              );
            },
            loading: () => const Padding(padding: EdgeInsets.symmetric(vertical: VioraSpacing.xl4), child: Center(child: CircularProgressIndicator())),
            error: (e, st) => Text('Failed to load vehicles: $e'),
          ),
        ],
      ),
    );
  }
}

class _VehicleForm extends ConsumerStatefulWidget {
  const _VehicleForm();
  @override
  ConsumerState<_VehicleForm> createState() => _VehicleFormState();
}

class _VehicleFormState extends ConsumerState<_VehicleForm> {
  final _name = TextEditingController();
  String _type = VehicleTypes.motorcycle;

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        VioraInput(controller: _name, label: 'Vehicle name', hint: 'e.g. Sanya 150cc', autofocus: true),
        const SizedBox(height: VioraSpacing.lg),
        Wrap(
          spacing: VioraSpacing.sm,
          children: [
            for (final t in VehicleTypes.all) VioraChip(label: t.replaceAll('_', ' '), selected: _type == t, onTap: () => setState(() => _type = t)),
          ],
        ),
        const SizedBox(height: VioraSpacing.xl2),
        VioraButton(
          label: 'Add vehicle',
          icon: IconsaxPlusBroken.car,
          expand: true,
          onPressed: () {
            final name = _name.text.trim();
            if (name.isEmpty) return;
            ref.read(transportActionsProvider).addVehicle(name: name, type: _type);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class _FuelForm extends ConsumerStatefulWidget {
  const _FuelForm({required this.vehicleId});
  final String vehicleId;
  @override
  ConsumerState<_FuelForm> createState() => _FuelFormState();
}

class _FuelFormState extends ConsumerState<_FuelForm> {
  final _litres = TextEditingController();
  final _cost = TextEditingController();
  final _odometer = TextEditingController();

  @override
  void dispose() {
    _litres.dispose();
    _cost.dispose();
    _odometer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        VioraInput(controller: _litres, label: 'Litres', hint: '5', keyboardType: TextInputType.number, autofocus: true),
        const SizedBox(height: VioraSpacing.lg),
        VioraInput(controller: _cost, label: 'Cost', hint: '15000', keyboardType: TextInputType.number),
        const SizedBox(height: VioraSpacing.lg),
        VioraInput(controller: _odometer, label: 'Odometer (km)', hint: 'Optional', keyboardType: TextInputType.number),
        const SizedBox(height: VioraSpacing.xl2),
        VioraButton(
          label: 'Log fuel',
          icon: IconsaxPlusBroken.gas_station,
          expand: true,
          onPressed: () {
            final litres = double.tryParse(_litres.text.trim());
            final cost = double.tryParse(_cost.text.trim());
            if (litres == null || cost == null) return;
            ref.read(transportActionsProvider).logFuel(vehicleId: widget.vehicleId, litres: litres, cost: cost, odometerKm: double.tryParse(_odometer.text.trim()));
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class _MaintenanceForm extends ConsumerStatefulWidget {
  const _MaintenanceForm({required this.vehicleId});
  final String vehicleId;
  @override
  ConsumerState<_MaintenanceForm> createState() => _MaintenanceFormState();
}

class _MaintenanceFormState extends ConsumerState<_MaintenanceForm> {
  final _type = TextEditingController();
  final _cost = TextEditingController();
  final _notes = TextEditingController();

  @override
  void dispose() {
    _type.dispose();
    _cost.dispose();
    _notes.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        VioraInput(controller: _type, label: 'Type', hint: 'e.g. Oil change', autofocus: true),
        const SizedBox(height: VioraSpacing.lg),
        VioraInput(controller: _cost, label: 'Cost', hint: 'Optional', keyboardType: TextInputType.number),
        const SizedBox(height: VioraSpacing.lg),
        VioraInput(controller: _notes, label: 'Notes', hint: 'Optional'),
        const SizedBox(height: VioraSpacing.xl2),
        VioraButton(
          label: 'Log maintenance',
          icon: IconsaxPlusBroken.setting_2,
          expand: true,
          onPressed: () {
            final type = _type.text.trim();
            if (type.isEmpty) return;
            ref.read(transportActionsProvider).logMaintenance(vehicleId: widget.vehicleId, type: type, cost: double.tryParse(_cost.text.trim()), notes: _notes.text.trim().isEmpty ? null : _notes.text.trim());
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
