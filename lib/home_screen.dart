import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 45, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Header con saludo
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Hi Julia",
                          style: TextStyle(
                            fontWeight: FontWeight.bold, 
                            fontSize: 30
                          ),
                        ),
                        Image.asset(
                          "assets/Images/hand.png",
                          height: 30,
                          width: 30,
                        ),
                      ],
                    ),
                    const Text(
                      "Today is a good day to learn something new!",
                      style: TextStyle(color: Colors.black54, fontSize: 17),
                    ),
                  ],
                ),
                Image.asset(
                  "assets/Images/profile.png",
                  height: 50,
                  width: 50,
                ),
              ],
            ),

            const SizedBox(height: 20),

            // 2. Filtros (Top - Design - Marketing)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip("Top", selected: true),
                  const SizedBox(width: 10),
                  _buildFilterChip("Design"),
                  const SizedBox(width: 10),
                  _buildFilterChip("Marketing"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 3. Título "Categories"
            const Text(
              "Categories",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 15),

            // 4. Grid de categorías
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.1,
                children: [
                  _buildCategoryCard(
                    "Graphic Design", 
                    "To customize", 
                    "assets/Images/graphic_design.png"
                  ),
                  _buildCategoryCard(
                    "Programming", 
                    "To complete", 
                    "assets/Images/programming.png"
                  ),
                  _buildCategoryCard(
                    "Finance", 
                    "If you want", 
                    "assets/Images/finance.png"
                  ),
                  _buildCategoryCard(
                    "UI/UX design", 
                    "22 minutes", 
                    "assets/Images/ui_design.png"
                  ),
                ],
              ),
            ),

            // 5. Footer con botón
Padding(
  padding: const EdgeInsets.only(bottom: 20),
  child: Center(
    child: ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        minimumSize: const Size(150, 50), // Este cierra styleFrom
      ), // <-- ¡Faltaba esta coma!
      child: const Text(
        "Get Started",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
  ),
),
          ],
        ),
      ),
    );
  }

  // Componente reutilizable para chips de filtro
  Widget _buildFilterChip(String text, {bool selected = false}) {
    return Chip(
      label: Text(text),
      backgroundColor: selected ? Colors.purple : Colors.grey[200],
      labelStyle: TextStyle(
        color: selected ? Colors.white : Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // Componente reutilizable para tarjetas de categoría
  Widget _buildCategoryCard(String title, String subtitle, String imagePath) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 100,
            width: 100,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}