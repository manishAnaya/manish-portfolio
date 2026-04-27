// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ChatMessageNotifier)
final chatMessageProvider = ChatMessageNotifierProvider._();

final class ChatMessageNotifierProvider
    extends $NotifierProvider<ChatMessageNotifier, ChatState> {
  ChatMessageNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatMessageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatMessageNotifierHash();

  @$internal
  @override
  ChatMessageNotifier create() => ChatMessageNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChatState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChatState>(value),
    );
  }
}

String _$chatMessageNotifierHash() =>
    r'7756520f32cebddbfb23c0784fcee58194b86b81';

abstract class _$ChatMessageNotifier extends $Notifier<ChatState> {
  ChatState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ChatState, ChatState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ChatState, ChatState>,
              ChatState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
