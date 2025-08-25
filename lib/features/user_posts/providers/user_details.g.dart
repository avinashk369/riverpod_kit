// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userDetailsHash() => r'd111cb5c4c76ab8396d3e10b35c35e01d5049b27';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [userDetails].
@ProviderFor(userDetails)
const userDetailsProvider = UserDetailsFamily();

/// See also [userDetails].
class UserDetailsFamily extends Family<AsyncValue<String>> {
  /// See also [userDetails].
  const UserDetailsFamily();

  /// See also [userDetails].
  UserDetailsProvider call(int userId) {
    return UserDetailsProvider(userId);
  }

  @override
  UserDetailsProvider getProviderOverride(
    covariant UserDetailsProvider provider,
  ) {
    return call(provider.userId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userDetailsProvider';
}

/// See also [userDetails].
class UserDetailsProvider extends AutoDisposeFutureProvider<String> {
  /// See also [userDetails].
  UserDetailsProvider(int userId)
    : this._internal(
        (ref) => userDetails(ref as UserDetailsRef, userId),
        from: userDetailsProvider,
        name: r'userDetailsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$userDetailsHash,
        dependencies: UserDetailsFamily._dependencies,
        allTransitiveDependencies: UserDetailsFamily._allTransitiveDependencies,
        userId: userId,
      );

  UserDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final int userId;

  @override
  Override overrideWith(
    FutureOr<String> Function(UserDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserDetailsProvider._internal(
        (ref) => create(ref as UserDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _UserDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserDetailsProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserDetailsRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `userId` of this provider.
  int get userId;
}

class _UserDetailsProviderElement
    extends AutoDisposeFutureProviderElement<String>
    with UserDetailsRef {
  _UserDetailsProviderElement(super.provider);

  @override
  int get userId => (origin as UserDetailsProvider).userId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
