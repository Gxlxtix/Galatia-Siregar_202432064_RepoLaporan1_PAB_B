import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class AlatMusik {
  final String nama;
  final String daerah;
  final int jumlahPemain;
  final double rating;
  final bool sudahDipelajari;

  const AlatMusik({
    required this.nama,
    required this.daerah,
    required this.jumlahPemain,
    required this.rating,
    required this.sudahDipelajari,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0F4C5C),
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F9F9),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0F4C5C),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFF2A541),
            foregroundColor: const Color(0xFF0F4C5C),
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      home: const LayarUtama(),
    );
  }
}

class LayarUtama extends StatelessWidget {
  const LayarUtama({super.key});

  @override
  Widget build(BuildContext context) {
    const alat1 = AlatMusik(
      nama: "Angklung",
      daerah: "Jawa Barat",
      jumlahPemain: 20,
      rating: 4.8,
      sudahDipelajari: true,
    );

    const alat2 = AlatMusik(
      nama: "Sasando",
      daerah: "Nusa Tenggara Timur",
      jumlahPemain: 1,
      rating: 4.6,
      sudahDipelajari: false,
    );

    const alat3 = AlatMusik(
      nama: "Gamelan",
      daerah: "Jawa Tengah",
      jumlahPemain: 15,
      rating: 4.9,
      sudahDipelajari: true,
    );

    const alat4 = AlatMusik(
      nama: "Tifa",
      daerah: "Papua",
      jumlahPemain: 4,
      rating: 4.3,
      sudahDipelajari: false,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Alat Musik Nusantara'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                BannerKoleksi(),
                SizedBox(height: 20),
                Text(
                  'Daftar Alat Musik',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F4C5C),
                  ),
                ),
                SizedBox(height: 12),
                KartuAlatMusik(alat: alat1),
                SizedBox(height: 12),
                KartuAlatMusik(alat: alat2),
                SizedBox(height: 12),
                KartuAlatMusik(alat: alat3),
                SizedBox(height: 12),
                KartuAlatMusik(alat: alat4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Custom widget: banner pembuka
class BannerKoleksi extends StatelessWidget {
  const BannerKoleksi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0F4C5C), Color(0xFF2A9D8F)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.music_note,
            size: 48,
            color: Color(0xFFF2A541),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Warisan Musik Nusantara',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Kenali 4 alat musik tradisional dari berbagai daerah',
                  style: TextStyle(fontSize: 13, color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Custom widget: kartu informasi alat musik
class KartuAlatMusik extends StatelessWidget {
  final AlatMusik alat;

  const KartuAlatMusik({super.key, required this.alat});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF1DC),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(
                    Icons.library_music,
                    size: 30,
                    color: Color(0xFFE08E1B),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        alat.nama,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F4C5C),
                        ),
                      ),
                      Text(
                        alat.daerah,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFE6F2F2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Wrap(
                spacing: 16,
                runSpacing: 8,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.groups,
                        size: 18,
                        color: Color(0xFF0F4C5C),
                      ),
                      const SizedBox(width: 4),
                      Text('${alat.jumlahPemain} pemain'),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star, size: 18, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text('${alat.rating}'),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        alat.sudahDipelajari
                            ? Icons.check_circle
                            : Icons.schedule,
                        size: 18,
                        color: alat.sudahDipelajari
                            ? Colors.green
                            : Colors.orange,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        alat.sudahDipelajari
                            ? 'Sudah dipelajari'
                            : 'Belum dipelajari',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  debugPrint("Tombol ${alat.nama} Di Klik");
                },
                child: const Text("Lihat Detail"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
