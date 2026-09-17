# Jarkom-Modul-1-2026-K-41

|         Nama         |     NRP     |
|----------------------|-------------|
|Rayhan Fadhilah Allayn| 5027251126  |
|                      |             |

## Soal 14

Setelah gagal mengakses FTP, Eiri melancarkan serangan brute-force terhadap form login web Alice. Analisis file capture `wired_bruteforce.pcapng` untuk mengidentifikasi alamat IP penyerang, target IP beserta port yang diserang, password user lain_admin yang berhasil ditembus, serta web server software dan versi yang dilaporkan pada response header. Validasi temuan kalian pada socket server:
([Link File](https://drive.google.com/drive/folders/1-MloxOyGauBYglc6TKTQ84VeILvJjjG2?usp=sharing)) nc [IP_Group] 3401

### 1. Langkah Pengerjaan
1. Buka File `soal14_wired_bruteforce` melalui `Link File`.
2. Melakukan Filter.
```bash
'http.request.method == "POST" || http.response.code == 200'
```
![Screenshot](source/Jarkom_14_Wireshark.png)

3. Cek `Statistics > Endpoints > IPv4` untuk mengidentifikasi IP penyerang

![Screenshot](source/Jarkom_14_IPPenyerang.png)

4. Klik kanan paket `POST /login.php $\rightarrow$ Follow > HTTP Stream` untuk menemukan kredensial yang berhasil login

![Screenshot](source/Jarkom_14_Info.png)

### 2. Command
1. Buka cmd, lalu pindah ke wsl dengan mengetik `wsl`.
2. ketik `nc [IP_Group] 3401` dalam case ini, kami menggunakanan punya kami.
```bash
nc 10.4.89.247 3401
```
3. Isi pertanyaan berdasarkan data yang telah diperoleh, lalu nanti akan mendapatkan hasilnya. Dalam case kami, kami mendapatkan hasil seperti ini:
- Attacker IP: 172.26.7.50

- Target IP & Port: 172.26.7.100:8080

- Password (lain_admin): wired_pr0tocol_7

- Server Version: Apache/2.4.62

- Flag: KOMJAR26{W1r3d_Brut3_Ye82BmLajC1L7cIJfGwwEbkHh}

![Screenshot](source/Jarkom_14_Hasil.png)

## Soal 15
Eiri menyusup ke ruang server dan memasang perangkat keyboard USB berbahaya pada node Alice. Buka file capture wired_usb_hid.pcap, identifikasi Vendor ID dan Product ID perangkat USB dari deskriptor USB, alamat nomor device USB, serta pesan rahasia yang berhasil dicuri dari keystroke. Validasi temuan kalian pada socket server: ([Link File](https://drive.google.com/drive/folders/1oAPzN9IEN0264_LlvGnl_CsIiYh-Hp8w?usp=drive_link))

### 1. Langkah Pengerjaan
1. Buka File `soal15_wired_usb_hid.pcap` melalui `Link File`.
2. Melakukan Filter.
```bash
usb.idVendor || usb.bDescriptorType == 1
```
3. Cek Frame 2 (`GET DESCRIPTOR Response DEVICE`) pada panel `DEVICE DESCRIPTOR` untuk menemukan `Vendor ID (0x046d)`, `Product ID (0xc31c)`, dan `USB Device Address (7)`.
![Screenshot](source/Jarkom_15_Wireshark.png)