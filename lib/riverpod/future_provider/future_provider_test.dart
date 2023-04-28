import 'package:flutter/material.dart';
import 'package:flutter_project/riverpod/future_provider/future_provider.dart';
import 'package:flutter_project/widget/app_debug.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FutureProviderTest extends ConsumerStatefulWidget {
  const FutureProviderTest({Key? key}) : super(key: key);

  static Route get route {
    return MaterialPageRoute(builder: (_) {
      return const FutureProviderTest();
    });
  }

  @override
  ConsumerState<FutureProviderTest> createState() => _FutureProviderTestState();
}

class _FutureProviderTestState extends ConsumerState<FutureProviderTest> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      /// initState中watch不了FutureProvider。
      // ref.watch(configProvider).when(
      //   loading: () => AppDebug.log("future provider loading"),
      //   error: (err, stack) => AppDebug.log("future provider err:$err"),
      //   data: (config) {
      //     AppDebug.log("future provider response:$config");
      //   },
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FutureProvider"),
      ),
      body: ref.watch(configProvider).when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Text('Error: $err'),
            data: (config) {
              AppDebug.log("Future provider response:$config");
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text("FutureProvider value: $config"),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          ref.refresh(configProvider);
                        },
                        child: const Text("refresh provider")),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          ref.refresh(configProvider);
                        },
                        child: const Text("setState")),
                  ],
                ),
              );
            },
          ),
    );
  }
}
