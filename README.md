### Doğu Karadeniz Fındık Tüccarları Bilgi Sistemi 🌰

Bu proje, Doğu Karadeniz bölgesindeki fındık tüccarlarının bilgilerini ve güncel fındık fiyatlarını takip etmek için geliştirilmiş bir web tabanlı yönetim sistemidir. 
Kullanıcılar (müşteriler) şehir ve ilçe bazlı filtreleme yaparak tüccarlara ulaşabilirken, yöneticiler panel üzerinden veri girişi ve güncelleme yapabilmektedir.

## ✨ Temel Özellikler

### 👥 Müşteri Paneli

-**Lokasyon Bazlı Filtreleme:** Şehir ve ilçe seçimi ile hedeflenen bölgedeki tüccarlara anında erişim.

-**Güncel Veri Akışı:** Firma adı, telefon, adres ve en güncel fındık fiyatlarının görüntülenmesi.

-**Dinamik UI:** Seçilen şehre göre otomatik yüklenen ilçe listesi.rme.

### 🧑‍💼 Yönetici Paneli (Admin)
-**Güvenli Giriş:** Kullanıcı adı ve şifre ile korunan yönetim paneli.

-**CRUD İşlemleri:**

   Ekleme: Yeni tüccar kaydı oluşturma (Şehir/İlçe bağlantılı).
   
   Güncelleme: Mevcut tüccar bilgilerini ve fiyatlarını revize etme.
   
   Silme: Sistemden tüccar kaydını kaldırma.

### 🛠️ Kullanılan Teknolojiler

**Python (Flask):** Web framework.

**MySQL:** Veritabanı yönetimi.

**HTML5 & CSS3:** Kullanıcı arayüzü tasarımı.

**PyMySQL:** Python ve MySQL bağlantısı için.

**Jinja2:** HTML şablon motoru.

### ⚙️ Kurulum ve Yapılandırma

**1. Veritabanı Kurulumu**

  -MySQL üzerinde findik_haritasi adında bir veritabanı oluşturun.
  
  -Proje kök dizinindeki VERÝ_TABANI_PROJE.sql dosyasını içe aktarın.
  
**2. Uygulama Yapılandırması**

  proje.py dosyasını açarak veritabanı bağlantı ayarlarını kendi yerel MySQL bilgilerinizle güncelleyin:
  
  ```python
  conn = pymysql.connect(
    host = 'localhost',
    user ='root',
    password = '', # Burayı MySQL şifrenizle doldurun
    db = 'findik_haritasi',
    port=3306 
  )
  ```

**3. Ortam Hazırlığı**

  Gerekli kütüphaneleri yükleyin ve uygulamayı başlatın:
  
  ```bash
  pip install flask pymysql
  python proje.py
  ```
  Uygulama varsayılan olarak http://127.0.0.1:5000 adresinde çalışacaktır.
  
**📂 Dosya Yapısı**

  ```plaintext
  Proje/
├── static/          # CSS 
├── templates/       # Jinja2 HTML şablonları
├── proje.py         # Ana Flask uygulaması 
└── database.sql     # SQL şeması ve örnek veriler
```

### GELİŞTİRİCİ: [ELİF ÖZTÜRK]
