import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'riverpod_provider_demo.g.dart';

@riverpod
class PageIndex extends _$PageIndex {
  @override
  int build() {
    return 10;
  }

  void goToPreviousPage() {
    state = state - 1;
  }

  void goToNextPage() {
    state = state + 1;
  }
}

// A provider which computes whether the user is allowed to go to the previous page
@riverpod
bool canGoToPreviousPage(CanGoToPreviousPageRef ref) {
  return ref.watch(pageIndexProvider) != 0;
}

// A provider which computes whether the user is allowed to go to the previous page
@riverpod
bool canGoToNextPage(CanGoToPreviousPageRef ref) {
  return ref.watch(pageIndexProvider) != 10;
}

class PreviousButton extends ConsumerWidget {
  const PreviousButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // We are now watching our new Provider
    // Our widget is no longer calculating whether we can go to the previous page.
    final canGoToPreviousPage = ref.watch(canGoToPreviousPageProvider);

    void goToPreviousPage() {
      ref.read(pageIndexProvider.notifier).goToPreviousPage();
    }

    final canGoToNextPage = ref.watch(canGoToNextPageProvider);

    void goToNextPage() {
      ref.read(pageIndexProvider.notifier).goToNextPage();
    }

    return Row(
      children: [
        ElevatedButton(
          onPressed: canGoToPreviousPage ? goToPreviousPage : null,
          child: const Text('previous'),
        ),
        ElevatedButton(
          onPressed: canGoToNextPage ? goToNextPage : null,
          child: const Text('next'),
        )
      ],
    );
  }
}
