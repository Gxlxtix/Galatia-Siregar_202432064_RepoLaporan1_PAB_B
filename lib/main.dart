import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

// ===================== WARNA TEMA =====================
const Color warnaUtama = Color(0xFF0F4C5C);
const Color warnaAksen = Color(0xFFF2A541);
const Color warnaLatar = Color(0xFFF4F9F9);
const Color warnaChip = Color(0xFFE6F2F2);

// ===================== MODEL DATA =====================
class AlatMusik {
  final String nama;
  final String daerah;
  final String jenis; // cara memainkan: petik / pukul
  final int jumlahPemain; // jumlah pemain umumnya
  final double kesulitan; // skala 1.0 - 5.0
  final bool sudahDipelajari;

  const AlatMusik({
    required this.nama,
    required this.daerah,
    required this.jenis,
    required this.jumlahPemain,
    required this.kesulitan,
    required this.sudahDipelajari,
  });
}

// ===================== MyApp (satu-satunya MaterialApp) =====================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        colorScheme: ColorScheme.fromSeed(seedColor: warnaUtama),
        scaffoldBackgroundColor: warnaLatar,
        appBarTheme: const AppBarTheme(
          backgroundColor: warnaUtama,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: warnaAksen,
            foregroundColor: warnaUtama,
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

// ===================== Halaman Utama (Scaffold) =====================
class LayarUtama extends StatelessWidget {
  const LayarUtama({super.key});

  @override
  Widget build(BuildContext context) {
    const alat1 = AlatMusik(
      nama: "Sasando",
      daerah: "Nusa Tenggara Timur",
      jenis: "Petik",
      jumlahPemain: 1,
      kesulitan: 4.0,
      sudahDipelajari: true,
    );

    const alat2 = AlatMusik(
      nama: "Kolintang",
      daerah: "Sulawesi Utara",
      jenis: "Pukul",
      jumlahPemain: 6,
      kesulitan: 3.5,
      sudahDipelajari: false,
    );

    const alat3 = AlatMusik(
      nama: "Sape",
      daerah: "Kalimantan Timur",
      jenis: "Petik",
      jumlahPemain: 2,
      kesulitan: 3.0,
      sudahDipelajari: true,
    );

    const alat4 = AlatMusik(
      nama: "Tifa",
      daerah: "Papua",
      jenis: "Pukul",
      jumlahPemain: 4,
      kesulitan: 2.5,
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
                    color: warnaUtama,
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

// ===================== Custom Widget 1: Banner =====================
class BannerKoleksi extends StatelessWidget {
  const BannerKoleksi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [warnaUtama, Color(0xFF2A9D8F)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: const [
          Icon(Icons.music_note, size: 48, color: warnaAksen),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  '4 alat musik tradisional dari 4 daerah di Indonesia',
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

// ===================== Custom Widget 2: Kartu Alat Musik =====================
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
            // Bagian atas: ikon + nama + daerah
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
                          color: warnaUtama,
                        ),
                      ),
                      Text(
                        'Asal: ${alat.daerah}',
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

            // Bagian tengah: info singkat
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: warnaChip,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Wrap(
                spacing: 16,
                runSpacing: 8,
                children: [
                  InfoChip(
                    ikon: Icons.back_hand,
                    warna: warnaUtama,
                    teks: 'Jenis: ${alat.jenis}',
                  ),
                  InfoChip(
                    ikon: Icons.groups,
                    warna: warnaUtama,
                    teks: '${alat.jumlahPemain} pemain',
                  ),
                  InfoChip(
                    ikon: Icons.trending_up,
                    warna: Colors.deepOrange,
                    teks: 'Kesulitan ${alat.kesulitan}/5',
                  ),
                  InfoChip(
                    ikon: alat.sudahDipelajari
                        ? Icons.check_circle
                        : Icons.schedule,
                    warna: alat.sudahDipelajari ? Colors.green : Colors.orange,
                    teks: alat.sudahDipelajari
                        ? 'Sudah dipelajari'
                        : 'Belum dipelajari',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Bagian bawah: tombol
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

// ===================== Custom Widget 3: Info Kecil (ikon + teks) =====================
class InfoChip extends StatelessWidget {
  final IconData ikon;
  final Color warna;
  final String teks;

  const InfoChip({
    super.key,
    required this.ikon,
    required this.warna,
    required this.teks,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(ikon, size: 18, color: warna),
        const SizedBox(width: 4),
        Text(teks),
      ],
    );
  }
}
