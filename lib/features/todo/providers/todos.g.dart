// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todoHash() => r'5e4977454811e05f28a773f39734b8bcf5b37a0a';

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
  TodoProvider call(int todoId) {
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
  TodoProvider(int todoId)
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

  final int todoId;

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
  int get todoId;
}

class _TodoProviderElement extends AutoDisposeProviderElement<Todo>
    with TodoRef {
  _TodoProviderElement(super.provider);

  @override
  int get todoId => (origin as TodoProvider).todoId;
}

String _$todosHash() => r'1bea9a0cb23d9a60504b711b68ceb1530bacf06b';

/// See also [Todos].
@ProviderFor(Todos)
final todosProvider =
    AutoDisposeAsyncNotifierProvider<Todos, List<Todo>>.internal(
      Todos.new,
      name: r'todosProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$todosHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$Todos = AutoDisposeAsyncNotifier<List<Todo>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
