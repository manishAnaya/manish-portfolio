import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'portfolio_ai_service.g.dart';

class PortfolioAIService {
  static const _baseUrl =
      'https://portfolioagent-production-4fe1.up.railway.app';

  final String _sessionId = _generateSessionId();

  static String _generateSessionId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  Future<String> askQuestion(String question) async {
    try {
      final response = await http
          .post(
            Uri.parse('$_baseUrl/ask'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({'question': question, 'session_id': _sessionId}),
          )
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['status'] == 'success') {
          return data['answer'] as String;
        } else {
          return _errorMessage('Unexpected response from server.');
        }
      } else {
        return _errorMessage('Server error (${response.statusCode}).');
      }
    } on http.ClientException {
      return _errorMessage('Could not reach the server. Please try again.');
    } on FormatException {
      return _errorMessage('Invalid response format.');
    } catch (e) {
      return _errorMessage('Something went wrong. Please try again.');
    }
  }

  String _errorMessage(String reason) =>
      '⚠️ $reason\n\nYou can also reach Manish directly at **manish.ag555@gmail.com**';
}

@riverpod
PortfolioAIService portfolioAIService(Ref ref) {
  return PortfolioAIService();
}
