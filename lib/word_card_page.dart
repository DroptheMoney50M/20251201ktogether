import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:http/http.dart' as http;
import 'package:csv/csv.dart';

class WordCardPage extends StatefulWidget {
  final Function(Map<String, String>) onFavorite;

  const WordCardPage({super.key, required this.onFavorite});

  @override
  State<WordCardPage> createState() => _WordCardPageState();
}

class _WordCardPageState extends State<WordCardPage> {
  List<List<dynamic>> allWords = [];
  List<List<dynamic>> words = [];
  List<String> categories = ['Tümü'];
  String selectedCategory = 'Tümü';
  int current = 0;
  final FlutterTts flutterTts = FlutterTts();
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchWords();
  }

  Future<void> fetchWords() async {
    final url = 'https://docs.google.com/spreadsheets/d/1n_fTqnQqylb8DAenIZV12lWAIZ0bRdT4Xk70VTvlXr0/gviz/tq?tqx=out:csv&sheet=sheet1';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final csvTable = CsvToListConverter(eol: '\n').convert(response.body);
      List<List<dynamic>> dataTable = csvTable;
      if (csvTable.length <= 1) {
        final csvTable2 = CsvToListConverter(eol: '\r\n').convert(response.body);
        if (csvTable2.length > 1) {
          dataTable = csvTable2;
        }
      }
      if (dataTable.isNotEmpty) {
        List<List<dynamic>> body = dataTable.sublist(1);
        Set<String> catSet = {};
        for (var row in body) {
          if (row.length > 4 && row[4] != null) {
            catSet.add(row[4].toString());
          }
        }
        setState(() {
          allWords = body;
          words = [dataTable[0], ...body];
          categories = ['Tümü', ...catSet.toList()];
          loading = false;
          current = 0;
        });
      }
    }
  }

  void _changeCategory(String cat) {
    setState(() {
      selectedCategory = cat;
      if (cat == 'Tümü') {
        words = [allWords.first, ...allWords.sublist(1)];
      } else {
        words = [
          allWords.first,
          ...allWords.sublist(1).where((row) => row.length > 4 && row[4] == cat).toList()
        ];
      }
      current = 0;
    });
  }

  void _nextWord() {
    if (current < words.length - 2) {
      setState(() => current++);
    } else {
      setState(() => current = 0);
    }
  }

  void _speak() async {
    final word = words[current + 1];
    await flutterTts.setLanguage("ko-KR");
    await flutterTts.speak(word[1].toString());
  }

  void _addToFavorite() {
    final word = words[current + 1];
    final favoriteWord = {
      'korean': word[1].toString(),
      'turkish': word[2].toString(),
    };
    widget.onFavorite(favoriteWord);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Favorilere eklendi'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(
        backgroundColor: Color(0xFFF0FFF4),
        body: Center(child: CircularProgressIndicator()),
      );
    }
    if (words.length <= 1) {
      return const Scaffold(
        backgroundColor: Color(0xFFF0FFF4),
        body: Center(child: Text('Veri bulunamadı')),
      );
    }
    final word = words[current + 1];
    return Scaffold(
      backgroundColor: const Color(0xFFF0FFF4),
      appBar: AppBar(
        title: const Text(
          'Kelime Kartları',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF43A047),
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 350),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 8),
                child: SizedBox(
                  height: 40,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    separatorBuilder: (context, idx) => const SizedBox(width: 8),
                    itemBuilder: (context, idx) {
                      final cat = categories[idx];
                      final selected = selectedCategory == cat;
                      return GestureDetector(
                        onTap: () => _changeCategory(cat),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: selected ? const Color(0xFF43A047) : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: const Color(0xFF43A047), width: 2),
                          ),
                          child: Center(
                            child: Text(
                              cat,
                              style: TextStyle(
                                color: selected ? Colors.white : const Color(0xFF388E3C),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 28),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        word[1].toString(),
                        style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Color(0xFF2E7D32)),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFC8E6C9),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          word[2].toString(),
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Color(0xFF1B5E20)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: _speak,
                        icon: const Icon(Icons.volume_up, size: 28),
                        label: const Text('Dinle', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF43A047),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          elevation: 4,
                        ),
                      ),
                      const SizedBox(height: 18),
                      OutlinedButton.icon(
                        onPressed: _addToFavorite,
                        icon: const Icon(Icons.favorite_border, size: 24),
                        label: const Text('Favorilere Ekle', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.pink, width: 2),
                          foregroundColor: Colors.pink,
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        ),
                      ),
                      const SizedBox(height: 18),
                      OutlinedButton(
                        onPressed: _nextWord,
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFF43A047), width: 2),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        ),
                        child: const Text('Sonraki', style: TextStyle(fontSize: 18, color: Color(0xFF43A047), fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${(current + 1).toString()} / ${words.length - 1}',
                        style: const TextStyle(fontSize: 14, color: Color(0xFF81C784)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
