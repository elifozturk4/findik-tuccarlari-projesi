CREATE DATABASE findik_haritasi;
use findik_haritasi;
CREATE TABLE Sehir
(
	SehirID INT AUTO_INCREMENT PRIMARY KEY,
	Sehir_Adi VARCHAR(50) NOT NULL
);

CREATE TABLE Ilce
(
	IlceID INT AUTO_INCREMENT PRIMARY KEY,
	Ilce_Adi VARCHAR(50) NOT NULL, 
	SehirID INT NOT NULL,
	FOREIGN KEY (SehirID) REFERENCES Sehir(SehirID)
 );
 
CREATE TABLE Tuccar
 (
 TuccarID INT AUTO_INCREMENT PRIMARY KEY,
 Firma_adi VARCHAR(50) NOT NULL,
 Telefon VARCHAR(50) UNIQUE,
 Adres VARCHAR(100),
 IlceID INT NOT NULL,
 Fiyat DECIMAL(6,2) NOT NULL ,
 FOREIGN KEY (IlceID) REFERENCES Ilce(IlceID)
 );
 
CREATE TABLE Yonetici (
	KullaniciID INT AUTO_INCREMENT PRIMARY KEY,
    Kullanici_adi VARCHAR(50) NOT NULL,
    Sifre VARCHAR(50) NOT NULL
);


INSERT INTO Yonetici (Kullanici_adi, Sifre)
VALUES ("elf", "1234");
 
INSERT INTO Sehir (Sehir_Adi) VALUES
('Ordu'),
('Giresun'),
('Trabzon'),
('Samsun');

INSERT INTO Ilce( Ilce_Adi, SehirID) VALUES 
('Altınordu', 1),
('Fatsa', 1),
('Ünye', 1),
('Aybastı', 1),

('Merkez', 2),
('Bulancak', 2),
('Espiye', 2),
('Yağlıdere', 2),

('Ortahisar', 3),
('Akçaabat', 3),
('Arsin', 3),
('Maçka', 3),

('İlkadım', 4),
('Bafra', 4),
('Çarşamba', 4),
('Atakum', 4);


INSERT INTO Tuccar (Firma_adi, Telefon, Adres, IlceID, Fiyat) VALUES
('ÇEBİ FINDIK', '04522370357', 'Karacaömer Mh. Poyraz Sk. No:12, 52210 Altınordu / Ordu', 1, 285.50),
('ŞENOCAK FINDIK', '04522336566', 'Cumhuriyet Mah. M.Kemal Blv. No:72 Altınordu, Ordu', 1, 284.95),
('ŞAHİNLER FINDIK', '04527001010', 'Karacaömer Mah. Poyraz Sk. No:81/A Altınordu - ORDU', 1, 285.10),
('DEMİRLER FINDIK', '04522341632', 'Akyazı Mahallesi, Atatürk Blv. No: 375/A Altınordu/Ordu', 1, 285.35),
('İNCE TİCARET', '05363000451', 'Ordu, Altınordu, Bucak Mah., Doktor Sadık Ahmet Cad., 32B Altınordu/Ordu', 1, 285.20),
('YAHŞİ FINDIK', '04524002323', 'Konakbaşı Mahallesi Ilıca Yolu Üzeri Fatsa, Ordu', 2, 285.15),
('YAHŞİ TİCARET', '04524236611', 'Evkaf Mah. Ata Cad. 90 Fatsa, Ordu', 2, 285.05),
('KURTOĞLU FINDIK', '04524235856', 'Dumlupınar Mah. Reşadiye Cad. 131 Fatsa/ Ordu', 2, 285.40),
('ZİRVE FINDIK', '02124850128', 'Fabrika Fatsa Organize Sanayi Bölgesi 101. SS. NO:1 Fatsa, Ordu', 2, 285.50),
('KARADENİZ FINDIK DEĞİRMENİ ENTEGRE TESİSİ', '04524235700', 'Evkaf Mah. Kadife Sok. No: 56 Fatsa / ORDU', 2, 285.30),
('VEYİSOĞLU FINDIK', '04523238666', 'Liseler Mah. Fatih Sultan Mehmet 1. Sok. 5/A Ünye/ Ordu', 3, 284.90),
('USLU FINDIK', '04523424656', 'Sahil Köyü Tepe Mahallesi Cüri Mevki No:1 Ünye/ Ordu', 3, 285.10),
('DURAK FINDIK', '04523239282', 'Atatürk Mahallesi, Devlet Sahil Yolu Caddesi No:743 Ünye/ Ordu', 3, 285.00),
('DOST FINDIK', '04523238711', 'Gölevi, Bataklık Sk. No:5, 52300 Ünye/Ordu', 3, 285.25),
('ÇITLAKOĞLU FINDIK', '05550000028', 'Hacısiyam, Fatih Cd. No:78, 28000 Giresun Merkez/Giresun', 5, 288.75),
('PEKDEMİRLER GIDA, FINDIK ALIM SATIM', '04542161320', 'Hacısiyam, Fatih Cd. No:151, 28000 Giresun Merkez/Giresun', 5, 288.50),
('CENGİZ BEYAZ FINDIK ALIM-SATIM', '05456026138', 'Giresun, Giresun Merkez , Hacısiyam Mah., Lale Sok.', 5, 287.95),
('GÖKSU FINDIK', '05336680515', 'Hacısiyam, Fatih Cd. NO: 147/A, 28200 Giresun Merkez/Giresun', 5, 288.20),
('ERTEKİN FINDIK ALIM SATIM', '05370495033', 'Acısu, Kesmetaş Cd. No:4/A, 28300 Bulancak/Giresun', 6, 287.15),
('ACUN FINDIK', '04543144268', 'Bulancak Sanayi Bölgesi', 6, 287.00),
('KIZILTAŞ FINDIK', '05340884428', 'İhsaniye, Cemal Gürsel Cd. No:231 D:A, 28300 Bulancak/Giresun', 6, 287.50),
('RAMİS YILMAZ FINDIK ALIM SATIM', '04543000036', 'Giresun, Bulancak, İhsaniye Mah., Acısu Cad., 86', 6, 287.35),
('AYDIN FINDIK TİCARET', '04543186198', 'İhsaniye Mah. Cemal Gürsel Cad. 225 Bulancak, Giresun', 6, 287.20),
('ÖZTÜRK FINDIK', '04548282807', 'Giresun 2. Organize Sanayi 3. Cadde No:28 Bulancak/GİRESUN', 6, 287.65),
('KOÇLAR FINDIK', '05325561457', 'Esentepe, Gazi Mustafa Kemal Cd. No:58, 28600 Espiye/Giresun, Türkiye', 7, 288.10),
('TOPHASANOĞLU FINDIK', '05379285112', 'Gazi Mustafa Kemal Cad., No:68B Espiye/Giresun, Türkiye', 7, 288.30),
('HOROZOĞLU KARDEŞLER FINDIK ALIM SATIM', '05327607107', 'Belediye Cad., No:2C, Merkez Mah., Espiye, Giresun, Türkiye', 7, 288.45),
('ÖZKUL TİCARET', '05343537649', 'Merkez Mah. Yunus Emre Sok. 10/A Espiye, Giresun, Türkiye', 7, 287.80),
('FINGALOĞLU KANGAL TİCARET FINDIK ALIM SATIM', '05333450431', 'Kozbükü, CUMHURİYET CAD NO:10, 28610 Üçtepe/Yağlıdere/Giresun', 8, 287.00),
('TAHSİN FINDIK', '04546800080', 'Cumhuriyet Mahallesi No: 47, 28610 YAĞLIDERE/Giresun', 8, 287.10),
('KARAARSLAN FINDIK ALIM SATIM', '05418004452', 'Yeni, 323. Sk. NO:23/A, 52200 Altınordu/Ordu', 1, 285.25),
('CELEPOĞLU FINDIK ALIM SATIM', '04543387654', 'Sanayi, Sanayi Çarşısı Cd., 61100 Ortahisar/Trabzon', 9, 286.00),
('KILIÇLAR FINDIK', '04623211524', 'Pazarkapı, Kalkanoğlu Cd. 22-30, 61200 Ortahisar/Trabzon', 9, 285.80),
('İSKO FINDIK', '05072272822', 'Hızırbey, Kahramanmaraş Cd. no:166/C, 61100 Ortahisar/Trabzon', 9, 285.65),
('SABIRLAR FINDIK İHRACAT Ltd. Şti.', '04622725353', 'Pazarkapı Mah. Kalkanoğlu Cad. No: 31A, 61050 Ortahisar / Trabzon', 9, 286.25),
('İSLAM KILIÇ TARIM ÜRÜNLERİ', '04622282829', 'Çolaklı Mah. İnönü Cad. No: 225, Akçaabat / Trabzon', 10, 285.45),
('AKÇAABAT FINDIK ALIM SATIM TİCARET', '0339248785', 'Nefsipulathane Mah., Müftülük Sok. 6, Akçaabat / Trabzon', 10, 285.55),
('BIYIKLIOĞLU TİCARET', '05361086763', 'Nefsipulathane, İnönü Cd., 61300 Akçaabat/Trabzon', 10, 285.30),
('YİĞİT TARIM FINDIK ALIM SATIM TİCARET', '05348537257', 'Esenli, Yunus Emre Cd. No: 4A, 52500 Aybastı/Ordu', 4, 284.80),
('SARALOĞLU TİCARET FINDIK ALIM-SATIM', '05438939761', 'Cumhuriyet, Şht. Asteğmen Halil Albayrak Cd No:42, 61915 Arsin/Trabzon', 11, 285.10),
('ŞEYHOĞLU TİCARET - FINDIK ALIM SATIMI', '05323536843', 'Şht, Cumhuriyet, Şht. Asteğmen Halil Albayrak Cd No:23 / A, 61915 Arsin/Trabzon', 11, 285.00),
('FERRERO FINDIK', '04625231004', 'Bahçekaya Mah. Kenan Oltan Merkez, Maçka, Trabzon', 12, 289.00),
('AK ZAHİRE', '05412025713', 'Adalet, Şht. er Selman Özay Sk no:40, 55060 İlkadım/Samsun', 13, 283.50),
('DEVECİ FINDIK', '03622341011', 'Çiftlik Mah. İstiklal Cad. İlkadım, Samsun', 13, 283.75),
('FINDIK ALİ TİCARET', '03625442345', 'Kızılırmak, Kabaoğlu Sk., 55400 Bafra/Samsun', 14, 283.60),
('ÖZYILMAZ FINDIK', '03628334256', 'Samsun Ordu Karayolu Beylerce Mevkii Çarşamba/SAMSUN', 15, 284.10),
('ASMA FINDIK', '03628542055', 'Kuşhane Mahallesi Atatürk Bulvarı No:258/1 Çarşamba/SAMSUN', 15, 284.00),
('55 FINDIK', '05467820904', 'Çay Mah. Cemil Şensoy Cad. No: 80/B ÇARŞAMBA', 15, 284.25),
('KUZEY FINDIK ALIM SATIM', '05412654556', 'Atatürk 6. Kısım Bulvarı 361A, Atakum / Samsun', 16, 283.80),
('ÖZDEMİRLER FINDIK', '03624313104', 'Cumhuriyet Mah. 48. Sok. No:1 B/ Atakum, Samsun', 16, 283.95);