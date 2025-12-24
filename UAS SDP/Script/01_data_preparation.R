# ================================================================
# ANALISIS DATA STARTUP SAAS
# ================================================================
# Mata Kuliah : Statistika dan Probabilitas
# ================================================================


# ------------------------------------------------
# BAGIAN 0: PERSIAPAN LINGKUNGAN KERJA
# ------------------------------------------------

# Bersihkan environment
rm(list = ls())

# Set working directory (jalankan jika belum benar)
# setwd("~/Materi S0")

# Cek working directory
getwd()


# ------------------------------------------------
# BAGIAN 1: MEMUAT LIBRARY
# ------------------------------------------------

library(tidyverse)


# ------------------------------------------------
# BAGIAN 2: MEMUAT DATA
# ------------------------------------------------

file_path <- "data_startup_saas.csv"

if (!file.exists(file_path)) {
  stop("File data_startup_saas.csv tidak ditemukan di folder data/")
}

data <- read_csv(file_path)


# ------------------------------------------------
# BAGIAN 3: PEMERIKSAAN AWAL DATA
# ------------------------------------------------

# 6 baris pertama
head(data)

# Struktur data
glimpse(data)

# Ringkasan statistik
summary(data)


# ------------------------------------------------
# BAGIAN 4: PEMERIKSAAN DATA HILANG
# ------------------------------------------------

colSums(is.na(data))


# ------------------------------------------------
# BAGIAN 5: PEMBERSIHAN DATA
# ------------------------------------------------

# Untuk tahap ini diasumsikan data sudah bersih
data_bersih <- data


# ------------------------------------------------
# BAGIAN 6: ANALISIS DESKRIPTIF NUMERIK
# ------------------------------------------------

data_bersih %>%
  summarise(across(where(is.numeric), list(
    mean   = mean,
    median = median,
    sd     = sd,
    min    = min,
    max    = max
  ), na.rm = TRUE))


# ------------------------------------------------
# BAGIAN 7: ANALISIS DESKRIPTIF KATEGORIK
# ------------------------------------------------

data_bersih %>%
  select(where(is.character)) %>%
  summarise(across(everything(), ~ n_distinct(.)))


# ------------------------------------------------
# BAGIAN 8: VISUALISASI DATA
# ------------------------------------------------

# Histogram untuk variabel numerik
data_bersih %>%
  select(where(is.numeric)) %>%
  pivot_longer(everything()) %>%
  ggplot(aes(value)) +
  geom_histogram(bins = 30) +
  facet_wrap(~ name, scales = "free")


# ------------------------------------------------
# BAGIAN 9: MENYIMPAN HASIL
# ------------------------------------------------

# Membuat folder results jika belum ada
if (!dir.exists("results")) {
  dir.create("results")
}

# Simpan data bersih
write_csv(data_bersih, "results/data_bersih.csv")


# ------------------------------------------------
# BAGIAN 10: PENUTUP
# ------------------------------------------------

cat("Analisis selesai dijalankan.\n")
cat("Data bersih tersimpan di folder results.\n")
