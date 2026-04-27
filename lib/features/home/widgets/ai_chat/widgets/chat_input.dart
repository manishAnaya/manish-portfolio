import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manish_flutter_portfolio/core/app_theme/app_gradients.dart';

class ChatInput extends StatefulWidget {
  const ChatInput({super.key, required this.onSend, required this.isLoading});

  final void Function(String) onSend;
  final bool isLoading;

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final _ctrl = TextEditingController();
  final _focus = FocusNode();
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _ctrl.addListener(() {
      final hasText = _ctrl.text.trim().isNotEmpty;
      if (hasText != _hasText) setState(() => _hasText = hasText);
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    _focus.dispose();
    super.dispose();
  }

  void _send() {
    final text = _ctrl.text.trim();
    if (text.isEmpty || widget.isLoading) return;
    widget.onSend(text);
    _ctrl.clear();
    _focus.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: colorScheme.outlineVariant)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _ctrl,
              focusNode: _focus,
              onSubmitted: (_) => _send(),
              enabled: !widget.isLoading,
              minLines: 1,
              style: GoogleFonts.dmSans(fontSize: 13),
              decoration: InputDecoration(
                hintText: 'Ask me about Manish\'s work, skills, or projects...',
                hintStyle: GoogleFonts.dmSans(
                  fontSize: 13,
                  color: colorScheme.onSurface.withValues(alpha: 0.35),
                ),
                filled: true,
                fillColor: colorScheme.surfaceContainerLow,
              ),
            ),
          ),
          const SizedBox(width: 10),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            child: GestureDetector(
              onTap: _send,
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: _hasText && !widget.isLoading
                      ? AppGradients.primaryGradient
                      : null,
                  color: _hasText && !widget.isLoading
                      ? null
                      : colorScheme.surfaceContainerLow,
                  border: Border.all(
                    color: _hasText && !widget.isLoading
                        ? Colors.transparent
                        : colorScheme.outlineVariant,
                  ),
                ),
                child: widget.isLoading
                    ? Padding(
                        padding: const EdgeInsets.all(12),
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: colorScheme.primary,
                        ),
                      )
                    : Icon(
                        Icons.send_rounded,
                        size: 18,
                        color: _hasText
                            ? Colors.white
                            : colorScheme.onSurface.withValues(alpha: 0.3),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
