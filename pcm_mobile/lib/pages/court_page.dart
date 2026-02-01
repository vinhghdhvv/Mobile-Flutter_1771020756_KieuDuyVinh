import 'package:flutter/material.dart';
import '../models/court.dart';

class CourtPage extends StatefulWidget {
  const CourtPage({super.key});

  @override
  State<CourtPage> createState() => _CourtPageState();
}

class _CourtPageState extends State<CourtPage> {
  List<Court> courts = [
    Court(
      id: 1,
      name: 'Sân 1',
      price: 150000,
      active: true,
      imageUrl: 'assets/images/san1.jpg',
      type: 'Trong nhà',
      description: 'Sân trong nhà có mái che',
    ),
    Court(
      id: 2,
      name: 'Sân 2',
      price: 120000,
      active: true,
      imageUrl: 'assets/images/san2.jpg',
      type: 'Ngoài trời',
      description: 'Sân ngoài trời, ánh sáng tự nhiên',
    ),
    Court(
      id: 3,
      name: 'Sân 3',
      price: 200000,
      active: true,
      imageUrl: 'assets/images/san3.jpg',
      type: 'Trong nhà',
      description: 'Sân VIP đèn LED',
    ),
  ];

  // ===== THÊM SÂN (demo) =====
  void _addCourt() {
    setState(() {
      courts.add(
        Court(
          id: courts.length + 1,
          name: 'Sân mới',
          price: 230000,
          active: true,
          imageUrl: 'assets/images/san4.jpg',
          type: 'Trong nhà',
          description: 'Sân mới thêm',
        ),
      );
    });
  }

  void _deleteCourt(Court court) {
    setState(() {
      courts.remove(court);
    });
  }

  void _bookCourt(Court court) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Đặt ${court.name} thành công')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách sân'),
        actions: [
          ElevatedButton.icon(
            onPressed: _addCourt,
            icon: const Icon(Icons.add),
            label: const Text('Thêm sân'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.68,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: courts.length,
        itemBuilder: (context, index) {
          return _courtCard(courts[index]);
        },
      ),
    );
  }

  Widget _courtCard(Court court) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(court.imageUrl, fit: BoxFit.cover),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Chip(label: Text(court.type)),
                      const Chip(
                        label: Text('Hoạt động'),
                        backgroundColor: Colors.greenAccent,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    court.name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    court.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text('${court.price.toStringAsFixed(0)} đ/giờ'),
                    backgroundColor: Colors.amber.shade200,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => _bookCourt(court),
                        child: const Text(
                          'Đặt sân',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, size: 20),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete,
                                size: 20, color: Colors.red),
                            onPressed: () => _deleteCourt(court),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
