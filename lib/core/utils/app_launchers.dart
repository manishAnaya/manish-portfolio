import 'package:manish_flutter_portfolio/core/constants/app_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class AppLauncher {
  AppLauncher._();

  static Future<void> openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  static Future<void> openEmail() async {
    final uri = Uri(
      scheme: 'mailto',
      path: AppConstants.email,
      queryParameters: {
        'subject': 'Hello Manish — Let\'s connect!',
        'body': 'Hi Manish,\n\n',
      },
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  static Future<void> downloadCv() async => openUrl(AppConstants.cvUrl);

  static Future<void> openGithub() async => openUrl(AppConstants.github);

  static Future<void> openLinkedIn() async => openUrl(AppConstants.linkedIn);

  static Future<void> openLocation() async => openUrl(AppConstants.locationUrl);

  static Future<void> openPlayStore(String url) async => openUrl(url);

  static Future<void> openAppStore(String url) async => openUrl(url);
}
