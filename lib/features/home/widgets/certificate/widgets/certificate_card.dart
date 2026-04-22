import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manish_flutter_portfolio/core/utils/responsive.dart';
import 'package:manish_flutter_portfolio/shared/models/certificate_model.dart';

class CertificateCard extends StatelessWidget {
  final Certificate certificate;
  final bool isActive;

  const CertificateCard({
    super.key,
    required this.certificate,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isMobile = Responsive.isMobile(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isActive
              ? certificate.accentColor.withValues(alpha: 0.5)
              : colorScheme.outlineVariant,
          width: isActive ? 1.5 : 1,
        ),
        image: DecorationImage(
          image: AssetImage(certificate.imagePath),
          fit: isMobile ? BoxFit.contain : BoxFit.cover,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Info strip
          Container(
            color: Colors.black45,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                // Accent dot
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: certificate.accentColor,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        certificate.title,
                        style: textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${certificate.issuer} · ${certificate.date}',
                        style: GoogleFonts.dmMono(
                          fontSize: 10,
                          color: colorScheme.onSurface.withValues(alpha: 0.4),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                // Type badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: certificate.accentColor.withValues(alpha: 0.12),
                    border: Border.all(
                      color: certificate.accentColor.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Text(
                    certificate.type == 'Certificate of Completion'
                        ? 'Completion'
                        : 'Participation',
                    style: GoogleFonts.dmMono(
                      fontSize: 9,
                      color: certificate.accentColor,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
