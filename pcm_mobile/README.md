# CLB Pickleball Vợt Thủ Phố Núi

Ứng dụng **CLB Pickleball Vợt Thủ Phố Núi** là ứng dụng Flutter dùng để quản lý câu lạc bộ PickleBall, bao gồm: hội viên, sân bóng, giải đấu, tài chính và dashboard tổng quan. Dự án được xây dựng theo mô hình rõ ràng (models – pages – screens – services) để dễ mở rộng và bảo trì.

---

## 1. Công nghệ sử dụng

* **Flutter** (UI)
* **Dart** (ngôn ngữ lập trình)
* **REST API** (kết nối backend)
* **Visual Studio Code** / **Android Studio**

---

## 2. Cấu trúc thư mục

```text
pcm_mobile/
│
├── lib/
│   ├── data/
│   │   └── (chứa dữ liệu tạm / mock data nếu có)
│   │
│   ├── models/
│   │   ├── club.dart                # Model CLB
│   │   ├── court.dart               # Model sân bóng
│   │   ├── login_request.dart       # Model đăng nhập
│   │   ├── member.dart              # Model hội viên
│   │   ├── tournament.dart          # Model giải đấu
│   │   └── transaction_model.dart   # Model giao dịch tài chính
│   │
│   ├── pages/                       # Các page chính (layout lớn)
│   │   ├── dashboard_home.dart
│   │   ├── dashboard_page.dart
│   │   ├── home_page.dart
│   │   ├── login_page.dart
│   │   ├── member_page.dart
│   │   ├── tournament_page.dart
│   │   ├── court_page.dart
│   │   └── finance_page.dart
│   │
│   ├── screens/                     # Các màn hình / dialog chi tiết
│   │   ├── login_screen.dart
│   │   ├── home_screen.dart
│   │   ├── member_list_screen.dart
│   │   ├── add_member_screen.dart
│   │   ├── add_tournament_screen.dart
│   │   ├── add_transaction_dialog.dart
│   │   └── transaction_table.dart
│   │
│   ├── services/
│   │   └── api_service.dart          # Gọi API backend
│   │
│   └── main.dart                    # Entry point của app
│
└── pubspec.yaml
```

---

## 3. Luồng chức năng chính

### 3.1 Đăng nhập

* Người dùng nhập tài khoản và mật khẩu
* `login_screen.dart` → gọi `ApiService.login()`
* Đăng nhập thành công sẽ chuyển sang Dashboard

### 3.2 Dashboard

* Hiển thị tổng quan: số hội viên, số sân, số giải đấu, tài chính
* Điều hướng sang các chức năng bên trái (sidebar)

### 3.3 Quản lý giải đấu

* Xem danh sách giải đấu (`tournament_page.dart`)
* Nhấn **Tạo giải** → mở `add_tournament_screen.dart`
* Sau khi lưu thành công:

  * Gọi API tạo giải
  * Cập nhật lại danh sách giải đấu

### 3.4 Quản lý hội viên

* Xem danh sách hội viên
* Thêm hội viên mới
* Hiển thị chi tiết hội viên

### 3.5 Quản lý tài chính

* Ghi nhận giao dịch thu / chi
* Hiển thị bảng giao dịch

---

## 4. Quy ước code

* **Model**: chỉ chứa dữ liệu + `fromJson()` / `toJson()`
* **Service**: chỉ xử lý gọi API
* **Page**: layout chính (Scaffold, AppBar, Drawer)
* **Screen**: màn hình con, form, dialog

---

## 5. Cách chạy project

```bash
flutter pub get
flutter run
```

> Lưu ý: cần cấu hình đúng `baseUrl` trong `api_service.dart`

---

## 6. Hướng phát triển thêm

* Phân quyền (Admin / Member)
* Thống kê biểu đồ (Chart)
* Upload ảnh giải đấu
* Push notification

---

## 7. Tác giả

* Dự án học tập Flutter
* CLB Pickleball Vợt Thủ Phố Núi
