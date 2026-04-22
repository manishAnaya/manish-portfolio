import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manish_flutter_portfolio/core/app_theme/app_colors.dart';
import 'package:manish_flutter_portfolio/core/utils/app_validators.dart';
import 'package:manish_flutter_portfolio/shared/widgets/neon_button.dart';
import 'package:http/http.dart' as http;

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => ContactFormState();
}

class ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _subjectCtrl = TextEditingController();
  final _messageCtrl = TextEditingController();
  bool _sending = false;
  bool _sent = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _subjectCtrl.dispose();
    _messageCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _sending = true);
    try {
      final response = await http.post(
        Uri.parse('https://formspree.io/f/meevrdqa'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'name': _nameCtrl.text,
          'email': _emailCtrl.text,
          'subject': _subjectCtrl.text,
          'message': _messageCtrl.text,
        }),
      );
      if (mounted) {
        if (response.statusCode == 200) {
          setState(() {
            _sending = false;
            _sent = true;
          });
        } else {
          setState(() => _sending = false);
          _showError();
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() => _sending = false);
        _showError();
      }
    }
  }

  void _showError() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Something went wrong. Please email me directly.',
          style: GoogleFonts.dmMono(fontSize: 12),
        ),
        backgroundColor: Theme.of(context).colorScheme.error,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _clearForm() {
    _nameCtrl.clear();
    _emailCtrl.clear();
    _subjectCtrl.clear();
    _messageCtrl.clear();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    if (_sent) {
      return Container(
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: colorScheme.surfaceContainerLow,
          border: Border.all(color: AppColors.neonGreen.withValues(alpha: 0.4)),
        ),
        child: Column(
          children: [
            const Text('✅', style: TextStyle(fontSize: 48)),
            const SizedBox(height: 16),
            Text('Message Sent!', style: textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(
              'Thanks for reaching out. I\'ll get back to you soon.',
              style: textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            NeonButton(
              label: 'Send Another',
              onPressed: () {
                setState(() => _sent = false);
                _clearForm();
              },
              variant: NeonButtonVariant.outlined,
            ),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: colorScheme.surfaceContainerLow,
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: _FormField(
                    controller: _nameCtrl,
                    label: 'Your Name',
                    hint: 'John Doe',
                    validator: AppValidator.validateRequiredField,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _FormField(
                    controller: _emailCtrl,
                    label: 'Email Address',
                    hint: 'john@example.com',
                    validator: AppValidator.validateEmail,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _FormField(
              controller: _subjectCtrl,
              label: 'Subject',
              hint: 'Project collaboration',
              validator: AppValidator.validateTextField,
            ),
            const SizedBox(height: 20),
            _FormField(
              controller: _messageCtrl,
              label: 'Message',
              hint: 'Tell me about your project...',
              maxLines: 5,
              validator: (v) {
                if (v == null || v.isEmpty) return 'Required';
                if (v.length < 10) return 'Too short';
                return null;
              },
            ),
            const SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              child: _sending
                  ? Center(
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: colorScheme.primary,
                        ),
                      ),
                    )
                  : NeonButton(
                      label: 'Send Message',
                      onPressed: _submit,
                      icon: Icons.send_rounded,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  const _FormField({
    required this.controller,
    required this.label,
    required this.hint,
    this.maxLines = 1,
    this.validator,
  });
  final TextEditingController controller;
  final String label;
  final String hint;
  final int maxLines;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.dmMono(
            fontSize: 12,
            letterSpacing: 0.5,
            color: colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          validator: validator,
          maxLines: maxLines,
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: InputDecoration(hintText: hint),
        ),
      ],
    );
  }
}
