import 'package:flutter/material.dart';
import 'package:coba/features/mahasiswa/data/models/mahasiswa_model.dart';

class ModernMahasiswaCard extends StatefulWidget {
  final MahasiswaModel mahasiswa;
  final VoidCallback? onTap;
  final List<Color>? gradientColors;

  const ModernMahasiswaCard({
    Key? key,
    required this.mahasiswa,
    this.onTap,
    this.gradientColors,
  }) : super(key: key);

  @override
  State<ModernMahasiswaCard> createState() => _ModernMahasiswaCardState();
}

class _ModernMahasiswaCardState extends State<ModernMahasiswaCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.97).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'aktif': return Colors.green;
      case 'lulus': return Colors.blue;
      case 'cuti':  return Colors.orange;
      default:      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = widget.gradientColors ??
        [
          Theme.of(context).primaryColor,
          Theme.of(context).primaryColor.withOpacity(0.7),
        ];

    return GestureDetector(
      onTapDown:  (_) => _controller.forward(),
      onTapUp:    (_) { _controller.reverse(); widget.onTap?.call(); },
      onTapCancel: () => _controller.reverse(),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end:   Alignment.bottomRight,
              colors: [Colors.white, colors[0].withOpacity(0.05)],
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color:      colors[0].withOpacity(0.1),
                blurRadius: 10,
                offset:     const Offset(0, 4),
              ),
            ],
            border: Border.all(color: colors[0].withOpacity(0.1), width: 1),
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
                    boxShadow: [
                      BoxShadow(
                        color:      colors[0].withOpacity(0.3),
                        blurRadius: 8,
                        offset:     const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      widget.mahasiswa.nama.substring(0, 1).toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),

                // Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              widget.mahasiswa.nama,
                              style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold, letterSpacing: -0.3,
                              ),
                              maxLines: 1, overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: _statusColor(widget.mahasiswa.status).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: _statusColor(widget.mahasiswa.status).withOpacity(0.3),
                              ),
                            ),
                            child: Text(
                              widget.mahasiswa.status,
                              style: TextStyle(
                                fontSize: 11,
                                color: _statusColor(widget.mahasiswa.status),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      _infoRow(Icons.badge_outlined,        'NIM: ${widget.mahasiswa.nim}'),
                      const SizedBox(height: 3),
                      _infoRow(Icons.school_outlined,       widget.mahasiswa.jurusan),
                      const SizedBox(height: 3),
                      _infoRow(Icons.calendar_today_outlined, 'Semester ${widget.mahasiswa.semester}'),
                    ],
                  ),
                ),

                // Panah
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color:        colors[0].withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.arrow_forward_ios_rounded, size: 14, color: colors[0]),
                ),
              ],
            ),
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