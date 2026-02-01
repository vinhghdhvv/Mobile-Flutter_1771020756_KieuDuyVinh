import 'package:flutter/material.dart';
import 'dashboard_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  void _login(BuildContext context, String role) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const DashboardPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // ===== BACKGROUND =====
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pickleball_bg.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.blue.withOpacity(0.55),
              BlendMode.overlay,
            ),
          ),
        ),

        // ===== CENTER CARD =====
        child: Center(
          child: Container(
            width: 420,
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.96),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 25,
                  offset: Offset(0, 12),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // LOGO
                const Icon(
                  Icons.sports_tennis,
                  size: 64,
                  color: Colors.blue,
                ),
                const SizedBox(height: 12),

                const Text(
                  'CLB PickleBall Vợt Thủ Phố Núi',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),
                const Text(
                  'Đăng nhập hệ thống quản lý',
                  style: TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 24),

                // EMAIL
                const TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Email hoặc tên đăng nhập',
                  ),
                ),

                const SizedBox(height: 16),

                // PASSWORD
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Mật khẩu',
                  ),
                ),

                const SizedBox(height: 24),

                // LOGIN BUTTON
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _login(context, 'admin'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'ĐĂNG NHẬP',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                const Divider(),

                const Text(
                  'Tài khoản DEMO',
                  style: TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 12),

                // DEMO ROLES
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    _demoButton(context, 'Admin'),
                    _demoButton(context, 'Thủ quỹ'),
                    _demoButton(context, 'Trọng tài'),
                    _demoButton(context, 'Hội viên'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _demoButton(BuildContext context, String role) {
    return OutlinedButton(
      onPressed: () => _login(context, role),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(role),
    );
  }
}
