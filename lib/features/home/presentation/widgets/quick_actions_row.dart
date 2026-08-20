import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/design_system/theme/viora_neu_theme.dart';
import '../../../../core/design_system/tokens/motion.dart';
import '../../../../core/design_system/tokens/spacing.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class _QuickAction {
  const _QuickAction({required this.label, required this.icon, required this.color});
  final String label;
  final IconData icon;
  final Color Function(VioraNeuTheme neu) color;
}

const _actions = <_QuickAction>[
  _QuickAction(label: 'Task', icon: IconsaxPlusBroken.add_circle, color: _work),
  _QuickAction(label: 'Expense', icon: IconsaxPlusBold.receipt_item, color: _finance),
  _QuickAction(label: 'Focus', icon: IconsaxPlusBroken.scan, color: _brand),
  _QuickAction(label: 'Journal', icon: IconsaxPlusBroken.edit, color: _study),
  _QuickAction(label: 'Habit', icon: IconsaxPlusBroken.repeat, color: _health),
];

Color _work(VioraNeuTheme neu) => neu.domainWork;
Color _finance(VioraNeuTheme neu) => neu.domainFinance;
Color _brand(VioraNeuTheme neu) => neu.brand;
Color _study(VioraNeuTheme neu) => neu.domainStudy;
Color _health(VioraNeuTheme neu) => neu.domainHealth;

/// Fast-capture row — one tap from Home into the add-flow for the things
/// logged most often, matching the product brief's "Quick Capture"
/// concept without needing a separate floating-button surface yet.
class QuickActionsRow extends StatelessWidget {
  const QuickActionsRow({super.key, required this.onTaskTap, required this.onExpenseTap, required this.onFocusTap, required this.onJournalTap, required this.onHabitTap});

  final VoidCallback onTaskTap;
  final VoidCallback onExpenseTap;
  final VoidCallback onFocusTap;
  final VoidCallback onJournalTap;
  final VoidCallback onHabitTap;

  @override
  Widget build(BuildContext context) {
    final callbacks = <VoidCallback>[onTaskTap, onExpenseTap, onFocusTap, onJournalTap, onHabitTap];

    return SizedBox(
      height: 84,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _actions.length,
        separatorBuilder: (_, __) => const SizedBox(width: VioraSpacing.md),
        itemBuilder: (context, i) {
          final action = _actions[i];
          return _QuickActionTile(action: action, onTap: callbacks[i])
              .animate()
              .fadeIn(delay: Duration(milliseconds: 40 * i), duration: VioraMotion.medium, curve: VioraMotion.standard)
              .slideX(begin: 0.15, end: 0, delay: Duration(milliseconds: 40 * i), duration: VioraMotion.medium, curve: VioraMotion.standard);
        },
      ),
    );
  }
}

class _QuickActionTile extends StatelessWidget {
  const _QuickActionTile({required this.action, required this.onTap});
  final _QuickAction action;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;
    final color = action.color(neu);

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Container(
          width: 72,
          padding: const EdgeInsets.symmetric(vertical: VioraSpacing.sm),
          decoration: BoxDecoration(
            color: neu.surface,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(color: neu.darkShadow.withValues(alpha: 0.45), offset: const Offset(4, 4), blurRadius: 10),
              BoxShadow(color: neu.lightShadow.withValues(alpha: 0.65), offset: const Offset(-4, -4), blurRadius: 10),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(color: color.withValues(alpha: 0.16), shape: BoxShape.circle),
                child: Icon(action.icon, size: 17, color: color),
              ),
              const SizedBox(height: VioraSpacing.xs),
              Text(action.label, style: Theme.of(context).textTheme.labelSmall, maxLines: 1, overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
      ),
    );
  }
}
