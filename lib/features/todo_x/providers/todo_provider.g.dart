// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todoHash() => r'375c1db71422f742b3075fc1e8fd0696c1b42976';

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

/// See also [todo].
@ProviderFor(todo)
const todoProvider = TodoFamily();

/// See also [todo].
class TodoFamily extends Family<Todo> {
  /// See also [todo].
  const TodoFamily();

  /// See also [todo].
  TodoProvider call(String todoId) {
    return TodoProvider(todoId);
  }

  @override
  TodoProvider getProviderOverride(covariant TodoProvider provider) {
    return call(provider.todoId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'todoProvider';
}

/// See also [todo].
class TodoProvider extends AutoDisposeProvider<Todo> {
  /// See also [todo].
  TodoProvider(String todoId)
    : this._internal(
        (ref) => todo(ref as TodoRef, todoId),
        from: todoProvider,
        name: r'todoProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$todoHash,
        dependencies: TodoFamily._dependencies,
        allTransitiveDependencies: TodoFamily._allTransitiveDependencies,
        todoId: todoId,
      );

  TodoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.todoId,
  }) : super.internal();

  final String todoId;

  @override
  Override overrideWith(Todo Function(TodoRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: TodoProvider._internal(
        (ref) => create(ref as TodoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        todoId: todoId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Todo> createElement() {
    return _TodoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TodoProvider && other.todoId == todoId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, todoId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TodoRef on AutoDisposeProviderRef<Todo> {
  /// The parameter `todoId` of this provider.
  String get todoId;
}

class _TodoProviderElement extends AutoDisposeProviderElement<Todo>
    with TodoRef {
  _TodoProviderElement(super.provider);

  @override
  String get todoId => (origin as TodoProvider).todoId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
