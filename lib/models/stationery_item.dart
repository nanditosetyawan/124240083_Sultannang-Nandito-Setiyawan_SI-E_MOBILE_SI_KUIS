// ============================================================
// FILE: food_item.dart
// Fungsi: Model data makanan (blueprint/cetakan objek makanan)
// Dipakai di: halaman_beranda.dart, halaman_detail.dart
// ============================================================

// ════════════════════════════════════════════════════════════════
// CLASS: FoodItem (Model Makanan)
// Fungsi: Menyimpan semua data satu makanan (nama, harga, porsi, dll)
// Cara pakai: FoodItem nasiGoreng = FoodItem(name: 'Nasi Goreng', ...)
// ════════════════════════════════════════════════════════════════
class FoodItem {
  // ─── DEKLARASI: Properti/atribut data makanan ─────────────
  String name;        // ← nama makanan (tidak bisa diubah = final)
  String description; // ← deskripsi makanan (tidak bisa diubah = final)
  String imageUrl;    // ← URL gambar makanan (tidak bisa diubah = final)
  int stock;             // ← jumlah porsi (BISA diubah, tidak pakai final)
  final int price;          // ← harga per porsi dalam rupiah (tidak bisa diubah = final)

  // ─── CONSTRUCTOR: Cara membuat objek FoodItem baru ────────
  FoodItem({
    required this.name,        // ← required = wajib diisi saat membuat objek
    required this.description,
    required this.imageUrl,
    required this.stock,
    required this.price,
  });

  // ─── GETTER: Hitung total harga (quantity × price) ────────
  // Cara pakai: makanan.totalHarga  (hasilnya int)
  int get totalHarga => stock * price;

  // ─── GETTER: Format harga per porsi jadi "Rp 15.000" ──────
  // Cara pakai: makanan.hargaFormatted  (hasilnya String)
  String get hargaFormatted => 'Rp ${formatHarga(price)} / porsi';

  // ─── GETTER: Format total harga jadi "Rp 30.000" ──────────
  // Cara pakai: makanan.totalFormatted  (hasilnya String)
  String get totalFormatted => 'Rp ${formatHarga(totalHarga)}';

  // ════════════════════════════════════════════════════════════
  // DATA CONTOH: Daftar makanan yang ditampilkan di app
  // EDIT DI SINI untuk ubah/tambah/hapus menu makanan
  // ════════════════════════════════════════════════════════════
  static final List<FoodItem> daftarMakanan = [
    // ─── ITEM 1 ───────────────────────────────────────────────
    FoodItem(
      name: 'Pulpen',
      description: 'Pulpen tinta hitam, nyaman digenggam, ujung 0.5 mm.',
      imageUrl:
          'https://images.unsplash.com/photo-1523726491678-bf852e717f6a?w=800&q=80&auto=format&fit=crop',
      stock: 2,
      price: 3000,               // ← EDIT: harga dalam rupiah (tanpa titik)
    ),
    // ─── ITEM 2 ───────────────────────────────────────────────
    FoodItem(
        name: 'Pensil',
      description: 'Pensil kayu 2B dengan penghapus di ujungnya.',
      imageUrl:
          'https://images.unsplash.com/photo-1598620617377-3bfb505b4384?w=800&q=80&auto=format&fit=crop',
      stock: 3,
      price: 4000,
    ),
    // ─── ITEM 3 ───────────────────────────────────────────────
    FoodItem(
     name: 'Buku Tulis',
      description: 'Buku tulis 38 lembar, garis satu, kertas tebal.',
      imageUrl:
          'https://images.unsplash.com/photo-1573848855919-9abecc93e456?w=800&q=80&auto=format&fit=crop',
      stock: 0,
      price: 5500,
    ),
    // ─── ITEM 4 ───────────────────────────────────────────────
    FoodItem(
        name: 'Penghapus',
      description: 'Penghapus karet lembut, tidak meninggalkan bekas.',
      imageUrl:
          'https://images.unsplash.com/photo-1749451578131-0adb36858f4f?w=800&q=80&auto=format&fit=crop',
      stock: 0,
      price: 2000,
    ),
    // ─── ITEM 5 ───────────────────────────────────────────────
    FoodItem(
       name: 'Penggaris',
      description: 'Penggaris plastik transparan panjang 30 cm.',
      imageUrl:
          'https://images.unsplash.com/photo-1683127983818-208f46227c24?w=800&q=80&auto=format&fit=crop',
      stock: 0,
      price: 3500,
    ),
    // ─── TAMBAH ITEM BARU: Copy blok di atas, paste di sini ──
  ];
}

// ─── FUNGSI HELPER: Format angka jadi harga dengan titik ──────
// Contoh: 15000 → "15.000"
// Cara pakai: formatHarga(15000) → hasilnya String "15.000"
String formatHarga(int nilai) {
  return nilai.toString().replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+$)'),
        (m) => '${m[1]}.',
      );
}