NAMA : AGUNG CANDRA SAPUTRA

NPM: 2352011272

KELAS: TIF RP CNS B

JAWABAN TEORI
SOAL
1. Jelaskan bagaimana state management dengan Cubit dapat membantu dalam pengelolaan transaksi yang memiliki logika diskon dinamis.

JAWAB: State management dengan Cubit membantu pengelolaan transaksi yang memiliki logika diskon dinamis karena seluruh proses perhitungan harga, jumlah pesanan, dan aturan diskon disimpan dalam satu sumber state yang konsisten. Cubit memisahkan logika bisnis dari tampilan sehingga aturan diskon (misalnya diskon per item, diskon berdasarkan total belanja, atau promo tertentu) cukup dibuat satu kali di fungsi Cubit.

Setiap perubahan seperti menambah pesanan, menghapus, atau mengubah jumlah akan menghasilkan state baru, dan widget yang mendengarkan perubahan (melalui BlocBuilder) otomatis memperbarui tampilan total harga tanpa perlu setState().

Dengan cara ini, logika diskon yang kompleks dapat dikelola secara terpusat, reaktif, dan mudah dipelihara sehingga pengelolaan transaksi menjadi lebih akurat, konsisten, dan efisien.
2. Apa perbedaan antara diskon per item dan diskon total transaksi? Berikan contoh penerapannya dalam aplikasi kasir.

JAWAB: Diskon per item adalah diskon yang diterapkan pada setiap produk/menu secara individual.
Contoh:

Harga asli Es Teh = Rp8.000

Diskon 20% → harga setelah diskon = Rp6.400
Jika pelanggan membeli 3 gelas, totalnya menjadi: 3 × Rp6.400 = Rp19.200.

Diskon total transaksi adalah diskon yang diterapkan pada subtotal seluruh pesanan, biasanya memiliki syarat tertentu.
Contoh:

Subtotal seluruh pesanan = Rp120.000

Aturan kasir: “Diskon 10% jika total belanja > Rp100.000”

Diskon total = 10% × Rp120.000 = Rp12.000

Total akhir = Rp108.000

Jadi, diskon per item terjadi di level produk, sedangkan diskon total terjadi di level keseluruhan keranjang belanja.

3. Jelaskan manfaat penggunaan widget Stack pada tampilan kategori menu di aplikasi Flutter.

JAWAB: Widget Stack bermanfaat dalam tampilan kategori menu karena memungkinkan penempatan beberapa elemen UI secara bertumpuk (overlapping). Dengan Stack, kita dapat menempatkan background dekoratif seperti gradient biru atau ilustrasi pada layer bawah, lalu meletakkan judul kategori dan deretan pilihan kategori pada layer atasnya.

Stack juga memberi fleksibilitas dalam penempatan widget melalui Positioned, sehingga tampilan kategori dapat dirancang lebih modern dan estetik dibandingkan hanya menggunakan Column atau Row.

Selain itu, Stack membantu memisahkan elemen dekoratif dan elemen interaktif, sehingga tampilan kategori menjadi lebih rapi, fleksibel, dan mudah diatur sesuai kebutuhan desain aplikasi kasir.
4. 
5. 
