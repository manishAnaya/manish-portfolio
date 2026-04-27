import 'package:manish_flutter_portfolio/features/home/services/portfolio_ai_service.dart';
import 'package:manish_flutter_portfolio/shared/models/chat_message.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'chat_message_provider.g.dart';

@riverpod
class ChatMessageNotifier extends _$ChatMessageNotifier {
  late final PortfolioAIService _aiService;
  @override
  ChatState build() {
    _aiService = ref.read(portfolioAIServiceProvider);
    return ChatState.initial();
  }

  Future<void> send(String question) async {
    state = state.copyWith(
      messages: [
        ...state.messages,
        ChatMessage(text: question, isUser: true, timestamp: DateTime.now()),
      ],
      status: ChatStatus.loading,
    );

    final answer = await _aiService.askQuestion(question);
    state = state.copyWith(
      messages: [
        ...state.messages,
        ChatMessage(text: answer, isUser: false, timestamp: DateTime.now()),
      ],
      status: ChatStatus.success,
    );
  }

  void clear() => state = ChatState.initial();
}

enum ChatStatus { initial, loading, success }

class ChatState {
  final List<ChatMessage> messages;
  final ChatStatus status;

  ChatState({required this.messages, required this.status});

  factory ChatState.initial() {
    return ChatState(messages: [], status: ChatStatus.initial);
  }

  ChatState copyWith({List<ChatMessage>? messages, ChatStatus? status}) {
    return ChatState(
      messages: messages ?? this.messages,
      status: status ?? this.status,
    );
  }
}
