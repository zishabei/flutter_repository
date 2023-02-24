// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riverpod_provider_demo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

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

String _$PageIndexHash() => r'cbc799902ac51c2e9a7fbb893130034b6bdabb28';

/// See also [PageIndex].
final pageIndexProvider = AutoDisposeNotifierProvider<PageIndex, int>(
  PageIndex.new,
  name: r'pageIndexProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$PageIndexHash,
);
typedef PageIndexRef = AutoDisposeNotifierProviderRef<int>;

abstract class _$PageIndex extends AutoDisposeNotifier<int> {
  @override
  int build();
}

String _$canGoToPreviousPageHash() =>
    r'801fe8182a37cd21ae83bdfccbe36c125b4d14fb';

/// See also [canGoToPreviousPage].
final canGoToPreviousPageProvider = AutoDisposeProvider<bool>(
  canGoToPreviousPage,
  name: r'canGoToPreviousPageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$canGoToPreviousPageHash,
);
typedef CanGoToPreviousPageRef = AutoDisposeProviderRef<bool>;
String _$canGoToNextPageHash() => r'615a5732df9e5b1daf8806106aa617f2d322f350';

/// See also [canGoToNextPage].
final canGoToNextPageProvider = AutoDisposeProvider<bool>(
  canGoToNextPage,
  name: r'canGoToNextPageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$canGoToNextPageHash,
);
typedef CanGoToNextPageRef = AutoDisposeProviderRef<bool>;
