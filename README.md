# 📰 News Project

News Project, Angular kullanılarak geliştirilmiş bir haber uygulamasıdır. Proje, Angular ve web geliştirme teknolojileri üzerine pratik yapmak amacıyla geliştirilmiştir.

Uygulama Docker desteğine sahiptir ve gerekli geliştirme ortamını bilgisayara ayrıca kurmadan Docker üzerinden çalıştırılabilir.

---

## 🛠️ Kullanılan Teknolojiler

- Angular 18
- TypeScript
- Bootstrap
- RxJS
- Angular SSR
- Docker
- Docker Compose

---

## 📁 Proje Yapısı

```text
News-Project/
│
├── src/                  # Angular kaynak kodları
├── public/               # Statik dosyalar
├── angular.json          # Angular yapılandırması
├── package.json          # Proje bağımlılıkları ve npm scriptleri
├── package-lock.json     # Bağımlılıkların kilitlenmiş sürümleri
├── Dockerfile            # Docker image oluşturma yapılandırması
├── docker-compose.yml    # Docker Compose yapılandırması
├── .dockerignore         # Docker build dışında bırakılan dosyalar
└── README.md
```

---

# 🚀 Projeyi Çalıştırma

Projeyi iki farklı şekilde çalıştırabilirsiniz:

1. Docker ile
2. Lokal geliştirme ortamında Node.js ile

Docker ile çalıştırma, gerekli ortamın container içerisinde hazırlanmasını sağladığı için en kolay yöntemdir.

---

# 🐳 Docker ile Çalıştırma

## Gereksinimler

Docker ile çalıştırmak için bilgisayarınızda aşağıdakilerin kurulu olması gerekir:

- Git
- Docker Desktop

> **Not:** Docker ile çalıştırırken Node.js, npm veya Angular CLI'ın bilgisayarınızda kurulu olması gerekmez. Gerekli ortam Docker container içerisinde oluşturulur.

---

## 1. Projeyi Klonlayın

Terminali açarak aşağıdaki komutu çalıştırın:

```bash
git clone https://github.com/seymanurhanzade/News-Project.git
```

Ardından proje klasörüne geçin:

```bash
cd News-Project
```

---

## 2. Docker ile Projeyi Başlatın

Docker Desktop'ın çalıştığından emin olun.

Ardından proje klasöründe:

```bash
docker compose up --build
```

komutunu çalıştırın.

Bu komut:

- Docker image'ını oluşturur.
- Node.js ortamını hazırlar.
- Projenin npm bağımlılıklarını yükler.
- Angular uygulamasını build eder.
- Docker container'ını oluşturur.
- Uygulamayı çalıştırır.

İlk çalıştırmada Docker image oluşturulacağı ve npm paketleri yükleneceği için işlem biraz zaman alabilir.

---

## 3. Uygulamayı Açın

Container başarıyla çalıştıktan sonra uygulamaya aşağıdaki adres üzerinden ulaşabilirsiniz:

```text
http://localhost:4000
```

---

## Docker Container'ını Durdurma

Container'ı durdurmak için terminalde:

```bash
Ctrl + C
```

kullanabilirsiniz.

Container'ları kaldırmak için:

```bash
docker compose down
```

komutunu çalıştırabilirsiniz.

---

## Projeyi Tekrar Çalıştırma

Docker image daha önce oluşturulduysa:

```bash
docker compose up
```

komutu yeterlidir.

Dockerfile'da, bağımlılıklarda veya build sürecinde değişiklik yaptıysanız image'ı yeniden oluşturmak için:

```bash
docker compose up --build
```

kullanabilirsiniz.

---

# 💻 Docker Kullanmadan Çalıştırma

Projeyi Docker kullanmadan geliştirme ortamında çalıştırmak da mümkündür.

## Gereksinimler

Bilgisayarınızda aşağıdakilerin kurulu olması gerekir:

- Node.js
- npm
- Git

---

## 1. Projeyi Klonlayın

```bash
git clone https://github.com/seymanurhanzade/News-Project.git
```

Proje klasörüne geçin:

```bash
cd News-Project
```

---

## 2. Bağımlılıkları Yükleyin

```bash
npm install
```

---

## 3. Development Server'ı Başlatın

```bash
npm start
```

veya:

```bash
ng serve
```

Uygulama geliştirme ortamında varsayılan olarak:

```text
http://localhost:4200
```

adresinde çalışacaktır.

---

# 🏗️ Production Build

Projeyi production için build etmek için:

```bash
npm run build
```

komutunu kullanabilirsiniz.

Build işlemi tamamlandıktan sonra oluşturulan dosyalar:

```text
dist/
```

klasörü altında bulunur.

---

# 🐳 Docker Yapısı

Projede multi-stage Docker build kullanılmaktadır.

İlk aşamada Node.js image'ı kullanılarak Angular projesinin bağımlılıkları yüklenir ve uygulama build edilir.

```text
Angular Source Code
        │
        ▼
     Node.js
        │
        ▼
      npm ci
        │
        ▼
  npm run build
        │
        ▼
      dist/
```

İkinci aşamada production ortamı hazırlanır ve Angular SSR uygulaması Node.js üzerinden çalıştırılır.

Bu yaklaşım build ve çalışma ortamlarının birbirinden ayrılmasını sağlar.

---

# ⚙️ Docker Compose

Proje Docker Compose ile çalıştırılabilir.

`docker-compose.yml` içerisinde frontend servisi tanımlanmıştır.

```yaml
services:
  frontend:
    build:
      context: .
      dockerfile: Dockerfile

    ports:
      - "4000:4000"
```

Port tanımlamasındaki:

```text
4000:4000
```

değeri:

```text
HOST PORT : CONTAINER PORT
```

anlamına gelir.

Bu nedenle uygulamaya bilgisayar üzerinden:

```text
http://localhost:4000
```

adresiyle erişilebilir.

---

# 📦 Dockerfile

Projede Angular SSR uygulamasını build etmek ve çalıştırmak için multi-stage Dockerfile kullanılmaktadır.

Build aşamasında uygulama derlenir, production aşamasında ise oluşturulan SSR server çalıştırılır.

Bu sayede uygulamanın geliştirme ortamına bağımlı olmadan Docker container içerisinde çalıştırılması sağlanır.

---

# 🔧 Faydalı Docker Komutları

Projeyi build ederek başlatmak:

```bash
docker compose up --build
```

Projeyi başlatmak:

```bash
docker compose up
```

Container'ları durdurmak ve kaldırmak:

```bash
docker compose down
```

Çalışan container'ları görüntülemek:

```bash
docker ps
```

Docker image'larını görüntülemek:

```bash
docker images
```

---

# 📌 Notlar

- Docker ile çalıştırırken lokal Node.js veya Angular CLI kurulumu gerekli değildir.
- Docker Desktop çalışır durumda olmalıdır.
- Docker üzerinden uygulama `4000` portunda çalışır.
- Lokal Angular development server varsayılan olarak `4200` portunda çalışır.
- İlk Docker build işlemi bağımlılıkların indirilmesi nedeniyle daha uzun sürebilir.

---

# 👩‍💻 Geliştirici

**Şeyma Nur Hanzade**

Bu proje web geliştirme, Angular ve Docker teknolojileri üzerinde pratik yapmak ve yazılım geliştirme becerilerini geliştirmek amacıyla hazırlanmıştır.