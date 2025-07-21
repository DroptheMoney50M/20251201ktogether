import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class LecturePage extends StatefulWidget {
  const LecturePage({super.key});

  @override
  State<LecturePage> createState() => _LecturePageState();
}

class _LecturePageState extends State<LecturePage> {
  final FlutterTts flutterTts = FlutterTts();

  Future<void> _speak(String text) async {
    await flutterTts.setLanguage('ko-KR');
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          'Kore Dili Dersleri',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 환영 메시지
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1976D2), Color(0xFF42A5F5)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.school,
                    size: 48,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Korece Öğrenmeye Başlayın!',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Adım adım Korece öğrenin',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'Ders Konuları',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1565C0),
              ),
            ),
            const SizedBox(height: 16),

            // 강의 목록
            Expanded(
              child: ListView(
                children: [
                  _buildLectureCard(
                    context,
                    title: '1. 한글 배우기',
                    subtitle: 'Hangul Öğrenme',
                    description: 'Kore alfabesini öğrenin',
                    icon: Icons.text_fields,
                    color: const Color(0xFF4CAF50),
                    onTap: () => _navigateToHangulLesson(context),
                  ),
                  const SizedBox(height: 16),
                  _buildLectureCard(
                    context,
                    title: '2. 기본 인사 & 자기소개',
                    subtitle: 'Temel Selamlaşma & Tanıtım',
                    description: 'Günlük selamlaşma ve kendini tanıtma',
                    icon: Icons.waving_hand,
                    color: const Color(0xFFFF9800),
                    onTap: () => _navigateToGreetingLesson(context),
                  ),
                  const SizedBox(height: 16),

                  // 곧 출시될 강의들
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.construction,
                          size: 32,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Yakında Gelecek Dersler',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '• Sayılar & Zaman\n• Aile & İlişkiler\n• Yemek & İçecek\n• Alışveriş & Para',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLectureCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String description,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.1),
                color.withOpacity(0.05),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: color.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  icon,
                  size: 32,
                  color: Colors.white,
                ),
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
                        color: color,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToHangulLesson(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HangulLessonPage(),
      ),
    );
  }

  void _navigateToGreetingLesson(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const GreetingLessonPage(),
      ),
    );
  }
}

// 한글 배우기 강의 페이지
class HangulLessonPage extends StatefulWidget {
  const HangulLessonPage({super.key});

  @override
  State<HangulLessonPage> createState() => _HangulLessonPageState();
}

class _HangulLessonPageState extends State<HangulLessonPage> {
  final FlutterTts flutterTts = FlutterTts();
  int currentStep = 0;

  final List<Map<String, dynamic>> hangulSteps = [
    {
      'title': 'Hangeul Nedir?',
      'korean': '한글',
      'content':
          'Hangeul, Kore dilinin alfabesidir. Kral Sejong tarafından 1443 yılında icat edilmiştir.',
      'details':
          'Hangeul bilimsel bir yazı sistemidir ve dünyada en mantıklı alfabelerden biridir.',
      'letters': [],
    },
    {
      'title': 'Temel Ünlüler (Sesli Harfler)',
      'korean': '기본 모음',
      'content': 'Hangeul\'de 10 temel ünlü vardır. İşte hepsi:',
      'details':
          'Bu ünlüleri öğrenerek Korece kelimelerin sesli harflerini okuyabilirsiniz!',
      'letters': [
        {
          'char': 'ㅏ',
          'name': '아 (A)',
          'roman': '[a]',
          'turkish': 'Türkçe "a" sesi gibi. Örnek: 아버지 (baba)'
        },
        {
          'char': 'ㅓ',
          'name': '어 (Eo)',
          'roman': '[eo]',
          'turkish': 'Türkçe "e" ve "o" arası ses. Örnek: 어머니 (anne)'
        },
        {
          'char': 'ㅗ',
          'name': '오 (O)',
          'roman': '[o]',
          'turkish': 'Türkçe "o" sesi gibi. Örnek: 오늘 (bugün)'
        },
        {
          'char': 'ㅜ',
          'name': '우 (U)',
          'roman': '[u]',
          'turkish': 'Türkçe "u" sesi gibi. Örnek: 우유 (süt)'
        },
        {
          'char': 'ㅡ',
          'name': '으 (Eu)',
          'roman': '[eu]',
          'turkish': 'Türkçe "ı" sesi gibi. Örnek: 음식 (yemek)'
        },
        {
          'char': 'ㅣ',
          'name': '이 (I)',
          'roman': '[i]',
          'turkish': 'Türkçe "i" sesi gibi. Örnek: 이름 (isim)'
        },
        {
          'char': 'ㅑ',
          'name': '야 (Ya)',
          'roman': '[ya]',
          'turkish': 'Türkçe "ya" sesi gibi. Örnek: 야채 (sebze)'
        },
        {
          'char': 'ㅕ',
          'name': '여 (Yeo)',
          'roman': '[yeo]',
          'turkish': 'Türkçe "ye" ve "yo" arası. Örnek: 여자 (kadın)'
        },
        {
          'char': 'ㅛ',
          'name': '요 (Yo)',
          'roman': '[yo]',
          'turkish': 'Türkçe "yo" sesi gibi. Örnek: 요리 (yemek pişirme)'
        },
        {
          'char': 'ㅠ',
          'name': '유 (Yu)',
          'roman': '[yu]',
          'turkish': 'Türkçe "yu" sesi gibi. Örnek: 유리 (cam)'
        },
      ],
    },
    {
      'title': 'Bileşik Ünlüler',
      'korean': '복합 모음',
      'content': 'İki ünlünün birleşmesiyle oluşan sesler:',
      'details': 'Bu ünlüler temel ünlülerin kombinasyonudur.',
      'letters': [
        {
          'char': 'ㅐ',
          'name': '애 (Ae)',
          'roman': '[ae]',
          'turkish': 'Türkçe "e" sesi gibi. Örnek: 애완동물 (evcil hayvan)'
        },
        {
          'char': 'ㅒ',
          'name': '얘 (Yae)',
          'roman': '[yae]',
          'turkish': 'Türkçe "ye" sesi gibi. Örnek: 얘기 (hikaye)'
        },
        {
          'char': 'ㅔ',
          'name': '에 (E)',
          'roman': '[e]',
          'turkish': 'Türkçe "e" sesi gibi. Örnek: 에어컨 (klima)'
        },
        {
          'char': 'ㅖ',
          'name': '예 (Ye)',
          'roman': '[ye]',
          'turkish': 'Türkçe "ye" sesi gibi. Örnek: 예술 (sanat)'
        },
        {
          'char': 'ㅘ',
          'name': '와 (Wa)',
          'roman': '[wa]',
          'turkish': 'Türkçe "va" sesi gibi. Örnek: 과일 (meyve)'
        },
        {
          'char': 'ㅙ',
          'name': '왜 (Wae)',
          'roman': '[wae]',
          'turkish': 'Türkçe "vay" sesi. Örnek: 왜 (neden)'
        },
        {
          'char': 'ㅚ',
          'name': '외 (Oe)',
          'roman': '[oe]',
          'turkish': 'Türkçe "öy" sesi gibi. Örnek: 외국 (yabancı ülke)'
        },
        {
          'char': 'ㅝ',
          'name': '워 (Wo)',
          'roman': '[wo]',
          'turkish': 'Türkçe "vo" sesi gibi. Örnek: 원 (won - para birimi)'
        },
        {
          'char': 'ㅞ',
          'name': '웨 (We)',
          'roman': '[we]',
          'turkish': 'Türkçe "ve" sesi gibi. Örnek: 웨딩 (düğün)'
        },
        {
          'char': 'ㅟ',
          'name': '위 (Wi)',
          'roman': '[wi]',
          'turkish': 'Türkçe "vi" sesi gibi. Örnek: 위 (üst, mide)'
        },
        {
          'char': 'ㅢ',
          'name': '의 (Ui)',
          'roman': '[ui]',
          'turkish': 'Türkçe "uy" sesi gibi. Örnek: 의사 (doktor)'
        },
      ],
    },
    {
      'title': 'Temel Ünsüzler (Sessiz Harfler)',
      'korean': '기본 자음',
      'content': 'Hangeul\'de 14 temel ünsüz vardır:',
      'details': 'Bu ünsüzler Korece kelimelerin temelini oluşturur.',
      'letters': [
        {
          'char': 'ㄱ',
          'name': '기역 (Giyeok)',
          'roman': '[g/k]',
          'turkish': 'Türkçe "g" veya "k" sesi. Örnek: 가족 (aile)'
        },
        {
          'char': 'ㄴ',
          'name': '니은 (Nieun)',
          'roman': '[n]',
          'turkish': 'Türkçe "n" sesi. Örnek: 나라 (ülke)'
        },
        {
          'char': 'ㄷ',
          'name': '디귿 (Digeut)',
          'roman': '[d/t]',
          'turkish': 'Türkçe "d" veya "t" sesi. Örnek: 돈 (para)'
        },
        {
          'char': 'ㄹ',
          'name': '리을 (Rieul)',
          'roman': '[r/l]',
          'turkish': 'Türkçe "r" veya "l" sesi. Örnek: 라면 (ramen)'
        },
        {
          'char': 'ㅁ',
          'name': '미음 (Mieum)',
          'roman': '[m]',
          'turkish': 'Türkçe "m" sesi. Örnek: 물 (su)'
        },
        {
          'char': 'ㅂ',
          'name': '비읍 (Bieup)',
          'roman': '[b/p]',
          'turkish': 'Türkçe "b" veya "p" sesi. Örnek: 밥 (pirinç)'
        },
        {
          'char': 'ㅅ',
          'name': '시옷 (Siot)',
          'roman': '[s]',
          'turkish': 'Türkçe "s" sesi. Örnek: 사람 (insan)'
        },
        {
          'char': 'ㅇ',
          'name': '이응 (Ieung)',
          'roman': '[ng/sessiz]',
          'turkish': 'Kelime başında sessiz, sonunda "ng" sesi'
        },
        {
          'char': 'ㅈ',
          'name': '지읒 (Jieut)',
          'roman': '[j/ch]',
          'turkish': 'Türkçe "c" sesi gibi. Örnek: 자동차 (araba)'
        },
        {
          'char': 'ㅊ',
          'name': '치읓 (Chieut)',
          'roman': '[ch]',
          'turkish': 'Türkçe "ç" sesi gibi. Örnek: 친구 (arkadaş)'
        },
        {
          'char': 'ㅋ',
          'name': '키읔 (Kieuk)',
          'roman': '[k]',
          'turkish': 'Güçlü "k" sesi. Örnek: 코 (burun)'
        },
        {
          'char': 'ㅌ',
          'name': '티읕 (Tieut)',
          'roman': '[t]',
          'turkish': 'Güçlü "t" sesi. Örnek: 토마토 (domates)'
        },
        {
          'char': 'ㅍ',
          'name': '피읖 (Pieup)',
          'roman': '[p]',
          'turkish': 'Güçlü "p" sesi. Örnek: 피자 (pizza)'
        },
        {
          'char': 'ㅎ',
          'name': '히읗 (Hieut)',
          'roman': '[h]',
          'turkish': 'Türkçe "h" sesi. Örnek: 한국 (Kore)'
        },
      ],
    },
    {
      'title': 'Çift Ünsüzler (Sert Sesler)',
      'korean': '된소리 자음',
      'content': 'Daha sert telaffuz edilen çift ünsüzler:',
      'details': 'Bu harfler temel ünsüzlerin sert versiyonlarıdır.',
      'letters': [
        {
          'char': 'ㄲ',
          'name': '쌍기역 (Ssanggiyeok)',
          'roman': '[kk]',
          'turkish': 'Sert "k" sesi. Örnek: 꿈 (rüya)'
        },
        {
          'char': 'ㄸ',
          'name': '쌍디귿 (Ssangdigeut)',
          'roman': '[tt]',
          'turkish': 'Sert "t" sesi. Örnek: 따뜻하다 (sıcak)'
        },
        {
          'char': 'ㅃ',
          'name': '쌍비읍 (Ssangbieup)',
          'roman': '[pp]',
          'turkish': 'Sert "p" sesi. Örnek: 빨간색 (kırmızı)'
        },
        {
          'char': 'ㅆ',
          'name': '쌍시옷 (Ssangsiot)',
          'roman': '[ss]',
          'turkish': 'Sert "s" sesi. Örnek: 쓰다 (yazmak)'
        },
        {
          'char': 'ㅉ',
          'name': '쌍지읒 (Ssangjieut)',
          'roman': '[jj]',
          'turkish': 'Sert "c" sesi. Örnek: 찌개 (çorba)'
        },
      ],
    },
    {
      'title': 'Hece Yapısı ve Birleştirme',
      'korean': '음절 구조',
      'content':
          'Hangeul harfleri bloklar halinde birleştirilir. Her blok bir hece oluşturur.',
      'details':
          'Hangeul\'ün en özel özelliği budur - harfler yan yana değil, blok halinde yazılır!',
      'letters': [
        {
          'char': '가',
          'name': 'ㄱ + ㅏ',
          'roman': '[ga]',
          'turkish': 'Ünsüz + Ünlü = Hece. Anlamı: git'
        },
        {
          'char': '나',
          'name': 'ㄴ + ㅏ',
          'roman': '[na]',
          'turkish': 'Ben, beni. En sık kullanılan kelimelerden'
        },
        {
          'char': '감',
          'name': 'ㄱ + ㅏ + ㅁ',
          'roman': '[gam]',
          'turkish': 'Ünsüz + Ünlü + Ünsüz. Anlamı: duygu'
        },
        {
          'char': '한',
          'name': 'ㅎ + ㅏ + ㄴ',
          'roman': '[han]',
          'turkish': 'Bir, tek. "한국" (Kore) kelimesindeki "han"'
        },
      ],
    },
    {
      'title': 'Pratik Yapma',
      'korean': '연습',
      'content':
          'Şimdi öğrendiğiniz harflerle basit kelimeler okumaya çalışın!',
      'details':
          'Bu kelimeleri okuyabiliyorsanız Hangeul\'ü öğrenmişsiniz demektir!',
      'letters': [
        {'char': '나', 'name': 'na', 'roman': '[na]', 'turkish': 'Ben, beni'},
        {
          'char': '가다',
          'name': 'ga-da',
          'roman': '[ga-da]',
          'turkish': 'Gitmek'
        },
        {
          'char': '사람',
          'name': 'sa-ram',
          'roman': '[sa-ram]',
          'turkish': 'İnsan, kişi'
        },
        {'char': '물', 'name': 'mul', 'roman': '[mul]', 'turkish': 'Su'},
        {
          'char': '밥',
          'name': 'bap',
          'roman': '[bap]',
          'turkish': 'Pirinç, yemek'
        },
      ],
    },
  ];

  Future<void> _speak(String text) async {
    await flutterTts.setLanguage('ko-KR');
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text('한글 배우기'),
        backgroundColor: const Color(0xFF4CAF50),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // 진행 표시기
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${currentStep + 1} / ${hangulSteps.length}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4CAF50),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: (currentStep + 1) / hangulSteps.length,
                  backgroundColor: Colors.grey.shade300,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(Color(0xFF4CAF50)),
                ),
              ],
            ),
          ),

          // 강의 내용
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Text(
                        hangulSteps[currentStep]['title'],
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4CAF50),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      if (hangulSteps[currentStep]['letters'].isEmpty)
                        // 기본 설명 (첫 번째 단계)
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () =>
                                  _speak(hangulSteps[currentStep]['korean']),
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xFF4CAF50).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                      color: const Color(0xFF4CAF50)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      hangulSteps[currentStep]['korean'],
                                      style: const TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF4CAF50),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    const Icon(
                                      Icons.volume_up,
                                      color: Color(0xFF4CAF50),
                                      size: 28,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              hangulSteps[currentStep]['content'],
                              style: const TextStyle(
                                fontSize: 18,
                                height: 1.6,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                hangulSteps[currentStep]['details'],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue.shade700,
                                  fontStyle: FontStyle.italic,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        )
                      else
                        // 자모 상세 설명
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                hangulSteps[currentStep]['content'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  height: 1.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20),

                              Expanded(
                                child: ListView.builder(
                                  itemCount: hangulSteps[currentStep]['letters']
                                      .length,
                                  itemBuilder: (context, index) {
                                    final letter = hangulSteps[currentStep]
                                        ['letters'][index];
                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 12),
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: const Color(0xFF4CAF50)
                                                .withOpacity(0.3)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            blurRadius: 4,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: InkWell(
                                        onTap: () => _speak(letter['char']),
                                        borderRadius: BorderRadius.circular(12),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Row(
                                            children: [
                                              // 한글 자모
                                              Container(
                                                width: 60,
                                                height: 60,
                                                decoration: BoxDecoration(
                                                  color: const Color(0xFF4CAF50)
                                                      .withOpacity(0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xFF4CAF50)),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    letter['char'],
                                                    style: const TextStyle(
                                                      fontSize: 28,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xFF4CAF50),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 16),

                                              // 설명
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    // 자모 이름
                                                    Text(
                                                      letter['name'],
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xFF4CAF50),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),

                                                    // 로마자 표기
                                                    Text(
                                                      letter['roman'],
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors
                                                            .grey.shade700,
                                                        fontFamily: 'monospace',
                                                      ),
                                                    ),
                                                    const SizedBox(height: 8),

                                                    // 터키어 설명
                                                    Text(
                                                      letter['turkish'],
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        height: 1.4,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              // 음성 재생 아이콘
                                              const Icon(
                                                Icons.volume_up,
                                                color: Color(0xFF4CAF50),
                                                size: 24,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),

                              const SizedBox(height: 16),

                              // 팁
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade50,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(Icons.lightbulb,
                                        color: Colors.blue),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        hangulSteps[currentStep]['details'],
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.blue.shade700,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // 네비게이션 버튼
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentStep > 0)
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        currentStep--;
                      });
                    },
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Önceki'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade600,
                      foregroundColor: Colors.white,
                    ),
                  )
                else
                  const SizedBox(),
                if (currentStep < hangulSteps.length - 1)
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        currentStep++;
                      });
                    },
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text('Sonraki'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4CAF50),
                      foregroundColor: Colors.white,
                    ),
                  )
                else
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('한글 배우기 완료! 잘하셨습니다!'),
                          backgroundColor: Color(0xFF4CAF50),
                        ),
                      );
                    },
                    icon: const Icon(Icons.check),
                    label: const Text('Tamamla'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4CAF50),
                      foregroundColor: Colors.white,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 기본 인사 & 자기소개 강의 페이지
class GreetingLessonPage extends StatefulWidget {
  const GreetingLessonPage({super.key});

  @override
  State<GreetingLessonPage> createState() => _GreetingLessonPageState();
}

class _GreetingLessonPageState extends State<GreetingLessonPage> {
  final FlutterTts flutterTts = FlutterTts();
  int currentStep = 0;

  final List<Map<String, dynamic>> greetingSteps = [
    {
      'title': 'Temel Selamlaşma',
      'korean': '안녕하세요',
      'pronunciation': 'An-nyeong-ha-se-yo',
      'turkish': 'Merhaba (resmi)',
      'usage': 'Herhangi bir zamanda kullanılabilir',
    },
    {
      'title': 'Günün Vakitlerine Göre',
      'korean': '좋은 아침입니다',
      'pronunciation': 'Jo-eun a-chim-im-ni-da',
      'turkish': 'Günaydın (çok resmi)',
      'usage': 'Sabah saatlerinde kullanılır',
    },
    {
      'title': 'Kendini Tanıtma - İsim',
      'korean': '제 이름은 ___ 입니다',
      'pronunciation': 'Je i-reum-eun ___ im-ni-da',
      'turkish': 'Benim adım ___ (resmi)',
      'usage': 'İlk tanışmalarda kullanılır',
    },
    {
      'title': 'Nereli Olduğunu Söyleme',
      'korean': '저는 터키에서 왔습니다',
      'pronunciation': 'Jeo-neun Teo-ki-e-seo wat-seum-ni-da',
      'turkish': 'Ben Türkiye\'den geldim',
      'usage': 'Ülkenizi tanıtırken kullanılır',
    },
    {
      'title': 'Hoş Geldiniz',
      'korean': '만나서 반갑습니다',
      'pronunciation': 'Man-na-seo ban-gap-seum-ni-da',
      'turkish': 'Tanıştığımıza memnun oldum',
      'usage': 'İlk tanışmalarda kullanılır',
    },
  ];

  Future<void> _speak(String text) async {
    await flutterTts.setLanguage('ko-KR');
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text('기본 인사 & 자기소개'),
        backgroundColor: const Color(0xFFFF9800),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // 진행 표시기
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${currentStep + 1} / ${greetingSteps.length}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFF9800),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: (currentStep + 1) / greetingSteps.length,
                  backgroundColor: Colors.grey.shade300,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(Color(0xFFFF9800)),
                ),
              ],
            ),
          ),

          // 강의 내용
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Text(
                        greetingSteps[currentStep]['title'],
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF9800),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),

                      // 한국어 표현
                      GestureDetector(
                        onTap: () =>
                            _speak(greetingSteps[currentStep]['korean']),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF9800).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFFFF9800)),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      greetingSteps[currentStep]['korean'],
                                      style: const TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFFF9800),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.volume_up,
                                    color: Color(0xFFFF9800),
                                    size: 28,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                greetingSteps[currentStep]['pronunciation'],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade700,
                                  fontStyle: FontStyle.italic,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // 터키어 번역
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Türkçe Anlamı:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              greetingSteps[currentStep]['turkish'],
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // 사용법
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.lightbulb, color: Colors.green),
                                SizedBox(width: 8),
                                Text(
                                  'Kullanım:',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              greetingSteps[currentStep]['usage'],
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.green.shade700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // 네비게이션 버튼
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentStep > 0)
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        currentStep--;
                      });
                    },
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Önceki'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade600,
                      foregroundColor: Colors.white,
                    ),
                  )
                else
                  const SizedBox(),
                if (currentStep < greetingSteps.length - 1)
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        currentStep++;
                      });
                    },
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text('Sonraki'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF9800),
                      foregroundColor: Colors.white,
                    ),
                  )
                else
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('인사 & 자기소개 완료! 잘하셨습니다!'),
                          backgroundColor: Color(0xFFFF9800),
                        ),
                      );
                    },
                    icon: const Icon(Icons.check),
                    label: const Text('Tamamla'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF9800),
                      foregroundColor: Colors.white,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
