import 'package:flutter/material.dart';
import 'package:coba/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';

class MahasiswaAktifCard extends StatelessWidget {
  final MahasiswaAktifModel mahasiswa;
  final VoidCallback? onTap;
  final List<Color>? gradientColors;

  const MahasiswaAktifCard({
    Key? key,
    required this.mahasiswa,
    this.onTap,
    this.gradientColors,
  }) : super(key: key);

  Color _ipkColor(String ipk) {
    final val = double.tryParse(ipk) ?? 0;
    if (val >= 3.5) return Colors.green;
    if (val >= 3.0) return Colors.blue;
    if (val >= 2.5) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    final colors = gradientColors ??
        [
          Theme.of(context).primaryColor,
          Theme.of(context).primaryColor.withOpacity(0.7),
        ];

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color:      colors[0].withOpacity(0.1),
              blurRadius: 10,
              offset:     const Offset(0, 4),
            ),
          ],
          border: Border.all(color: colors[0].withOpacity(0.15), width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Avatar
              Container(
                width: 56, height: 56,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end:   Alignment.bottomRight,
                    colors: colors,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    mahasiswa.nama.substring(0, 1).toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            mahasiswa.nama,
                            style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1, overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        // Badge IPK
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: _ipkColor(mahasiswa.ipk).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: _ipkColor(mahasiswa.ipk).withOpacity(0.3),
                            ),
                          ),
                          child: Text(
                            'IPK ${mahasiswa.ipk}',
                            style: TextStyle(
                              fontSize: 11,
                              color: _ipkColor(mahasiswa.ipk),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    _infoRow(Icons.badge_outlined,
                        'NIM: ${mahasiswa.nim}'),
                    const SizedBox(height: 3),
                    _infoRow(Icons.school_outlined, mahasiswa.jurusan),
                    const SizedBox(height: 3),
                    _infoRow(
                      Icons.calendar_today_outlined,
                      'Semester ${mahasiswa.semester} | Angkatan ${mahasiswa.angkatan}',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 13, color: Colors.grey[600]),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 12, color: Colors.grey[700]),
            maxLines: 1, overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}