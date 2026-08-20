import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/design_system/theme/viora_neu_theme.dart';
import '../../../../core/design_system/widgets/viora_card.dart';
import '../../../../core/design_system/widgets/viora_section.dart';
import '../../../../core/design_system/widgets/viora_stat.dart';
import '../../domain/home_dashboard_data.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class MoneyCard extends StatelessWidget {
  const MoneyCard({super.key, required this.money});

  final MoneySnapshot money;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;
    final fmt = NumberFormat.decimalPattern('en_US');
    String currency(double v) => fmt.format(v);

    return VioraCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VioraSection(title: "Today's Money", subtitle: money.currency),
          Row(
            children: [
              Expanded(
                child: VioraStat(
                  label: 'Income',
                  value: money.income,
                  formatter: currency,
                  icon: IconsaxPlusBroken.trend_down,
                  iconColor: neu.success,
                  metricSize: 22,
                ),
              ),
              Expanded(
                child: VioraStat(
                  label: 'Spent',
                  value: money.spent,
                  formatter: currency,
                  icon: IconsaxPlusBroken.trend_up,
                  iconColor: neu.danger,
                  metricSize: 22,
                ),
              ),
              Expanded(
                child: VioraStat(
                  label: 'Net',
                  value: money.net,
                  formatter: currency,
                  icon: IconsaxPlusBroken.wallet,
                  iconColor: neu.brand,
                  metricSize: 22,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
