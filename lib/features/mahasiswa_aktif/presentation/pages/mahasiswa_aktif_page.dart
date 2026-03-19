import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:coba/core/constans/app_constants.dart';
import 'package:coba/core/widgets/common_widgets.dart';
import 'package:coba/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';
import 'package:coba/features/mahasiswa_aktif/presentation/providers/mahasiswa_aktif_provider.dart';
import 'package:coba/features/mahasiswa_aktif/presentation/widgets/mahasiswa_aktif_widget.dart';

class MahasiswaAktifPage extends ConsumerWidget {
  const MahasiswaAktifPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mahasiswaAktifNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mahasiswa Aktif'),
        elevation: 0,
        actions: [
          IconButton(
            icon:      const Icon(Icons.refresh_rounded),
            onPressed: () =>
                ref.invalidate(mahasiswaAktifNotifierProvider),
          ),
        ],
      ),
      body: state.when(
        loading: () => const LoadingWidget(),
        error: (error, stack) => CustomErrorWidget(
          message: 'Gagal memuat data: ${error.toString()}',
          onRetry: () =>
              ref.read(mahasiswaAktifNotifierProvider.notifier).refresh(),
        ),
        data: (list) {
          if (list.isEmpty) {
            return const Center(
                child: Text('Tidak ada data mahasiswa aktif'));
          }
          return RefreshIndicator(
            onRefresh: () async =>
                ref.invalidate(mahasiswaAktifNotifierProvider),
            child: ListView.builder(
              padding:
                  const EdgeInsets.all(AppConstants.paddingMedium),
              itemCount: list.length,
              itemBuilder: (context, index) {
                final gradientIndex =
                    index % AppConstants.dashboardGradients.length;
                return MahasiswaAktifCard(
                  mahasiswa:      list[index],
                  gradientColors: AppConstants.dashboardGradients[gradientIndex],
                  onTap: () => _showDetail(context, list[index]),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _showDetail(BuildContext context, MahasiswaAktifModel m) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
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
                width: 40, height: 4,
                decoration: BoxDecoration(
                  color:        Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Detail Post',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _detailRow(context, Icons.tag,     'ID',      '#${m.id}'),
            _detailRow(context, Icons.person,  'User ID', 'User ${m.userId}'),
            _detailRow(context, Icons.title,   'Judul',   m.title),
            _detailRow(context, Icons.article, 'Isi',     m.body),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Theme.of(context).primaryColor),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: TextStyle(
                        fontSize: 12, color: Colors.grey[600])),
                Text(value,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}