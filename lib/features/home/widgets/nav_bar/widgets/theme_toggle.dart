import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manish_flutter_portfolio/core/app_theme/theme_provider.dart';

class ThemeToggle extends ConsumerWidget {
  final ThemeMode themeMode;
  const ThemeToggle({super.key, required this.themeMode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: ref.read(themeProvider.notifier).toggle,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: colorScheme.outlineVariant),
          color: colorScheme.surfaceContainerLow,
        ),
        child: Icon(
          themeMode == ThemeMode.dark
              ? Icons.light_mode_rounded
              : Icons.dark_mode_rounded,
          size: 18,
          color: colorScheme.primary,
        ),
      ),
    );
  }
}
