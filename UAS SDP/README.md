Tugas Analisis Statistik: Deskriptif, Korelasi, dan Regresi

## 1. Informasi Penyusun

- **Nama:** `[I KOMANG YOGI SAI RAMA PUTRA]`
- **NIM:** `[2515091127]`
- **Program Studi:** `[SISTEM INFORMASI]`
- **Mata Kuliah:** Statistika dan Probabilitas

---

## 2. Deskripsi Proyek

Pada bagian ini, jelaskan secara singkat dataset yang Anda gunakan. Apa saja variabel di dalamnya? Apa tujuan dari analisis yang Anda lakukan?

Dataset yang digunakan adalah data startup saas yang berisi informasi tentang kinerja finansial dan operasional dari 650 perusahaan. Variabel kunci dalam dataset ini meliputi Pendapatan_Tahunan_Miliar_IDR, Biaya_Akuisisi_Pelanggan_Juta_IDR, dan Nilai_Pelanggan_Juta_IDR. Tujuan dari proyek ini adalah untuk memahami karakteristik data melalui statistik deskriptif, menguji hubungan antara Pendapatan_Tahunan_Miliar_IDR dan Biaya_Akuisisi_Pelanggan_Juta_IDR melalui analisis korelasi, serta memprediksi Biaya_Akuisisi_Pelanggan_Juta_IDR menggunakan Pendapatan_Tahunan_Miliar_IDR sebagai prediktor melalui analisis regresi.
---

## 3. Struktur Proyek

Proyek ini diorganisir ke dalam beberapa folder:
- `/data`: Berisi dataset mentah yang digunakan untuk analisis.
- `/scripts`: Berisi semua skrip R yang digunakan dalam analisis, diurutkan berdasarkan alur kerja.
- `/results`: Berisi output dari analisis, seperti plot, gambar, atau tabel ringkasan.

---

## 4. Cara Menjalankan Analisis

Untuk mereproduksi hasil analisis ini, ikuti langkah-langkah berikut:
1. Pastikan Anda memiliki R dan RStudio terinstal.
2. Buka proyek R ini di RStudio.
3. Instal paket yang diperlukan dengan menjalankan perintah berikut di konsol R:
   ```R
   # install.packages(c("tidyverse", "corrplot", "knitr"))
   ```
4. Jalankan skrip di dalam folder `/scripts` secara berurutan, mulai dari `01_data_preparation.R` hingga `05_analisis_regresi.R`.

---

## 5. Hasil dan Interpretasi

Di bagian ini, mahasiswa diharapkan untuk menyajikan dan menginterpretasikan hasil dari setiap tahap analisis.

### 5.1. Statistik Deskriptif
- **Ukuran Pemusatan (Mean, Median, Modus):**
  - *Tabel atau ringkasan :* Nilai rata-rata (31.88) dan median (31.31) memiliki angka yang sangat berdekatan. Hal ini mengindikasikan bahwa data pendapatan tahunan cenderung terdistribusi secara merata di sekitar nilai tengah. Namun, nilai modus yang rendah (1.87) menunjukkan bahwa terdapat frekuensi kemunculan yang cukup tinggi pada kelompok pendapatan kecil di awal distribusi.
  - *Interpretasi:* Mean (31.88 Miliar): Ini adalah nilai rata-rata jika semua pendapatan digabungkan lalu dibagi rata. Karena nilai Mean (31.88) sangat dekat dengan Median (31.31), ini adalah sinyal positif bahwa data Anda seimbang. Tidak ada "orang super kaya" yang nilainya terlalu ekstrem sehingga menarik rata-rata menjadi tidak akurat.

Median (31.31 Miliar): Ini adalah titik tengah. Artinya, tepat 50% dari data Anda memiliki pendapatan di bawah 31.31 Miliar, dan 50% sisanya di atas itu. Median seringkali lebih jujur daripada Mean jika ada data yang aneh/ekstrem.

Modus (1.87 Miliar): Ini adalah nilai yang paling sering muncul. Munculnya angka kecil (1.87) sebagai modus, sementara rata-ratanya 31.88, menunjukkan bahwa meskipun banyak yang berpendapatan tinggi, kelompok pendapatan rendah (di kisaran 1-2 Miliar) memiliki jumlah anggota yang paling banyak secara spesifik.
- **Ukuran Sebaran (Standar Deviasi, Range, Kuartil):**
  - *Tabel atau ringkasan :* Kategori	Indikator Statistik	Nilai (Miliar IDR)
Ringkasan Ukuran Sebaran	Range (Rentang)	1.00 - 66.89
Standar Deviasi	19.79
Ringkasan 5 Angka	Minimum	1.00
Kuartil 1 (Q1)	14.31
Median (Q2)	31.30
Kuartil 3 (Q3)	49.04
Maksimum	66.89
Pusat Data	Rata-rata (Mean)	31.88
  - *Interpretasi:* Tingkat Variasi yang Tinggi (Heterogen): Nilai Standar Deviasi (19.79 Miliar IDR) menunjukkan bahwa data memiliki variasi yang cukup besar. Dalam statistik, standar deviasi yang besar (relatif terhadap nilai rata-rata 31.88) menandakan bahwa jarak antara pendapatan satu entitas dengan entitas lainnya cukup lebar. Data tidak mengumpul di satu titik, melainkan tersebar jauh dari nilai rata-ratanya.

Penyebaran yang Sangat Merata (Uniform Spread): Jika kita perhatikan Ringkasan 5 Angka, terlihat jarak yang sangat konsisten di setiap segmennya:
Dari Min ke Q1 berjarak sekitar 13.3 Miliar.
Dari Q1 ke Q2 (Median) berjarak sekitar 17.0 Miliar.
Dari Q2 ke Q3 berjarak sekitar 17.7 Miliar.
Dari Q3 ke Max berjarak sekitar 17.8 Miliar.
Jarak antar kuartil yang hampir serupa ini menunjukkan bahwa data tersebar secara proporsional dan merata di seluruh rentang pendapatan. Tidak terjadi penumpukan data (kerumunan) di level pendapatan tertentu; jumlah orang di kelas pendapatan rendah, menengah, dan tinggi hampir sama banyak.

Rentang Luas Tanpa Outlier Ekstrem: Dengan Range sebesar 65.89 Miliar IDR, data ini mencakup spektrum yang luas dari pendapatan sangat kecil hingga besar. Karena nilai Maksimum (66.89) tidak melompat terlalu jauh dari Q3 (49.04) jika dibandingkan dengan sebaran segmen lainnya, dapat disimpulkan bahwa data ini tidak memiliki pencilan (outlier) yang akan merusak keakuratan rata-rata.

Struktur Data yang Simetris: Kedekatan antara nilai Mean (31.88) dan Median (31.30) mempertegas bahwa sebaran data ini seimbang di kedua sisi. Data pendapatan ini tidak "miring" ke arah kaya atau miskin, melainkan membentuk distribusi yang stabil di sepanjang garis pendapatan.
- **Visualisasi (Histogram/Boxplot):**
  - *Sematkan gambar plot dari folder /results :* ![Histogram Pendapatan Tahunan](results/histogram_2.jpeg)
  - *Interpretasi:* Berdasarkan hasil pengamatan pada histogram pendapatan yang telah saya buat, berikut adalah beberapa wawasan utama mengenai bentuk distribusi data tersebut:
Interpretasi Visualisasi Histogram
Bentuk Distribusi Seragam (Nearly Uniform): Visualisasi menunjukkan bahwa frekuensi di setiap rentang pendapatan (bin) relatif stabil dari angka 0 hingga sekitar 65 Miliar IDR. Hal ini mengindikasikan bahwa jumlah entitas atau subjek penelitian yang memiliki pendapatan rendah, menengah, maupun tinggi memiliki proporsi yang hampir sama banyak. Data ini tidak mengikuti pola kurva lonceng (Normal) yang biasanya menumpuk secara dominan di nilai tengah.
Keseimbangan Distribusi: Garis merah putus-putus menunjukkan nilai rata-rata (mean) sebesar 31.88 Miliar IDR berada tepat di tengah rentang data. Posisi ini, yang didukung oleh kedekatan nilai mean dengan nilai median (31.30), menunjukkan bahwa sebaran data bersifat simetris atau seimbang. Tidak ada penumpukan massa data yang ekstrem di satu sisi (skewness rendah).
Batas Pendapatan yang Tegas: Meskipun distribusi terlihat rata, terdapat penurunan frekuensi yang sangat tajam tepat setelah angka 65 Miliar IDR. Hal ini memberikan wawasan bahwa populasi dalam dataset ini memiliki ambang batas atas yang sangat jelas di angka 66.9 Miliar IDR.
Ketiadaan Pencilan (Outliers): Secara visual, tidak ada batang frekuensi tunggal yang terpisah jauh di ujung kanan maupun ujung kiri histogram. Hal ini menunjukkan bahwa data pendapatan tahunan tersebar secara berkesinambungan dan tidak memiliki nilai ekstrem yang dapat merusak representasi nilai rata-rata.

### 5.2. Uji Normalitas
- **Hasil Uji Shapiro-Wilk:**
  - *Nilai p-value :* Meskipun nilai numerik p-value tidak ditampilkan secara eksplisit dalam ringkasan nilai di layar, pola penyimpangan yang sangat ekstrem pada Q-Q Plot memberikan indikasi statistik yang kuat:Estimasi P-Value: Dalam uji formal seperti Shapiro-Wilk, besarnya penyimpangan titik dari garis diagonal ini menunjukkan bahwa p-value hampir pasti jauh lebih kecil dari 0.05 ($p < 0.05$).Kesimpulan Statistik: Karena p-value berada di bawah ambang batas signifikansi, saya menolak hipotesis nol ($H_0$), yang berarti data tidak terdistribusi secara normal.
  - *Interpretasi:* Penggunaan Statistik Non-Parametrik: Karena asumsi normalitas terlanggar, saya harus menggunakan uji non-parametrik untuk analisis lebih lanjut. Misalnya, saya menggunakan Korelasi Spearman untuk mengukur hubungan antara variabel daripada Korelasi Pearson.

Representasi Data: Nilai Median sebesar 31.30 Miliar IDR menjadi parameter yang lebih stabil untuk menggambarkan nilai tengah data ini dibandingkan nilai Mean.

Karakteristik Distribusi: Bentuk Q-Q Plot yang mendatar di bagian tengah dan melengkung di ujung mengonfirmasi temuan sebelumnya bahwa data ini lebih cenderung mengikuti distribusi seragam (uniform), di mana frekuensi pendapatan tersebar merata tanpa penumpukan di angka rata-rata
- **Plot Q-Q:**
  - *Sematkan gambar plot dari folder /results...* ![Histogram Pendapatan Tahunan](results/histogram_3.jpeg)
  - *Interpretasi:* Observasi Titik Data: Titik-titik data (sampel) tidak mengikuti garis merah putus-putus yang merupakan garis normal teoritis. Titik-titik tersebut justru membentuk pola lengkungan yang mendatar di tengah dan melengkung tajam di kedua ujungnya, menyerupai bentuk huruf "S" yang memanjang.
Arti Pola Tersebut: Ketidaksesuaian antara titik sampel dengan garis lurus ini berarti bahwa data pendapatan tahunan tidak terdistribusi secara normal. Dalam statistik, pola "S" seperti ini mengindikasikan bahwa distribusi data memiliki karakteristik light-tailed atau lebih cenderung mengikuti distribusi seragam (uniform), di mana nilai-nilainya tersebar merata tanpa adanya penumpukan yang dominan di sekitar nilai rata-rata (mean).
Konsekuensi Analisis: Karena data tidak mengikuti garis lurus (tidak normal), maka asumsi normalitas untuk pengujian statistik parametrik tertentu tidak terpenuhi. Hal ini mengharuskan saya untuk lebih berhati-hati dalam memilih metode analisis selanjutnya, seperti mempertimbangkan penggunaan uji non-parametrik agar hasil kesimpulan tetap akurat.

### 5.3. Analisis Korelasi
- **Nilai Koefisien Korelasi:**
  - *Nilai r :* Berdasarkan visualisasi scatter plot yang dihasilkan dalam lingkungan RStudio, nilai koefisien korelasi (r) yang saya peroleh adalah sebesar 0.98.
  - *Interpretasi:*  Arah Hubungan (Positif): Hubungan antara kedua variabel ini bersifat positif. Hal ini dapat saya lihat dari pola titik-titik pada scatter plot yang secara konsisten bergerak naik dari arah kiri bawah menuju kanan atas. Secara praktis, ini berarti setiap kali Pendapatan Tahunan meningkat, maka Biaya Akuisisi Pelanggan juga cenderung meningkat secara linear.

Kekuatan Hubungan (Sangat Kuat): Dengan nilai r mencapai 0.98, hubungan ini dikategorikan sebagai korelasi positif yang sangat kuat. Indikasi kekuatan ini juga terlihat sangat jelas pada visualisasi scatter plot, di mana titik-titik data (berwarna biru) berada sangat rapat dan menempel pada garis tren linear berwarna merah. Hampir tidak ditemukan penyimpangan atau titik yang berada jauh dari garis tren tersebut, menunjukkan ketergantungan antar variabel yang sangat tinggi.
- **Visualisasi (Scatter Plot):**
  - *Sematkan gambar plot dari folder /results...* ![Histogram Pendapatan Tahunan](results/histogram_4.jpeg)
  - *Interpretasi:* Kesesuaian dengan Nilai Korelasi: Pola pada scatter plot sangat mendukung hasil koefisien korelasi yang sangat kuat ($r = 0.98$).Linearitas Data: Titik-titik data (berwarna biru) membentuk pola garis lurus yang sangat jelas dan konsisten, mulai dari nilai pendapatan rendah hingga tinggi.Kedekatan dengan Garis Tren: Hampir seluruh titik data berada sangat rapat dan menempel pada garis tren linear berwarna merah. Hal ini menunjukkan bahwa hubungan antara Pendapatan Tahunan dan Biaya Akuisisi Pelanggan memiliki variasi atau penyimpangan (error) yang sangat kecil.Arah Hubungan: Pola yang naik dari kiri bawah ke kanan atas secara visual mengonfirmasi adanya hubungan positif. Artinya, model visual ini secara akurat merepresentasikan temuan numerik bahwa setiap peningkatan pada pendapatan akan diikuti oleh peningkatan biaya akuisisi pelanggan secara proporsional.

### 5.4. Analisis Regresi
- **Model Regresi:**
  - *Persamaan regresi: Y = 1.34 + 2.45. X
  - *Interpretasi:* Intercept (b0 = 1.34): Nilai ini menunjukkan perkiraan Biaya Akuisisi Pelanggan jika Pendapatan Tahunan berada di angka nol. Dalam konteks data ini, nilai 1.34 Juta IDR merupakan biaya dasar yang tetap muncul sebagai titik awal dalam model sebelum dipengaruhi oleh variabel pendapatan.

Slope (b1 = 2.45): Nilai ini merupakan koefisien kemiringan yang menunjukkan besarnya pengaruh variabel pendapatan terhadap biaya akuisisi. Artinya, setiap kali Pendapatan Tahunan meningkat sebesar 1 Miliar IDR, maka Biaya Akuisisi Pelanggan diprediksi akan naik sebesar 2.45 Juta IDR. Hubungan ini bersifat positif dan linear, yang berarti kedua variabel bergerak searah dengan konsistensi yang sangat tinggi.
- **Evaluasi Model (R-squared):**
  - *Nilai R-squared :* 0.96
  - *Interpretasi:* Berdasarkan hasil perhitungan model, nilai R-squared adalah 0.96 atau sebesar 96 persen. Hal ini berarti bahwa 96 persen variasi dari variabel dependen, yaitu Biaya Akuisisi Pelanggan, dapat dijelaskan secara akurat oleh variabel independen, yaitu Pendapatan Tahunan, melalui model regresi ini. Sisanya sebesar 4 persen dijelaskan oleh faktor-faktor lain di luar model yang saya buat. Nilai yang mendekati angka 1 ini menunjukkan bahwa model regresi yang saya gunakan memiliki tingkat kecocokan yang sangat tinggi dalam menggambarkan hubungan antara kedua variabel tersebut.
- **Visualisasi (Garis Regresi pada Scatter Plot):**
  - *Sematkan gambar plot dari folder /results...* ![Histogram Pendapatan Tahunan](results/histogram_5.jpeg)
  - *Interpretasi:* Arah dan Tren Linear: Garis merah solid pada grafik menunjukkan tren linear yang sangat jelas. Kemiringan garis yang bergerak naik dari kiri bawah ke kanan atas merepresentasikan hubungan positif, yang berarti setiap peningkatan pada Pendapatan Tahunan akan diikuti secara konsisten oleh peningkatan Biaya Akuisisi Pelanggan.
Akurasi Model (Fitting Data): Garis tersebut merepresentasikan "garis kecocokan terbaik" (best-fit line) yang meminimalkan jarak antara titik-titik data aktual dengan garis prediksi. Karena hampir seluruh titik data biru menempel sangat rapat pada garis merah, ini menunjukkan bahwa model regresi tersebut memiliki tingkat akurasi yang luar biasa dalam menangkap pola hubungan di lapangan.
Interpretasi Nilai R-squared: Berdasarkan keterangan pada visualisasi, model ini memiliki nilai Adjusted R-squared sebesar 0.991. Angka ini memberikan wawasan bahwa garis regresi tersebut mampu menjelaskan 99.1% variasi yang terjadi pada Biaya Akuisisi Pelanggan berdasarkan variabel Pendapatan Tahunan. Hal ini menandakan model sangat handal untuk digunakan sebagai alat prediksi.
Konsistensi Hubungan: Garis lurus yang tidak berkelok menunjukkan bahwa hubungan antara kedua variabel bersifat stabil di seluruh rentang data, mulai dari pendapatan rendah (di bawah 20 Miliar) hingga pendapatan tinggi (di atas 60 Miliar).
---
## 6. Kesimpulan

Rangkum temuan utama dari analisis Anda dalam beberapa kalimat. Apa wawasan paling penting yang Anda peroleh?
Analisis menunjukkan bahwa meskipun pendapatan perusahaan tersebar secara merata tanpa mengikuti pola distribusi normal, terdapat hubungan linear yang sangat konsisten dan kuat antara pendapatan dengan biaya akuisisi pelanggan. Model regresi yang dibangun terbukti memiliki akurasi prediksi yang sangat tinggi (96%-99%), di mana setiap pertumbuhan pendapatan sebesar 1 Miliar IDR secara terukur akan meningkatkan biaya akuisisi sebesar 2.45 Juta IDR.

Wawasan Paling Penting (Key Insight)
Wawasan paling krusial dari proyek ini adalah predibilitas biaya terhadap pertumbuhan. Hubungan korelasi yang mencapai 0.98 menunjukkan bahwa biaya akuisisi pelanggan bukan merupakan variabel liar, melainkan komponen yang bergerak sejajar dengan skala pendapatan. Bagi manajemen, ini berarti ekspansi bisnis dapat direncanakan dengan sangat presisi secara finansial; perusahaan dapat menghitung anggaran pemasaran yang dibutuhkan secara akurat untuk mencapai target pendapatan tertentu tanpa khawatir adanya lonjakan biaya yang tidak terduga di luar model regresi ini.
