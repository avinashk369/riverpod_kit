// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userHash() => r'3c3ddce22b09e415b4531d07a61482e06055f521';

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

abstract class _$User extends BuildlessAutoDisposeAsyncNotifier<String> {
  late final int userId;
  late final String userName;

  FutureOr<String> build({required int userId, required String userName});
}

/// See also [User].
@ProviderFor(User)
const userProvider = UserFamily();

/// See also [User].
class UserFamily extends Family<AsyncValue<String>> {
  /// See also [User].
  const UserFamily();

  /// See also [User].
  UserProvider call({required int userId, required String userName}) {
    return UserProvider(userId: userId, userName: userName);
  }

  @override
  UserProvider getProviderOverride(covariant UserProvider provider) {
    return call(userId: provider.userId, userName: provider.userName);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userProvider';
}

/// See also [User].
class UserProvider extends AutoDisposeAsyncNotifierProviderImpl<User, String> {
  /// See also [User].
  UserProvider({required int userId, required String userName})
    : this._internal(
        () => User()
          ..userId = userId
          ..userName = userName,
        from: userProvider,
        name: r'userProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$userHash,
        dependencies: UserFamily._dependencies,
        allTransitiveDependencies: UserFamily._allTransitiveDependencies,
        userId: userId,
        userName: userName,
      );

  UserProvider._internal(
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
  FutureOr<String> runNotifierBuild(covariant User notifier) {
    return notifier.build(userId: userId, userName: userName);
  }

  @override
  Override overrideWith(User Function() create) {
    return ProviderOverride(
      origin: this,
      override: UserProvider._internal(
        () => create()
          ..userId = userId
          ..userName = userName,
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
  AutoDisposeAsyncNotifierProviderElement<User, String> createElement() {
    return _UserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserProvider &&
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
mixin UserRef on AutoDisposeAsyncNotifierProviderRef<String> {
  /// The parameter `userId` of this provider.
  int get userId;

  /// The parameter `userName` of this provider.
  String get userName;
}

class _UserProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<User, String>
    with UserRef {
  _UserProviderElement(super.provider);

  @override
  int get userId => (origin as UserProvider).userId;
  @override
  String get userName => (origin as UserProvider).userName;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
