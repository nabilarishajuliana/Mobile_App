import 'package:coba/features/dashboard/data/models/dashboard_model.dart';

class DashboardRepository {
  Future<DashboardData> getDashboardData() async {
    await Future.delayed(const Duration(seconds: 1));

    return DashboardData(
      userName:   'Admin Risha',
      lastUpdate: DateTime.now(),
      stats: [
        DashboardStats(title: 'Total Mahasiswa', value: '1,200', subtitle: ''),
        DashboardStats(title: 'Mahasiswa Aktif', value: '550',   subtitle: ''),
        DashboardStats(title: 'Dosen',           value: '650',   subtitle: ''),
        DashboardStats(title: 'Profile',         value: '',      subtitle: ''),
      ],
    );
  }

  Future<DashboardData> refreshDashboard() async => getDashboardData();

  Future<DashboardStats?> getStatByTitle(String title) async {
    final data = await getDashboardData();
    try {
      return data.stats.firstWhere((stat) => stat.title == title);
    } catch (e) {
      return null;
    }
  }
}