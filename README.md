# Jarkom-Modul-1-2026-K-41

|         Nama         |     NRP     |
|----------------------|-------------|
|Rayhan Fadhilah Allayn| 5027251126  |
|                      |             |

## Soal 14

Setelah gagal mengakses FTP, Eiri melancarkan serangan brute-force terhadap form login web Alice. Analisis file capture `wired_bruteforce.pcapng` untuk mengidentifikasi alamat IP penyerang, target IP beserta port yang diserang, password user lain_admin yang berhasil ditembus, serta web server software dan versi yang dilaporkan pada response header. Validasi temuan kalian pada socket server:
([Link File](https://drive.google.com/drive/folders/1-MloxOyGauBYglc6TKTQ84VeILvJjjG2?usp=sharing)) `nc [IP_Group] 3401`

### 1. Langkah Pengerjaan
1. Buka File `soal14_wired_bruteforce` melalui `Link File`.
2. Melakukan Filter.
```bash
'http.request.method == "POST" || http.response.code == 200'
```
![Screenshot](source/Jarkom_14_Wireshark.png)

3. Cek `Statistics > Endpoints > IPv4` untuk mengidentifikasi IP penyerang

![Screenshot](source/Jarkom_14_IPPenyerang.png)

4. Klik kanan paket `POST /login.php > Follow > HTTP Stream` untuk menemukan kredensial yang berhasil login

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
Eiri menyusup ke ruang server dan memasang perangkat keyboard USB berbahaya pada node Alice. Buka file capture wired_usb_hid.pcap, identifikasi Vendor ID dan Product ID perangkat USB dari deskriptor USB, alamat nomor device USB, serta pesan rahasia yang berhasil dicuri dari keystroke. Validasi temuan kalian pada socket server: ([Link File](https://drive.google.com/drive/folders/1oAPzN9IEN0264_LlvGnl_CsIiYh-Hp8w?usp=drive_link)) `nc [IP_Group] 3402`

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
([Link File](https://drive.google.com/drive/folders/1qBeAXVx1MG14L0jzGefqs3t8qO8VRMmb?usp=sharing)) `nc [IP_Group] 3403` 

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

### 1. Langkah Pengerjaan
1. Buka File `soal17_wired_http_c2.pcap` melalui `Link File`.
2. Melakukan Filter.
```bash
http.request.method == "GET"
```
3. Temukan request unduhan berkas executable malware `/navi_agent.exe.`
4. Buka detail header Hypertext Transfer Protocol untuk menemukan domain (`Host: wired-update.net`) dan status HTTP.
5. Periksa IPv4 Destination Address untuk mencatat IP server penyerang.

![Screenshot](source/Jarkom_17_Wireshark.png)

### 2. Command
1. Buka cmd, lalu pindah ke wsl dengan mengetik `wsl`.
2. ketik `nc [IP_Group] 3401` dalam case ini, kami menggunakanan punya kami.
```bash
nc 10.4.89.247 3404
```
3. Isi pertanyaan berdasarkan data yang telah diperoleh, lalu nanti akan mendapatkan hasilnya. Dalam case kami, kami mendapatkan hasil seperti ini:
- Domain Name (Host): wired-update.net

- Attacker Server IP: 198.51.100.7

- Malware Executable Filename: navi_agent.exe

- HTTP Status Code: 200

![Screenshot](source/Jarkom_17_Hasil.png)

## Soal 18
Eiri mengubah taktik penyerangan dengan menanamkan file malware menggunakan protokol file sharing SMB. Analisis file capture wired_smb_transfer.pcapng untuk mengidentifikasi nama protokol jaringan yang dieksploitasi, IP pengirim dan penerima, folder tujuan penyimpanan malware pada sistem korban, serta nama file executable malware yang ditransfer. Validasi temuan kalian pada socket server: ([Link File](https://drive.google.com/file/d/1XBtKWtNM_RrSBTp2e3O5vBdiklcPNsKs/view?usp=sharing)) `nc [IP_Group] 3405`
### 1. Langkah Pengerjaan
1. Buka File `soal18_wired_smb_transfer.pcapng` melalui `Link File`.
2. Melakukan Filter.
```bash
smb2
```
3. Buka paket `Tree Connect Request` untuk mencatat target IP (`10.7.1.50`) dan nama Share (`ADMIN$`).

![Screenshot](source/Jarkom_18_Wireshark.png)

### 2. Command
1. Buka cmd, lalu pindah ke wsl dengan mengetik `wsl`.
2. ketik `nc [IP_Group] 3401` dalam case ini, kami menggunakanan punya kami.
```bash
nc 10.4.89.247 3405
```
3. Isi pertanyaan berdasarkan data yang telah diperoleh, lalu nanti akan mendapatkan hasilnya. Dalam case kami, kami mendapatkan hasil seperti ini:
- Protocol Name: SMB2

- Sender IP: 172.26.7.50

- Receiver IP: 10.7.1.50

- Destination Share/Folder: ADMIN$

- Malware Executable Filename: wired_trojan_payload.exe

![Screenshot](source/Jarkom_18_Hasil.png)

## Soal 19
Eiri meneror jaringan dengan mengirimkan email pemerasan melalui protokol SMTP tanpa enkripsi. Analisis file capture wired_smtp_threat.pcap pada stream TCP terkait, identifikasi alamat email korban yang ditargetkan, password korban yang diklaim bocor oleh penyerang, jenis malware yang diinfeksikan, batas waktu (dalam hari) yang diberikan, serta MailClientID yang tercantum pada pesan. Validasi temuan kalian pada socket server: ([Link File](https://drive.google.com/drive/folders/1RAW0cMoGDDStPyFHeJ_0t9kkoLGBsCmH?usp=sharing)) `nc [IP_Group] 3406`
### 1. Langkah Pengerjaan
1. Buka File `soal19_wired_smtp_threat.pcap` melalui `Link File`.
2. Melakukan Filter.
```bash
smtp
```
3. Klik kanan paket `SMTP > Follow > TCP Stream`.
4. Baca isi pesan email pemerasan untuk mengekstrak email korban (`victim@protocol7.co.jp`), password yang bocor, jenis malware, batas waktu, dan MailClientID.

![Screenshot](source/Jarkom_19_Wireshark.png)

![Screenshot](source/Jarkom_19_Info.png)

### 2. Command
1. Buka cmd, lalu pindah ke wsl dengan mengetik `wsl`.
2. ketik `nc [IP_Group] 3401` dalam case ini, kami menggunakanan punya kami.
```bash
nc 10.4.89.247 3406
```
3. Isi pertanyaan berdasarkan data yang telah diperoleh, lalu nanti akan mendapatkan hasilnya. Dalam case kami, kami mendapatkan hasil seperti ini:
- Victim Email Address: victim@protocol7.co.jp

- Leaked Password: pr0tocol_7_user

- Malware Type: ransomware

- Time Limit (Days): 3

- MailClientID: 7719980706

![Screenshot](source/Jarkom_19_Hasil.png)

## Soal 20
Untuk rencana pamungkasnya, Eiri menyembunyikan komunikasi malware di balik saluran terenkripsi TLS. Namun Alice telah menyediakan file keylog untuk mendekripsi lalu lintas data tersebut. Analisis file capture wired_tls_decrypt.pcapng bersama keyslogfile.txt untuk mengidentifikasi versi protokol TLS yang dinegosiasikan, nama domain (SNI) yang diakses, alamat IP server HTTPS penyerang, User-Agent yang digunakan, serta HTTP request method dan path yang tersembunyi di dalam sesi dekripsi. Validasi temuan kalian pada socket server: ([Link File](https://drive.google.com/file/d/1F7xN3ydIrA-pZaCb32MGseVeHKt-D_qZ/view?usp=sharing)) `nc [IP_Group] 3407`

### 1. Langkah Pengerjaan
1. Buka File `soal20_wired_tls_decrypt.pcapng`melalui `Link File`.
2. Impor file SSL Keylog: `Edit > Preferences > Protocols > TLS > (Pre)-Master-Secret log filename > arahkan ke keyslogfile.txt`.
3. Amati paket Frame 1 (`Client Hello`) untuk mencatat TLS Version (`TLSv1.2`), SNI (`example.com`), dan Destination IP (`93.184.216.34`).
Setelah dekripsi aktif, periksa paket HTTP No. 6 (HEAD / HTTP/1.1) atau `klik kanan > Follow > HTTP Stream` untuk mendapatkan User-Agent (`curl/7.68.0`), dan HTTP Method (`HEAD`).

![Screenshot](source/Jarkom_20_Wireshark.png)

![Screenshot](source/Jarkom_20_TLS.png)

![Screenshot](source/Jarkom_20_UserAgent.png)

### 2. Command
1. Buka cmd, lalu pindah ke wsl dengan mengetik `wsl`.
2. ketik `nc [IP_Group] 3401` dalam case ini, kami menggunakanan punya kami.
```bash
nc 10.4.89.247 3407
```
3. Isi pertanyaan berdasarkan data yang telah diperoleh, lalu nanti akan mendapatkan hasilnya. Dalam case kami, kami mendapatkan hasil seperti ini:
TLS Version: TLSv1.2

- Domain Name (SNI): example.com

- Attacker HTTPS Server IP: 93.184.216.34

- User-Agent: curl/7.68.0

- HTTP Method: HEAD

![Screenshot](source/Jarkom_20_Hasil.png)
