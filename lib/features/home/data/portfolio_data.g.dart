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

String _$experiencesHash() => r'6d5b42dc677c96e7552f154453af325697a65569';

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

String _$projectsHash() => r'e05d845ba0cc9df757dcf75ec7bed5e1ca7e0ea7';
