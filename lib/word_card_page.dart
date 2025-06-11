import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:csv/csv.dart';

class WordCardPage extends StatefulWidget {
  const WordCardPage({super.key});

  @override
  State<WordCardPage> createState() => _WordCardPageState();
}

class _WordCardPageState extends State<WordCardPage> {
  List<List<dynamic>> words = [];
  int current = 0;
  final FlutterTts flutterTts = FlutterTts();
  bool loading = true;

  @override
  void initState() {
    super.initState();
    print('initState: 앱 시작');
    fetchWords();
  }

  Future<void> fetchWords() async {
    print('fetchWords: 데이터 요청 시작');
    final url =
        'https://docs.google.com/spreadsheets/d/1n_fTqnQqylb8DAenIZV12lWAIZ0bRdT4Xk70VTvlXr0/gviz/tq?tqx=out:csv&sheet=sheet1';
    final response = await http.get(Uri.parse(url));
    print('fetchWords: 응답 statusCode = \\${response.statusCode}');
    if (response.statusCode == 200) {
      print(
          'fetchWords: 응답 body 일부 = \\${response.body.substring(0, response.body.length > 100 ? 100 : response.body.length)}');
      // 줄바꿈 문제 해결을 위해 eol 명시
      final csvTable = CsvToListConverter(eol: '\n').convert(response.body);
      List<List<dynamic>> dataTable = csvTable;
      if (csvTable.length <= 1) {
        print('csvTable 길이가 1: eol을 \r\n으로 재시도');
        final csvTable2 =
            CsvToListConverter(eol: '\r\n').convert(response.body);
        print('csvTable2 길이 = \\${csvTable2.length}');
        if (csvTable2.length > 1) {
          dataTable = csvTable2;
        }
      }
      print('fetchWords: 파싱된 dataTable 길이 = \\${dataTable.length}');
      if (dataTable.length > 1) {
        // 헤더를 제외한 데이터만 섞기
        final header = dataTable.first;
        final data = List<List<dynamic>>.from(dataTable.skip(1));
        data.shuffle(Random());
        if (!mounted) return;
        setState(() {
          words = [header, ...data];
          loading = false;
        });
        print('fetchWords: setState 후 words.length = \\${words.length} (셔플됨)');
      } else {
        if (!mounted) return;
        setState(() {
          words = dataTable;
          loading = false;
        });
        print('fetchWords: setState 후 words.length = \\${words.length}');
      }
    } else {
      print('fetchWords: 에러 발생!');
    }
  }

  void _nextWord() {
    print('_nextWord: 다음 단어로 이동 (current: \\${current})');
    setState(() {
      current = (current + 1) % (words.length - 1);
    });
    print('_nextWord: 이동 후 current = \\${current}');
  }

  void _speak() async {
    print('_speak: 발음 듣기 버튼 클릭');
    if (words.length > 1) {
      print('_speak: 읽을 단어 = \\${words[current + 1][1]}');
      await flutterTts.setLanguage('ko-KR');
      await flutterTts.speak(words[current + 1][1].toString());
    }
  }

  Widget _pronunciationRow(List<dynamic> word) {
    // 4번째 열(발음)이 있으면 예쁘게 보여줌
    if (word.length > 3 && word[3].toString().trim().isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 8),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFAF3E3),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.brown.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.record_voice_over,
                  color: Color(0xFFff9800), size: 22),
              const SizedBox(width: 8),
              Text(
                word[3].toString(),
                style: const TextStyle(
                  fontSize: 19,
                  color: Color(0xFFff9800),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.1,
                  fontFamily: 'Arial',
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    print(
        'build: loading=\\$loading, words.length=\\${words.length}, current=\\$current');
    if (loading || words.length < 2) {
      print('build: 로딩 중 또는 데이터 부족');
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    // 첫 행은 헤더이므로, 실제 데이터는 words[current+1]
    final word = words[current + 1];
    print('build: 현재 단어 = \\${word}');
    // word: [id, korean_word, turkish_meaning, pronunciation]
    return Scaffold(
      backgroundColor: const Color(0xFFF0FFF4),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 350),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 28),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // 귀여운 아이콘
                  const Icon(Icons.eco, size: 48, color: Color(0xFF43A047)),
                  const SizedBox(height: 18),
                  // 한국어 단어
                  Text(
                    word[1].toString(),
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2E7D32),
                      letterSpacing: 2,
                    ),
                  ),
                  // 발음(로마자) 표시
                  _pronunciationRow(word),
                  const SizedBox(height: 12),
                  // 터키어 뜻
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                    decoration: BoxDecoration(
                      color: Color(0xFFE8F5E9),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      word[2].toString(),
                      style: const TextStyle(
                        fontSize: 22,
                        color: Color(0xFF388E3C),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // 발음 듣기 버튼
                  ElevatedButton.icon(
                    onPressed: _speak,
                    icon: const Icon(Icons.volume_up_rounded,
                        color: Color(0xFF43A047)),
                    label: const Text('Dinle', style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFC8E6C9),
                      foregroundColor: Color(0xFF2E7D32),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      elevation: 2,
                    ),
                  ),
                  const SizedBox(height: 18),
                  // 다음 버튼
                  OutlinedButton(
                    onPressed: _nextWord,
                    style: OutlinedButton.styleFrom(
                      side:
                          const BorderSide(color: Color(0xFF43A047), width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 12),
                    ),
                    child: const Text(
                      'Sonraki',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF43A047),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // 인덱스 표시
                  Text(
                    '${(current + 1).toString()} / ${words.length - 1}',
                    style: TextStyle(fontSize: 14, color: Color(0xFF81C784)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
