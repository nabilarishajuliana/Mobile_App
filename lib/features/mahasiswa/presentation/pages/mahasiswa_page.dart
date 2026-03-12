import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:coba/core/constans/app_constants.dart';
import 'package:coba/core/widgets/common_widgets.dart';
import 'package:coba/features/mahasiswa/data/models/mahasiswa_model.dart';
import 'package:coba/features/mahasiswa/presentation/providers/mahasiswa_provider.dart';
import 'package:coba/features/mahasiswa/presentation/widgets/mahasiswa_widget.dart';

class MahasiswaPage extends ConsumerWidget {
  const MahasiswaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mahasiswaState = ref.watch(mahasiswaNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Mahasiswa'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () => ref.invalidate(mahasiswaNotifierProvider),
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: mahasiswaState.when(
        loading: () => const LoadingWidget(),
        error: (error, stack) => CustomErrorWidget(
          message: 'Gagal memuat data mahasiswa: ${error.toString()}',
          onRetry: () =>
              ref.read(mahasiswaNotifierProvider.notifier).refresh(),
        ),
        data: (mahasiswaList) {
          if (mahasiswaList.isEmpty) {
            return const Center(child: Text('Tidak ada data mahasiswa'));
          }
          return RefreshIndicator(
            onRefresh: () async =>
                ref.invalidate(mahasiswaNotifierProvider),
            child: ListView.builder(
              padding: const EdgeInsets.all(AppConstants.paddingMedium),
              itemCount: mahasiswaList.length,
              itemBuilder: (context, index) {
                final mahasiswa = mahasiswaList[index];
                final gradientIndex =
                    index % AppConstants.dashboardGradients.length;
                return ModernMahasiswaCard(
                  mahasiswa: mahasiswa,
                  gradientColors:
                      AppConstants.dashboardGradients[gradientIndex],
                  onTap: () => _showDetail(context, mahasiswa),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _showDetail(BuildContext context, MahasiswaModel m) {
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
                width: 40, height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Detail Mahasiswa',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _detailRow(context, Icons.person,          'Nama',     m.nama),
            _detailRow(context, Icons.badge,           'NIM',      m.nim),
            _detailRow(context, Icons.email,           'Email',    m.email),
            _detailRow(context, Icons.school,          'Jurusan',  m.jurusan),
            _detailRow(context, Icons.calendar_today,  'Semester', m.semester),
            _detailRow(context, Icons.check_circle,    'Status',   m.status),
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
              Text(label,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600])),
              Text(value,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500)),
            ],
          ),
        ],
      ),
    );
  }
}