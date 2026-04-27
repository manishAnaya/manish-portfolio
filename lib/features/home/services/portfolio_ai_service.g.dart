// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_ai_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(portfolioAIService)
final portfolioAIServiceProvider = PortfolioAIServiceProvider._();

final class PortfolioAIServiceProvider
    extends
        $FunctionalProvider<
          PortfolioAIService,
          PortfolioAIService,
          PortfolioAIService
        >
    with $Provider<PortfolioAIService> {
  PortfolioAIServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'portfolioAIServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$portfolioAIServiceHash();

  @$internal
  @override
  $ProviderElement<PortfolioAIService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PortfolioAIService create(Ref ref) {
    return portfolioAIService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PortfolioAIService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PortfolioAIService>(value),
    );
  }
}

String _$portfolioAIServiceHash() =>
    r'a2ff120dc7c4274bb00bcfc559222842e44c29db';
