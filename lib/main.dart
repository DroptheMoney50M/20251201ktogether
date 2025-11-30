import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart'; // 업그레이더 패키지 import
import 'package:shared_preferences/shared_preferences.dart';

import './word_card_page.dart';
import './school_info_page.dart';
import './FavoritedWordsPage.dart';
import './lecture_page.dart';
import './halal_food_page.dart';
import './taxi_page.dart';
import './shopping_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Korean Quiz for Turkish',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // 업그레이더 적용: home을 UpgradeAlert로 감쌈
      home: UpgradeAlert(
        upgrader: Upgrader(
          messages: UpgraderMessages(code: 'tr'), // 터키어 메시지
        ),
        child: const MainNavigation(),
      ),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;
  List<Map<String, String>> favoritedWords = [];

  @override
  void initState() {
    super.initState();
    _loadFavoritedWords();
  }

  void _loadFavoritedWords() async {
    final prefs = await SharedPreferences.getInstance();
    final savedWords = prefs.getStringList('favoritedWords') ?? [];
    setState(() {
      favoritedWords = savedWords
          .map((word) => Map<String, String>.from(
              Map<String, dynamic>.from(Uri.splitQueryString(word))))
          .toList();
    });
  }

  void _saveFavoritedWords() async {
    final prefs = await SharedPreferences.getInstance();
    final savedWords =
        favoritedWords.map((word) => Uri(queryParameters: word).query).toList();
    await prefs.setStringList('favoritedWords', savedWords);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildMorePage() {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daha Fazla',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF2E7D32),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFF2E7D32).withOpacity(0.1),
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildMenuCard(
              title: 'Kelime Kartları',
              subtitle: 'Korece kelimeler öğren',
              icon: Icons.menu_book,
              color: Colors.blue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WordCardPage(
                      onFavorite: (word) {
                        setState(() {
                          favoritedWords.add(word);
                          _saveFavoritedWords();
                        });
                      },
                    ),
                  ),
                );
              },
            ),
            _buildMenuCard(
              title: 'Dersler',
              subtitle: 'Korece dersleri izle',
              icon: Icons.play_lesson,
              color: Colors.orange,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LecturePage(),
                  ),
                );
              },
            ),
            _buildMenuCard(
              title: 'Favoriler',
              subtitle: 'Kaydettiğin kelimeler',
              icon: Icons.favorite,
              color: Colors.pink,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FavoritedWordsPage(favoritedWords: favoritedWords),
                  ),
                );
              },
            ),
            _buildMenuCard(
              title: 'Yurtdışı Eğitim',
              subtitle: 'Kore\'de okul bilgileri',
              icon: Icons.school,
              color: Colors.purple,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SchoolInfoPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.1), Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, size: 32, color: color),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.grey[400], size: 20),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      const HalalFoodPage(),
      const TaxiPage(),
      const ShoppingPage(),
      _buildMorePage(),
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Helal', // 할랄
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_taxi),
            label: 'Taksi', // 택시
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Alışveriş', // 쇼핑
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Daha Fazla', // 더보기
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF2E7D32),
        unselectedItemColor: const Color(0xFF81C784),
        backgroundColor: const Color(0xFFF0FFF4),
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        unselectedFontSize: 11,
      ),
    );
  }
}
