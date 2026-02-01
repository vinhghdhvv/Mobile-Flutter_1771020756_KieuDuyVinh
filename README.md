# CLB Pickleball Vợt Thủ Phố Núi
Ứng dụng CLB Pickleball Vợt Thủ Phố Núi là ứng dụng Flutter dùng để quản lý câu lạc bộ PickleBall, bao gồm: hội viên, sân bóng, giải đấu, tài chính và dashboard tổng quan. Dự án được xây dựng theo mô hình rõ ràng (models – pages – screens – services) để dễ mở rộng và bảo trì.
## 1. Thông tin sinh viên

* **Họ và tên**: Kiều Duy Vinh
* **Mã sinh viên**: 1771020756
* **Lớp / Môn học**: 17.08 – Mobile App

---

## 2. Cấu trúc Repository
MOBILE_FLUTTER_1771020756_KIEU_DUY_VINH
│
├── Backend/
│ └── PCM.Backend/
│ ├── Controllers/ # Các API Controller
│ │ ├── AuthController.cs # Đăng nhập / đăng ký
│ │ ├── ClubsController.cs # Quản lý CLB
│ │ ├── CourtsController.cs # Quản lý sân bóng
│ │ └── MembersController.cs # Quản lý hội viên
│ │
│ ├── Data/
│ │ └── ApplicationDbContext.cs # DbContext (Entity Framework)
│ │
│ ├── DTOs/ # Data Transfer Objects
│ │ ├── LoginDto.cs
│ │ └── RegisterDto.cs
│ │
│ ├── Helpers/ # Class hỗ trợ (JWT, Utils…)
│ ├── Hubs/ # SignalR (nếu có)
│ ├── Migrations/ # Migration database
│ │
│ ├── Models/ # Entity Model
│ │ ├── ApplicationUser.cs
│ │ ├── Booking.cs
│ │ ├── Club.cs
│ │ ├── Court.cs
│ │ └── Member.cs
│ │
│ ├── Services/ # Business logic
│ │
│ ├── appsettings.json
│ ├── appsettings.Development.json
│ └── PCM.Backend.csproj
│
├── pcm_mobile/
│ ├── lib/
│ │ ├── data/ # Dữ liệu tạm / mock data
│ │ │
│ │ ├── models/ # Model dữ liệu
│ │ │ ├── club.dart # Model CLB
│ │ │ ├── court.dart # Model sân bóng
│ │ │ ├── login_request.dart # Model đăng nhập
│ │ │ ├── member.dart # Model hội viên
│ │ │ ├── tournament.dart # Model giải đấu
│ │ │ └── transaction_model.dart # Model giao dịch tài chính
│ │ │
│ │ ├── pages/ # Các page chính (layout lớn)
│ │ │ ├── dashboard_home.dart
│ │ │ ├── dashboard_page.dart
│ │ │ ├── home_page.dart
│ │ │ ├── login_page.dart
│ │ │ ├── member_page.dart
│ │ │ ├── tournament_page.dart
│ │ │ ├── court_page.dart
│ │ │ └── finance_page.dart
│ │ │
│ │ ├── screens/ # Màn hình chi tiết / dialog
│ │ │ ├── login_screen.dart
│ │ │ ├── home_screen.dart
│ │ │ ├── member_list_screen.dart
│ │ │ ├── add_member_screen.dart
│ │ │ ├── add_tournament_screen.dart
│ │ │ ├── add_transaction_dialog.dart
│ │ │ └── transaction_table.dart
│ │ │
│ │ ├── services/
│ │ │ └── api_service.dart # Gọi API backend
│ │ │
│ │ └── main.dart # Entry point của Flutter app
│ │
│ └── pubspec.yaml

## 3. Công nghệ sử dụng

### 🔹 Backend

* ASP.NET Core Web API
* Entity Framework Core
* SQL Server
* Swagger (test API)

### 🔹 Mobile App

* Flutter
* Dart
* REST API

---

## 4. Hướng dẫn chạy Backend (từ Terminal mới mở)

```bash
cd D:\HOC TAP\MOBILE_FLUTTER_1771020756_KIEU DUY VINH
cd Backend
cd PCM.Backend

dotnet restore
dotnet ef database update
dotnet run
```

👉 Sau khi chạy thành công:

* Swagger: `https://localhost:xxxx/swagger`
* API test ví dụ:

  * `GET /api/Clubs`
  * `GET /api/Courts`

---

## 5. Ví dụ chứng minh Backend đang hoạt động

### Ví dụ 1: Test Swagger

* Mở trình duyệt → vào link Swagger
* Gọi API `GET /api/Clubs`
* Nếu trả về danh sách JSON → Backend **đang sống** ✅

### Ví dụ 2: Test trên trình duyệt / Postman

```
http://localhost:xxxx/api/Members
```

* Trả về dữ liệu JSON → Backend **hoạt động bình thường** ✅

---

## 6. Hướng dẫn chạy Mobile App (Flutter)

```bash
cd D:\HOC TAP\MOBILE_FLUTTER_1771020756_KIEU DUY VINH
cd pcm_mobile

flutter pub get
flutter run
```

📌 Lưu ý:

* Backend phải chạy trước
* Kiểm tra lại `baseUrl` API trong Flutter

---

## 7. Link Repository (Source Code)

👉 *(Dán link GitHub repository tại đây)*

---

## 8. Link Sản phẩm Online / Deploy

* Backend: Swagger / API Endpoint (Localhost)
* Mobile: Chạy trực tiếp trên Emulator / Máy thật

---

## 9. Link Video Demo

👉 *(YouTube – Unlisted hoặc Google Drive – View)*

### Nội dung video demo gồm:

1. Mở Backend và chạy `dotnet run`
2. Mở Swagger gọi API
3. Chạy Flutter App
4. Thao tác đăng nhập / xem dữ liệu

---

## 10. Tài khoản Test

* **Username**: admin@gmail.com
* **Password**: 123456

---

## 11. Ghi chú

* Video quay trên môi trường thật (Laptop)
* Có đầy đủ source code + README
* Đảm bảo giảng viên có thể chạy lại dự án dễ dàng

---

