import 'package:flutter/material.dart';
import '../../../core/design_system/widgets/viora_info_screen.dart';

class AiCoachScreen extends StatelessWidget {
  const AiCoachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const VioraInfoScreen(
      title: 'AI Coach',
      subtitle: 'Ask questions about your own data',
      icon: Icons.auto_awesome_rounded,
      headline: 'AI Coach needs a model provider decision before it can ship',
      body: 'This is meant to answer things like "where did my time go this week" or "how much did I spend on '
          'the motorcycle" using your real Viora data — which means picking an LLM provider, wiring an API key '
          'somewhere safe (never hardcoded), and deciding what data it\'s allowed to read. That\'s a product '
          'decision, not something to guess at silently.',
      requirements: [
        'A choice of model provider and where the API key is stored',
        'A read-only query layer over your database, scoped to what the AI is allowed to see',
        'Evidence-backed responses only — no shame-based or manipulative phrasing, per the product\'s ethics rules',
      ],
    );
  }
}
