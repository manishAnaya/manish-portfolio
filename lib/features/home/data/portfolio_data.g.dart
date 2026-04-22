// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_data.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(experiences)
final experiencesProvider = ExperiencesProvider._();

final class ExperiencesProvider
    extends
        $FunctionalProvider<
          List<Experience>,
          List<Experience>,
          List<Experience>
        >
    with $Provider<List<Experience>> {
  ExperiencesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'experiencesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$experiencesHash();

  @$internal
  @override
  $ProviderElement<List<Experience>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Experience> create(Ref ref) {
    return experiences(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Experience> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Experience>>(value),
    );
  }
}

String _$experiencesHash() => r'd6a6dff59faf82ef5db11c2b923ab85d6fcd8b4b';

@ProviderFor(projects)
final projectsProvider = ProjectsProvider._();

final class ProjectsProvider
    extends $FunctionalProvider<List<Project>, List<Project>, List<Project>>
    with $Provider<List<Project>> {
  ProjectsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'projectsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$projectsHash();

  @$internal
  @override
  $ProviderElement<List<Project>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Project> create(Ref ref) {
    return projects(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Project> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Project>>(value),
    );
  }
}

String _$projectsHash() => r'1e680729fbd1214d3925ad81aacd591acca05532';
