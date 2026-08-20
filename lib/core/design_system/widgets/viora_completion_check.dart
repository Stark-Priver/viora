import 'package:flutter/material.dart';
import '../theme/viora_neu_theme.dart';

/// A circular checkbox that pops with a spring bounce the moment it becomes
/// checked — used for task/habit completion so the one moment of "done"
/// actually feels like something, without turning into a gamified reward
/// animation (no confetti, no streak counters here).
class VioraCompletionCheck extends StatelessWidget {
  const VioraCompletionCheck({super.key, required this.completed, required this.onTap, this.size = 24});

  final bool completed;
  final VoidCallback onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    final neu = context.neu;

    return GestureDetector(
      onTap: onTap,
      child: TweenAnimationBuilder<double>(
        key: ValueKey(completed),
        tween: Tween(begin: completed ? 0.55 : 1.0, end: 1.0),
        duration: const Duration(milliseconds: 380),
        curve: Curves.elasticOut,
        builder: (context, scale, child) => Transform.scale(scale: scale, child: child),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: completed ? neu.success : Colors.transparent,
            border: Border.all(color: completed ? neu.success : neu.divider, width: 2),
          ),
          child: completed ? Icon(Icons.check_rounded, size: size * 0.62, color: Colors.white) : null,
        ),
      ),
    );
  }
}
