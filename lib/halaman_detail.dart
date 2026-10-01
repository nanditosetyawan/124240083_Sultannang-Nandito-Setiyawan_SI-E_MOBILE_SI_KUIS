
import 'package:flutter/material.dart';
import 'models/stationery_item.dart';

class HalamanDetail extends StatefulWidget {
  final FoodItem makanan; // ← VARIABEL: data item yang dikirim dari beranda

  const HalamanDetail({super.key, required this.makanan});
  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  // VARIABEL: _porsiSaatIni → jumlah porsi yang diinput user
  late int _porsiSaatIni;
  // VARIABEL: _kontrolerPorsi → mengontrol isi TextField angka
  late TextEditingController _kontrolerPorsi;

  @override
  void initState() {
    super.initState();
    _porsiSaatIni = widget.makanan.stock;
    _kontrolerPorsi = TextEditingController(
      text: _porsiSaatIni == 0 ? '' : _porsiSaatIni.toString(),
    );
  }

  @override
  void dispose() {
    _kontrolerPorsi.dispose();
    super.dispose();
  }

  // VARIABEL: _totalHarga → otomatis dihitung dari porsi × harga satuan
  int get _totalHarga => _porsiSaatIni * widget.makanan.price;

  // Fungsi simpan: validasi → snackbar → kirim porsi kembali ke beranda
  void _simpanPemesanan() {
    if (_porsiSaatIni <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Masukkan jumlah harga minimal 1!'), backgroundColor: Colors.red),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Update Data ${widget.makanan.name} disimpan!'), backgroundColor: Color.fromARGB(255, 72, 57, 209)),
    );
    Navigator.pop(context, _porsiSaatIni); // ← kirim porsi kembali ke halaman sebelumnya
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F4EE),










     
      appBar: AppBar(
        title: Text(widget.makanan.name,       // ← VARIABEL: judul = nama item
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Color.fromARGB(255, 57, 121, 224),    // ← VARIABEL: warna AppBar
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
    
      // ═════════════════════════════════════════════════════










      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [










   
            ClipRRect(
              borderRadius: BorderRadius.circular(16), // ← VARIABEL: sudut gambar
              child: Image.network(
                widget.makanan.imageUrl,                // ← VARIABEL: URL gambar
                width: double.infinity,
                height: 220,                           // ← VARIABEL: tinggi gambar
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: double.infinity, height: 220,
                  color: Colors.grey[200],
                  child: Icon(Icons.restaurant, size: 80, color: Colors.grey),
                ),
              ),
            ),









            SizedBox(height: 20),










        
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(widget.makanan.name,          // ← VARIABEL: nama item
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87)),
                SizedBox(height: 4),
Text(widget.makanan.hargaFormatted, // ← VARIABEL: harga satuan formatted
                  style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 57, 224, 65), fontWeight: FontWeight.w600)),
              ]
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                
                SizedBox(height: 12),
                Text(widget.makanan.description,   // ← VARIABEL: deskripsi item
                  style: TextStyle(fontSize: 14, color: Colors.grey[700], height: 1.5)),
              ],
            ),
            // ✂️ AKHIR COPAS JUDUL, HARGA, & DESKRIPSI SAMPAI SINI
            // ════════════════════════════════════════════════










            SizedBox(height: 24),










    
            TextField(
              controller: _kontrolerPorsi,      // ← VARIABEL: controller input
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Harga',     // ← VARIABEL: placeholder
                labelStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.currency_yen_rounded, color: Color.fromARGB(255, 54, 59, 60)),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color.fromARGB(255, 57, 57, 224), width: 2),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: (nilai) {
                setState(() {
                  _porsiSaatIni = int.tryParse(nilai) ?? 0;
                  // ↑ saat user ketik angka → _porsiSaatIni berubah
                  //   → _totalHarga otomatis ikut berubah (karena getter)
                  //   → setState membuat tampilan rebuild
                });
              },
            ),
            // ✂️ AKHIR COPAS FIELD INPUT PORSI SAMPAI SINI
            // ════════════════════════════════════════════════










            SizedBox(height: 20),










          
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
                Text(
                  _porsiSaatIni > 0 ? 'Rp ${formatHarga(_totalHarga)}' : 'Rp 0',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
                ),
              ],
            ),
            //









            SizedBox(height: 30),










            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _simpanPemesanan,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 85, 102, 213), // ← VARIABEL: warna tombol
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.save),          // ← VARIABEL: ikon tombol
                    SizedBox(width: 8),
                    Text('Simpan',            // ← VARIABEL: teks tombol
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            // ✂️ AKHIR COPAS TOMBOL SIMPAN SAMPAI SINI
            // ════════════════════════════════════════════════










          ],
        ),
      ),
    );
  }
}
