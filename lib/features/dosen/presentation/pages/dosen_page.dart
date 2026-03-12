import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:coba/core/constans/app_constants.dart';
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
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () => ref.invalidate(dosenNotifierProvider),
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: dosenState.when(
        loading: () => const LoadingWidget(),
        error: (error, stack) => CustomErrorWidget(
          message: 'Gagal memuat data dosen: ${error.toString()}',
          onRetry: () {
            ref.read(dosenNotifierProvider.notifier).refresh();
          },
        ),
        data: (dosenList) {
          if (dosenList.isEmpty) {
            return const Center(child: Text('Tidak ada data dosen'));
          }
          return RefreshIndicator(
            onRefresh: () async => ref.invalidate(dosenNotifierProvider),
            child: ListView.builder(
              padding: const EdgeInsets.all(AppConstants.paddingMedium),
              itemCount: dosenList.length,
              itemBuilder: (context, index) {
                final dosen = dosenList[index];
                final gradientIndex =
                    index % AppConstants.dashboardGradients.length;
                return ModernDosenCard(
                  dosen: dosen,
                  gradientColors:
                      AppConstants.dashboardGradients[gradientIndex],
                  onTap: () => _showDetail(context, dosen),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _showDetail(BuildContext context, DosenModel dosen) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Detail Dosen',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _detailRow(context, Icons.person,  'Nama',    dosen.nama),
            _detailRow(context, Icons.badge,   'NIP',     dosen.nip),
            _detailRow(context, Icons.email,   'Email',   dosen.email),
            _detailRow(context, Icons.school,  'Jurusan', dosen.jurusan),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _detailRow(
      BuildContext context, IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Theme.of(context).primaryColor),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
              Text(
                value,
                style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
