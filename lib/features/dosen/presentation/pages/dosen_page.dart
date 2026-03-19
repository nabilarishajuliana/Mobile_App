import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:coba/core/widgets/common_widgets.dart';
import 'package:coba/features/dosen/data/models/dosen_model.dart';
import 'package:coba/features/dosen/presentation/providers/dosen_provider.dart';
import 'package:coba/features/dosen/presentation/widgets/dosen_widget.dart';

class DosenPage extends ConsumerWidget {
  const DosenPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dosenState = ref.watch(dosenNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Dosen'),
        elevation: 0,
        actions: [
          IconButton(
            icon:      const Icon(Icons.refresh_rounded),
            onPressed: () => ref.invalidate(dosenNotifierProvider),
            tooltip:   'Refresh',
          ),
        ],
      ),
      body: dosenState.when(
        loading: () => const LoadingWidget(),
        error: (error, stack) => CustomErrorWidget(
          message: 'Gagal memuat data dosen: ${error.toString()}',
          onRetry: () => ref.read(dosenNotifierProvider.notifier).refresh(),
        ),
        data: (dosenList) {
          return DosenListView(
            dosenList:     dosenList,
            useModernCard: true,
            onRefresh:     () => ref.invalidate(dosenNotifierProvider),
          );
        },
      ),
    );
  }
}