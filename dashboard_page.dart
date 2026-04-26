import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {"icon": Icons.person, "title": "Profil", "color": Colors.pink},
    {"icon": Icons.shopping_cart, "title": "Transaksi", "color": Colors.orange},
    {"icon": Icons.receipt_long, "title": "Laporan", "color": Colors.blue},
    {"icon": Icons.payment, "title": "Pembayaran", "color": Colors.green},
    {"icon": Icons.inventory, "title": "Stok", "color": Colors.teal},
    {"icon": Icons.message, "title": "Pesan", "color": Colors.indigo},
    {"icon": Icons.notifications, "title": "Notifikasi", "color": Colors.red},
    {"icon": Icons.settings, "title": "Pengaturan", "color": Colors.grey},
    {"icon": Icons.help, "title": "Bantuan", "color": Colors.deepPurple},
    {"icon": Icons.info, "title": "Tentang", "color": Colors.brown},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),

        actions: [
          // ✅ LOGOUT BARU (ICON + TEKS)
          TextButton.icon(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/',
                (route) => false,
              );
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
            label: const Text(
              "Logout",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Selamat datang di Dashboard PADU",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: GridView.builder(
                itemCount: menuItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (context, index) {
                  final item = menuItems[index];

                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 4,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: item["color"].withOpacity(0.15),
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: item["color"],
                              child: Icon(
                                item["icon"],
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              item["title"],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}