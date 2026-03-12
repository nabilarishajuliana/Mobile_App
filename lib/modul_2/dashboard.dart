import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            // ======================
            // 1️⃣ CONTAINER DALAM COLUMN
            // ======================
            const SizedBox(height: 20),

            Container(
              width: 350,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.pink.shade200,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(
                child: Text(
                  "Welcome, Admin",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ======================
            // 2️⃣ ROW
            // ======================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _menuBox(Icons.home, "Home"),
                _menuBox(Icons.person, "Profile"),
                _menuBox(Icons.settings, "Setting"),
              ],
            ),

            const SizedBox(height: 30),

            // ======================
            // 3️⃣ STACK
            // ======================
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 350,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.purple.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const Text(
                  "Stack Widget ",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // ======================
            // 4️⃣ GRIDVIEW
            // ======================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  _gridBox(Colors.blue, "Grid 1"),
                  _gridBox(Colors.green, "Grid 2"),
                  _gridBox(Colors.orange, "Grid 3"),
                  _gridBox(Colors.red, "Grid 4"),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ======================
            // 5️⃣ LISTVIEW
            // ======================
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.star, color: Colors.pink),
                  title: Text("List Item ${index + 1}"),
                  subtitle: const Text("Ini ListView"),
                );
              },
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // ======================
  // WIDGET MENU BOX (ROW)
  // ======================
  Widget _menuBox(IconData icon, String title) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        color: Colors.pink.shade100,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30),
          const SizedBox(height: 5),
          Text(title),
        ],
      ),
    );
  }

  // ======================
  // WIDGET GRID BOX
  // ======================
  Widget _gridBox(Color color, String text) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}