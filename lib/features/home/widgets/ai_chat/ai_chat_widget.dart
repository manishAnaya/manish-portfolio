import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manish_flutter_portfolio/core/app_theme/app_colors.dart';
import 'package:manish_flutter_portfolio/core/app_theme/app_gradients.dart';
import 'package:manish_flutter_portfolio/core/constants/app_constants.dart';
import 'package:manish_flutter_portfolio/features/home/provider/chat_message_provider.dart';
import 'widgets/chat_bubble.dart';
import 'widgets/chat_input.dart';
import 'widgets/typing_indicator.dart';

class AIChatWidget extends ConsumerStatefulWidget {
  final bool showCross;
  final Widget crossWidget;
  const AIChatWidget({
    super.key,
    this.showCross = false,
    required this.crossWidget,
  });

  @override
  ConsumerState<AIChatWidget> createState() => _AIChatWidgetState();
}

class _AIChatWidgetState extends ConsumerState<AIChatWidget> {
  final _scrollCtrl = ScrollController();

  @override
  void dispose() {
    _scrollCtrl.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollCtrl.hasClients) {
        _scrollCtrl.animateTo(
          _scrollCtrl.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> _send(String text) async {
    await ref.read(chatMessageProvider.notifier).send(text);
    _scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final chatState = ref.watch(chatMessageProvider);
    final messages = chatState.messages;
    final isLoading = chatState.status == ChatStatus.loading;
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          // ── Header ─────────────────────────────────────
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: colorScheme.outlineVariant),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: AppGradients.primaryGradient,
                  ),
                  child: const Center(
                    child: Text(
                      '✦',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'MKA · AI Assistant',
                        style: textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.neonGreen,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Ask me anything about Manish',
                            style: GoogleFonts.dmMono(
                              fontSize: 10,
                              color: colorScheme.onSurface.withValues(
                                alpha: 0.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Clear chat
                if (messages.isNotEmpty)
                  GestureDetector(
                    onTap: ref.read(chatMessageProvider.notifier).clear,
                    child: Icon(
                      Icons.refresh_rounded,
                      size: 18,
                      color: colorScheme.onSurface.withValues(alpha: 0.4),
                    ),
                  ),
                if (widget.showCross) widget.crossWidget,
              ],
            ),
          ),

          // ── Messages ────────────────────────────────────
          Expanded(
            child: messages.isEmpty
                ? _EmptyState(onSuggestionTap: _send)
                : ListView.builder(
                    controller: _scrollCtrl,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    itemCount: messages.length + (isLoading ? 1 : 0),
                    itemBuilder: (_, i) {
                      if (i == messages.length) {
                        return const TypingIndicator();
                      }
                      final msg = messages[i];
                      return ChatBubble(
                        text: msg.text,
                        isUser: msg.isUser,
                        timestamp: msg.timestamp,
                      );
                    },
                  ),
          ),

          // ── Input ────────────────────────────────────────
          ChatInput(onSend: _send, isLoading: isLoading),
        ],
      ),
    );
  }
}

// ── Empty state with suggestions ──────────────────────────────────────────────
class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.onSuggestionTap});
  final void Function(String) onSuggestionTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Container(
            width: 64,
            height: 64,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppGradients.primaryGradient,
            ),
            child: const Center(
              child: Text(
                '✦',
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Hi! I\'m Manish\'s AI Assistant',
            style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Ask me anything about his experience,\nprojects, skills, or how to get in touch.',
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.5),
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 28),
          Text(
            'SUGGESTED QUESTIONS',
            style: GoogleFonts.dmMono(
              fontSize: 9,
              letterSpacing: 2,
              color: colorScheme.onSurface.withValues(alpha: 0.3),
            ),
          ),
          const SizedBox(height: 12),
          ...AppConstants.suggestions.map(
            (s) => _SuggestionChip(
              label: s,
              onTap: () => onSuggestionTap(
                s.substring(2).trim(), // strip emoji
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SuggestionChip extends StatefulWidget {
  const _SuggestionChip({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  State<_SuggestionChip> createState() => _SuggestionChipState();
}

class _SuggestionChipState extends State<_SuggestionChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: _hovered
                ? colorScheme.primary.withValues(alpha: 0.08)
                : colorScheme.surfaceContainerLow,
            border: Border.all(
              color: _hovered
                  ? colorScheme.primary.withValues(alpha: 0.4)
                  : colorScheme.outlineVariant,
            ),
          ),
          child: Text(
            widget.label,
            style: GoogleFonts.dmSans(
              fontSize: 13,
              color: _hovered
                  ? colorScheme.primary
                  : colorScheme.onSurface.withValues(alpha: 0.7),
            ),
          ),
        ),
      ),
    );
  }
}
