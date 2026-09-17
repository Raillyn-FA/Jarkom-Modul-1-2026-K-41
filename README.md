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
3. Cek Frame 2 (`GET DESCRIPTOR Response DEVICE`) pada panel `DEVICE DESCRIPTOR` untuk menemukan `Vendor ID (0x046d)`, `Product ID (0xc31c)`, dan `USB Device Address (2/7)`.

![Screenshot](source/Jarkom_15_Wireshark.png)

4. Ekstrak data raw keystroke menggunakan `tshark` dari terminal WSL:
```bash
tshark -r /mnt/c/Users/rayhan/Downloads/soal15_wired_usb_hid.pcap -Y "usb.capdata" -T fields -e usb.capdata
```
Hasil sebelum decode:
![Screenshot](source/Jarkom_15_BeforeDecode.png)

Hasil setelah decode:
![Screenshot](source/Jarkom_15_AfterDecode.png)

### 2. Command
1. Buka cmd, lalu pindah ke wsl dengan mengetik `wsl`.
2. ketik `nc [IP_Group] 3401` dalam case ini, kami menggunakanan punya kami.
```bash
nc 10.4.89.247 3402
```
3. Isi pertanyaan berdasarkan data yang telah diperoleh, lalu nanti akan mendapatkan hasilnya. Dalam case kami, kami mendapatkan hasil seperti ini:
- Vendor ID: 0x046d

- Product ID: 0xc31c

- USB Device Address: 7

- Secret Message: Wired_Protocol_7_is_alive_2026

- Flag: KOMJAR26{USB_K3ystr0k3_Ks09UgdPL9kvS3UKjVHDkJScg}

![Screenshot](source/Jarkom_15_Hasil.png)

## Soal 16
Eiri meletakkan file malware di server. Dari file capture wired_ftp_theft.pcap, lakukan analisis lalu lintas FTP untuk mengidentifikasi alamat IP server FTP penyerang, banner software FTP yang digunakan, kredensial login penyerang, serta ukuran (size in bytes) dari file malware knights_payload.exe yang diunduh. Validasi temuan kalian pada socket server:
([Link File](https://drive.google.com/drive/folders/1qBeAXVx1MG14L0jzGefqs3t8qO8VRMmb?usp=sharing)) nc [IP_Group] 3403 

### 1. Langkah Pengerjaan
1. Buka File `soal16_wired_ftp_theft.pcap` melalui `Link File`.
2. Melakukan Filter.
```bash
ftp
```
3. Pada bagian info akan menampilkan jawaban-jawabannya

![Screenshot](source/Jarkom_16_ftp.png)

### 2. Command
1. Buka cmd, lalu pindah ke wsl dengan mengetik `wsl`.
2. ketik `nc [IP_Group] 3401` dalam case ini, kami menggunakanan punya kami.
```bash
nc 10.4.89.247 3403
```
3. Isi pertanyaan berdasarkan data yang telah diperoleh, lalu nanti akan mendapatkan hasilnya. Dalam case kami, kami mendapatkan hasil seperti ini:
- FTP Username: knights_agent

- FTP Password: N4v1_s3cur3_2026

- Downloaded File Name: knights_payload.exe

- FTP Server Version: vsftpd 3.0.5

- Flag: KOMJAR26{FTP_Th3ft_sfFYZTP1Y7PFqpMBFDyQswKFQ}


![Screenshot](source/Jarkom_16_Hasil.png)

## Soal 17
Alice membuat halaman web di node-nya. Eiri memanfaatkan celah untuk mengunduh payload berbahaya ke sistem Alice. Analisis file capture wired_http_c2.pcap untuk mengidentifikasi nama domain (Host) tempat malware diunduh, alamat IP server penyerang, nama file executable malware yang diunduh, serta kode status HTTP yang dikembalikan. Validasi temuan kalian pada socket server:
([Link File](https://drive.google.com/drive/folders/1iPYESj5AN-uXYXfD2Wo2cRrm_Rigr_D6?usp=sharing)) `nc [IP_Group] 3404`

