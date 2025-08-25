// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userDataHash() => r'28493f67eb5e941d6e42b98e7bc5c2249b8e7aea';

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

/// See also [userData].
@ProviderFor(userData)
const userDataProvider = UserDataFamily();

/// See also [userData].
class UserDataFamily extends Family<AsyncValue<UserData>> {
  /// See also [userData].
  const UserDataFamily();

  /// See also [userData].
  UserDataProvider call(int userId, String userName) {
    return UserDataProvider(userId, userName);
  }

  @override
  UserDataProvider getProviderOverride(covariant UserDataProvider provider) {
    return call(provider.userId, provider.userName);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userDataProvider';
}

/// See also [userData].
class UserDataProvider extends AutoDisposeFutureProvider<UserData> {
  /// See also [userData].
  UserDataProvider(int userId, String userName)
    : this._internal(
        (ref) => userData(ref as UserDataRef, userId, userName),
        from: userDataProvider,
        name: r'userDataProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$userDataHash,
        dependencies: UserDataFamily._dependencies,
        allTransitiveDependencies: UserDataFamily._allTransitiveDependencies,
        userId: userId,
        userName: userName,
      );

  UserDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
    required this.userName,
  }) : super.internal();

  final int userId;
  final String userName;

  @override
  Override overrideWith(
    FutureOr<UserData> Function(UserDataRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserDataProvider._internal(
        (ref) => create(ref as UserDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
        userName: userName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<UserData> createElement() {
    return _UserDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserDataProvider &&
        other.userId == userId &&
        other.userName == userName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);
    hash = _SystemHash.combine(hash, userName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserDataRef on AutoDisposeFutureProviderRef<UserData> {
  /// The parameter `userId` of this provider.
  int get userId;

  /// The parameter `userName` of this provider.
  String get userName;
}

class _UserDataProviderElement
    extends AutoDisposeFutureProviderElement<UserData>
    with UserDataRef {
  _UserDataProviderElement(super.provider);

  @override
  int get userId => (origin as UserDataProvider).userId;
  @override
  String get userName => (origin as UserDataProvider).userName;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
