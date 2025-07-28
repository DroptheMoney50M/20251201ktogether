import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'lectures/hangul_lesson_page.dart';
import 'lectures/greeting_lesson_page.dart';
import 'lectures/numbers_lesson_page.dart';
import 'lectures/family_lesson_page.dart';

class LecturePage extends StatefulWidget {
  const LecturePage({super.key});

  @override
  State<LecturePage> createState() => _LecturePageState();
}

class _LecturePageState extends State<LecturePage> {
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
                  _buildLectureCard(
                    context,
                    title: '3. 숫자 및 시간',
                    subtitle: 'Sayılar ve Zaman',
                    description: 'Korece sayıları ve zamanı öğrenin',
                    icon: Icons.access_time,
                    color: const Color(0xFFE53935),
                    onTap: () => _navigateToNumbersLesson(context),
                  ),
                  const SizedBox(height: 16),
                  _buildLectureCard(
                    context,
                    title: '4. 가족 및 관계',
                    subtitle: 'Aile ve İlişkiler',
                    description: 'Aile üyeleri ve ilişkiler hakkında ifadeler',
                    icon: Icons.family_restroom,
                    color: const Color(0xFF8E24AA),
                    onTap: () => _navigateToFamilyLesson(context),
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
                          '• Yemek & İçecek\n• Alışveriş & Para\n• Ulaşım & Yön Tarifi\n• Duygular & Hisler',
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

  void _navigateToNumbersLesson(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NumbersLessonPage(),
      ),
    );
  }

  void _navigateToFamilyLesson(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const FamilyLessonPage(),
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
                          content:
                              Text('Hangeul öğrenme tamamlandı! Tebrikler!'),
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
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 숫자 및 시간 강의 페이지
class NumbersLessonPage extends StatefulWidget {
  const NumbersLessonPage({super.key});

  @override
  State<NumbersLessonPage> createState() => _NumbersLessonPageState();
}

class _NumbersLessonPageState extends State<NumbersLessonPage> {
  final FlutterTts flutterTts = FlutterTts();
  int currentStep = 0;

  final List<Map<String, dynamic>> numbersSteps = [
    {
      'title': 'Korece Sayılar - Giriş',
      'korean': '숫자',
      'content':
          'Korece\'de iki farklı sayı sistemi vardır: Kore asıllı sayılar ve Çin asıllı sayılar.',
      'details':
          'Her ikisi de farklı durumlarda kullanılır. Bu derste her ikisini de öğreneceğiz!',
      'examples': [],
    },
    {
      'title': 'Kore Asıllı Sayılar (1-10)',
      'korean': '고유어 숫자',
      'content':
          'Yaş, saatler ve genel sayma için kullanılan Kore asıllı sayılar:',
      'details': 'Bu sayılar günlük hayatta çok sık kullanılır.',
      'examples': [
        {
          'number': '하나',
          'pronunciation': 'ha-na',
          'value': '1',
          'usage': 'Genel sayma, yaş'
        },
        {
          'number': '둘',
          'pronunciation': 'dul',
          'value': '2',
          'usage': 'İki kişi, iki saat'
        },
        {
          'number': '셋',
          'pronunciation': 'set',
          'value': '3',
          'usage': 'Üç dakika, üç yaş'
        },
        {
          'number': '넷',
          'pronunciation': 'net',
          'value': '4',
          'usage': 'Dört saat, dört kişi'
        },
        {
          'number': '다섯',
          'pronunciation': 'da-seot',
          'value': '5',
          'usage': 'Beş yaş, beş dakika'
        },
        {
          'number': '여섯',
          'pronunciation': 'yeo-seot',
          'value': '6',
          'usage': 'Altı saat, altı kişi'
        },
        {
          'number': '일곱',
          'pronunciation': 'il-gop',
          'value': '7',
          'usage': 'Yedi yaş, yedi dakika'
        },
        {
          'number': '여덟',
          'pronunciation': 'yeo-deol',
          'value': '8',
          'usage': 'Sekiz saat, sekiz kişi'
        },
        {
          'number': '아홉',
          'pronunciation': 'a-hop',
          'value': '9',
          'usage': 'Dokuz yaş, dokuz dakika'
        },
        {
          'number': '열',
          'pronunciation': 'yeol',
          'value': '10',
          'usage': 'On yaş, on saat'
        },
      ],
    },
    {
      'title': 'Çin Asıllı Sayılar (1-10)',
      'korean': '한자어 숫자',
      'content':
          'Telefon numaraları, tarihler ve parasal değerler için kullanılan Çin asıllı sayılar:',
      'details':
          'Bu sayılar daha resmi durumlarda ve matematik işlemlerinde kullanılır.',
      'examples': [
        {
          'number': '일',
          'pronunciation': 'il',
          'value': '1',
          'usage': 'Tarih: 1월 (Ocak)'
        },
        {
          'number': '이',
          'pronunciation': 'i',
          'value': '2',
          'usage': 'Telefon: 이-공-일'
        },
        {
          'number': '삼',
          'pronunciation': 'sam',
          'value': '3',
          'usage': 'Para: 삼천원 (3000 won)'
        },
        {
          'number': '사',
          'pronunciation': 'sa',
          'value': '4',
          'usage': 'Tarih: 4월 (Nisan)'
        },
        {
          'number': '오',
          'pronunciation': 'o',
          'value': '5',
          'usage': 'Telefon: 오-일-구'
        },
        {
          'number': '육',
          'pronunciation': 'yuk',
          'value': '6',
          'usage': 'Para: 육만원 (60,000 won)'
        },
        {
          'number': '칠',
          'pronunciation': 'chil',
          'value': '7',
          'usage': 'Tarih: 7월 (Temmuz)'
        },
        {
          'number': '팔',
          'pronunciation': 'pal',
          'value': '8',
          'usage': 'Telefon: 팔-이-사'
        },
        {
          'number': '구',
          'pronunciation': 'gu',
          'value': '9',
          'usage': 'Para: 구천원 (9000 won)'
        },
        {
          'number': '십',
          'pronunciation': 'sip',
          'value': '10',
          'usage': 'Tarih: 10월 (Ekim)'
        },
      ],
    },
    {
      'title': 'Büyük Sayılar - Kore Asıllı',
      'korean': '큰 수 (고유어)',
      'content': 'Kore asıllı sayılarla büyük sayılar nasıl yapılır:',
      'details': 'Kore asıllı sayılar genelde 99\'a kadar kullanılır.',
      'examples': [
        {
          'number': '열하나',
          'pronunciation': 'yeol-ha-na',
          'value': '11',
          'usage': 'On bir yaş'
        },
        {
          'number': '스물',
          'pronunciation': 'seu-mul',
          'value': '20',
          'usage': 'Yirmi yaş'
        },
        {
          'number': '스물하나',
          'pronunciation': 'seu-mul-ha-na',
          'value': '21',
          'usage': 'Yirmi bir yaş'
        },
        {
          'number': '서른',
          'pronunciation': 'seo-reun',
          'value': '30',
          'usage': 'Otuz yaş'
        },
        {
          'number': '마흔',
          'pronunciation': 'ma-heun',
          'value': '40',
          'usage': 'Kırk yaş'
        },
        {
          'number': '쉰',
          'pronunciation': 'swin',
          'value': '50',
          'usage': 'Elli yaş'
        },
        {
          'number': '예순',
          'pronunciation': 'ye-sun',
          'value': '60',
          'usage': 'Altmış yaş'
        },
        {
          'number': '일흔',
          'pronunciation': 'il-heun',
          'value': '70',
          'usage': 'Yetmiş yaş'
        },
        {
          'number': '여든',
          'pronunciation': 'yeo-deun',
          'value': '80',
          'usage': 'Seksen yaş'
        },
        {
          'number': '아흔',
          'pronunciation': 'a-heun',
          'value': '90',
          'usage': 'Doksan yaş'
        },
      ],
    },
    {
      'title': 'Büyük Sayılar - Çin Asıllı',
      'korean': '큰 수 (한자어)',
      'content': 'Çin asıllı sayılarla büyük sayılar ve basamaklar:',
      'details': 'Para, matematik ve resmi belgeler için kullanılır.',
      'examples': [
        {
          'number': '십일',
          'pronunciation': 'sip-il',
          'value': '11',
          'usage': '11월 (Kasım)'
        },
        {
          'number': '이십',
          'pronunciation': 'i-sip',
          'value': '20',
          'usage': '이십원 (20 won)'
        },
        {
          'number': '백',
          'pronunciation': 'baek',
          'value': '100',
          'usage': '백원 (100 won)'
        },
        {
          'number': '천',
          'pronunciation': 'cheon',
          'value': '1,000',
          'usage': '천원 (1000 won)'
        },
        {
          'number': '만',
          'pronunciation': 'man',
          'value': '10,000',
          'usage': '만원 (10,000 won)'
        },
        {
          'number': '십만',
          'pronunciation': 'sip-man',
          'value': '100,000',
          'usage': '십만원 (100,000 won)'
        },
        {
          'number': '백만',
          'pronunciation': 'baek-man',
          'value': '1,000,000',
          'usage': '백만원 (1 milyon won)'
        },
        {
          'number': '천만',
          'pronunciation': 'cheon-man',
          'value': '10,000,000',
          'usage': '천만원 (10 milyon won)'
        },
        {
          'number': '억',
          'pronunciation': 'eok',
          'value': '100,000,000',
          'usage': '억원 (100 milyon won)'
        },
        {
          'number': '조',
          'pronunciation': 'jo',
          'value': '1,000,000,000,000',
          'usage': '조원 (trilyon won)'
        },
      ],
    },
    {
      'title': 'Saat Söyleme',
      'korean': '시간 말하기',
      'content': 'Korece\'de saat nasıl söylenir:',
      'details':
          'Saat için Kore asıllı, dakika için Çin asıllı sayılar kullanılır.',
      'examples': [
        {
          'number': '한 시',
          'pronunciation': 'han si',
          'value': '1:00',
          'usage': 'Saat bir'
        },
        {
          'number': '두 시',
          'pronunciation': 'du si',
          'value': '2:00',
          'usage': 'Saat iki'
        },
        {
          'number': '세 시',
          'pronunciation': 'se si',
          'value': '3:00',
          'usage': 'Saat üç'
        },
        {
          'number': '한 시 십분',
          'pronunciation': 'han si sip-bun',
          'value': '1:10',
          'usage': 'Bir buçuk on'
        },
        {
          'number': '두 시 삼십분',
          'pronunciation': 'du si sam-sip-bun',
          'value': '2:30',
          'usage': 'İki buçuk'
        },
        {
          'number': '오후 세 시',
          'pronunciation': 'o-hu se si',
          'value': '15:00',
          'usage': 'Öğleden sonra üç'
        },
        {
          'number': '오전 아홉 시',
          'pronunciation': 'o-jeon a-hop si',
          'value': '09:00',
          'usage': 'Sabah dokuz'
        },
        {
          'number': '자정',
          'pronunciation': 'ja-jeong',
          'value': '00:00',
          'usage': 'Gece yarısı'
        },
        {
          'number': '정오',
          'pronunciation': 'jeong-o',
          'value': '12:00',
          'usage': 'Öğle vakti'
        },
        {
          'number': '새벽',
          'pronunciation': 'sae-byeok',
          'value': '03:00-06:00',
          'usage': 'Şafak vakti'
        },
      ],
    },
    {
      'title': 'Günler ve Haftalar',
      'korean': '요일',
      'content': 'Haftanın günleri ve tarih ifadeleri:',
      'details': 'Günlük programlarınızı Korece anlatabileceksiniz.',
      'examples': [
        {
          'number': '월요일',
          'pronunciation': 'wol-yo-il',
          'value': 'Monday',
          'usage': 'Pazartesi günü'
        },
        {
          'number': '화요일',
          'pronunciation': 'hwa-yo-il',
          'value': 'Tuesday',
          'usage': 'Salı günü'
        },
        {
          'number': '수요일',
          'pronunciation': 'su-yo-il',
          'value': 'Wednesday',
          'usage': 'Çarşamba günü'
        },
        {
          'number': '목요일',
          'pronunciation': 'mok-yo-il',
          'value': 'Thursday',
          'usage': 'Perşembe günü'
        },
        {
          'number': '금요일',
          'pronunciation': 'geum-yo-il',
          'value': 'Friday',
          'usage': 'Cuma günü'
        },
        {
          'number': '토요일',
          'pronunciation': 'to-yo-il',
          'value': 'Saturday',
          'usage': 'Cumartesi günü'
        },
        {
          'number': '일요일',
          'pronunciation': 'il-yo-il',
          'value': 'Sunday',
          'usage': 'Pazar günü'
        },
        {
          'number': '오늘',
          'pronunciation': 'o-neul',
          'value': 'Today',
          'usage': 'Bugün'
        },
        {
          'number': '어제',
          'pronunciation': 'eo-je',
          'value': 'Yesterday',
          'usage': 'Dün'
        },
        {
          'number': '내일',
          'pronunciation': 'nae-il',
          'value': 'Tomorrow',
          'usage': 'Yarın'
        },
      ],
    },
    {
      'title': 'Aylar ve Mevsimler',
      'korean': '월과 계절',
      'content': 'Ayların isimleri ve mevsimler:',
      'details': 'Aylar Çin asıllı sayılar + 월(월) ile yapılır.',
      'examples': [
        {
          'number': '일월',
          'pronunciation': 'il-wol',
          'value': 'January',
          'usage': 'Ocak ayı'
        },
        {
          'number': '이월',
          'pronunciation': 'i-wol',
          'value': 'February',
          'usage': 'Şubat ayı'
        },
        {
          'number': '삼월',
          'pronunciation': 'sam-wol',
          'value': 'March',
          'usage': 'Mart ayı'
        },
        {
          'number': '사월',
          'pronunciation': 'sa-wol',
          'value': 'April',
          'usage': 'Nisan ayı'
        },
        {
          'number': '오월',
          'pronunciation': 'o-wol',
          'value': 'May',
          'usage': 'Mayıs ayı'
        },
        {
          'number': '유월',
          'pronunciation': 'yu-wol',
          'value': 'June',
          'usage': 'Haziran ayı'
        },
        {
          'number': '칠월',
          'pronunciation': 'chil-wol',
          'value': 'July',
          'usage': 'Temmuz ayı'
        },
        {
          'number': '팔월',
          'pronunciation': 'pal-wol',
          'value': 'August',
          'usage': 'Ağustos ayı'
        },
        {
          'number': '구월',
          'pronunciation': 'gu-wol',
          'value': 'September',
          'usage': 'Eylül ayı'
        },
        {
          'number': '시월',
          'pronunciation': 'si-wol',
          'value': 'October',
          'usage': 'Ekim ayı'
        },
        {
          'number': '십일월',
          'pronunciation': 'sip-il-wol',
          'value': 'November',
          'usage': 'Kasım ayı'
        },
        {
          'number': '십이월',
          'pronunciation': 'sip-i-wol',
          'value': 'December',
          'usage': 'Aralık ayı'
        },
      ],
    },
    {
      'title': 'Yaş Söyleme',
      'korean': '나이 말하기',
      'content': 'Korece\'de yaş nasıl söylenir:',
      'details': 'Yaş için Kore asıllı sayılar + 살 kullanılır.',
      'examples': [
        {
          'number': '한 살',
          'pronunciation': 'han sal',
          'value': '1 year old',
          'usage': 'Bir yaşında'
        },
        {
          'number': '다섯 살',
          'pronunciation': 'da-seot sal',
          'value': '5 years old',
          'usage': 'Beş yaşında'
        },
        {
          'number': '열 살',
          'pronunciation': 'yeol sal',
          'value': '10 years old',
          'usage': 'On yaşında'
        },
        {
          'number': '스무 살',
          'pronunciation': 'seu-mu sal',
          'value': '20 years old',
          'usage': 'Yirmi yaşında'
        },
        {
          'number': '서른 살',
          'pronunciation': 'seo-reun sal',
          'value': '30 years old',
          'usage': 'Otuz yaşında'
        },
        {
          'number': '마흔 살',
          'pronunciation': 'ma-heun sal',
          'value': '40 years old',
          'usage': 'Kırk yaşında'
        },
        {
          'number': '쉰 살',
          'pronunciation': 'swin sal',
          'value': '50 years old',
          'usage': 'Elli yaşında'
        },
        {
          'number': '예순 살',
          'pronunciation': 'ye-sun sal',
          'value': '60 years old',
          'usage': 'Altmış yaşında'
        },
        {
          'number': '일흔 살',
          'pronunciation': 'il-heun sal',
          'value': '70 years old',
          'usage': 'Yetmiş yaşında'
        },
        {
          'number': '여든 살',
          'pronunciation': 'yeo-deun sal',
          'value': '80 years old',
          'usage': 'Seksen yaşında'
        },
      ],
    },
    {
      'title': 'Para ve Fiyatlar',
      'korean': '돈과 가격',
      'content': 'Korece\'de para ve fiyat ifadeleri:',
      'details': 'Para için Çin asıllı sayılar + 원 kullanılır.',
      'examples': [
        {
          'number': '천원',
          'pronunciation': 'cheon-won',
          'value': '1,000 won',
          'usage': 'Bin won'
        },
        {
          'number': '만원',
          'pronunciation': 'man-won',
          'value': '10,000 won',
          'usage': 'On bin won'
        },
        {
          'number': '오만원',
          'pronunciation': 'o-man-won',
          'value': '50,000 won',
          'usage': 'Elli bin won'
        },
        {
          'number': '십만원',
          'pronunciation': 'sip-man-won',
          'value': '100,000 won',
          'usage': 'Yüz bin won'
        },
        {
          'number': '얼마예요?',
          'pronunciation': 'eol-ma-ye-yo?',
          'value': 'How much?',
          'usage': 'Kaç para?'
        },
        {
          'number': '비싸요',
          'pronunciation': 'bi-ssa-yo',
          'value': 'Expensive',
          'usage': 'Pahalı'
        },
        {
          'number': '싸요',
          'pronunciation': 'ssa-yo',
          'value': 'Cheap',
          'usage': 'Ucuz'
        },
        {
          'number': '공짜',
          'pronunciation': 'gong-jja',
          'value': 'Free',
          'usage': 'Bedava'
        },
        {
          'number': '할인',
          'pronunciation': 'hal-in',
          'value': 'Discount',
          'usage': 'İndirim'
        },
        {
          'number': '현금',
          'pronunciation': 'hyeon-geum',
          'value': 'Cash',
          'usage': 'Nakit'
        },
      ],
    },
    {
      'title': 'Zaman İfadeleri ve Sıklık',
      'korean': '시간 표현',
      'content': 'Zamanla ilgili faydalı ifadeler:',
      'details': 'Günlük konuşmalarda sık kullanılan zaman ifadeleri.',
      'examples': [
        {
          'number': '지금',
          'pronunciation': 'ji-geum',
          'value': 'Now',
          'usage': 'Şimdi'
        },
        {
          'number': '나중에',
          'pronunciation': 'na-jung-e',
          'value': 'Later',
          'usage': 'Daha sonra'
        },
        {
          'number': '빨리',
          'pronunciation': 'ppal-li',
          'value': 'Quickly',
          'usage': 'Çabuk'
        },
        {
          'number': '천천히',
          'pronunciation': 'cheon-cheon-hi',
          'value': 'Slowly',
          'usage': 'Yavaş yavaş'
        },
        {
          'number': '항상',
          'pronunciation': 'hang-sang',
          'value': 'Always',
          'usage': 'Her zaman'
        },
        {
          'number': '가끔',
          'pronunciation': 'ga-kkeum',
          'value': 'Sometimes',
          'usage': 'Bazen'
        },
        {
          'number': '자주',
          'pronunciation': 'ja-ju',
          'value': 'Often',
          'usage': 'Sık sık'
        },
        {
          'number': '처음',
          'pronunciation': 'cheo-eum',
          'value': 'First time',
          'usage': 'İlk kez'
        },
        {
          'number': '마지막',
          'pronunciation': 'ma-ji-mak',
          'value': 'Last',
          'usage': 'Son'
        },
        {
          'number': '다음',
          'pronunciation': 'da-eum',
          'value': 'Next',
          'usage': 'Sonraki'
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
        title: const Text('숫자 및 시간'),
        backgroundColor: const Color(0xFFE53935),
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
                      '${currentStep + 1} / ${numbersSteps.length}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFE53935),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: (currentStep + 1) / numbersSteps.length,
                  backgroundColor: Colors.grey.shade300,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(Color(0xFFE53935)),
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
                        numbersSteps[currentStep]['title'],
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFE53935),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      if (numbersSteps[currentStep]['examples'].isEmpty)
                        // 기본 설명 (첫 번째 단계)
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () =>
                                  _speak(numbersSteps[currentStep]['korean']),
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xFFE53935).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                      color: const Color(0xFFE53935)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      numbersSteps[currentStep]['korean'],
                                      style: const TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFE53935),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    const Icon(
                                      Icons.volume_up,
                                      color: Color(0xFFE53935),
                                      size: 28,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              numbersSteps[currentStep]['content'],
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
                                numbersSteps[currentStep]['details'],
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
                        // 숫자 상세 설명
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                numbersSteps[currentStep]['content'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  height: 1.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20),

                              Expanded(
                                child: ListView.builder(
                                  itemCount: numbersSteps[currentStep]
                                          ['examples']
                                      .length,
                                  itemBuilder: (context, index) {
                                    final example = numbersSteps[currentStep]
                                        ['examples'][index];
                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 12),
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: const Color(0xFFE53935)
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
                                        onTap: () => _speak(example['number']),
                                        borderRadius: BorderRadius.circular(12),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Row(
                                            children: [
                                              // 숫자 표시
                                              Container(
                                                width: 60,
                                                height: 60,
                                                decoration: BoxDecoration(
                                                  color: const Color(0xFFE53935)
                                                      .withOpacity(0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xFFE53935)),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    example['value'],
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xFFE53935),
                                                    ),
                                                    textAlign: TextAlign.center,
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
                                                    // 한국어 숫자
                                                    Text(
                                                      example['number'],
                                                      style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xFFE53935),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),

                                                    // 발음
                                                    Text(
                                                      example['pronunciation'],
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors
                                                            .grey.shade700,
                                                        fontFamily: 'monospace',
                                                      ),
                                                    ),
                                                    const SizedBox(height: 8),

                                                    // 사용법
                                                    Text(
                                                      example['usage'],
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
                                                color: Color(0xFFE53935),
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
                                        numbersSteps[currentStep]['details'],
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
                if (currentStep < numbersSteps.length - 1)
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        currentStep++;
                      });
                    },
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text('Sonraki'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE53935),
                      foregroundColor: Colors.white,
                    ),
                  )
                else
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('숫자 및 시간 강의 완료! 훌륭해요!'),
                          backgroundColor: Color(0xFFE53935),
                        ),
                      );
                    },
                    icon: const Icon(Icons.check),
                    label: const Text('Tamamla'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE53935),
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

// 가족 및 관계 강의 페이지
class FamilyLessonPage extends StatefulWidget {
  const FamilyLessonPage({super.key});

  @override
  State<FamilyLessonPage> createState() => _FamilyLessonPageState();
}

class _FamilyLessonPageState extends State<FamilyLessonPage> {
  final FlutterTts flutterTts = FlutterTts();
  int currentStep = 0;

  final List<Map<String, dynamic>> familySteps = [
    {
      'title': 'Aile Kavramı',
      'korean': '가족',
      'content':
          'Korece\'de aile kavramı çok önemlidir. Koreli toplumunda aile bağları çok güçlüdür.',
      'details':
          'Aile üyeleri için kullanılan terimler yaş ve saygı seviyesine göre değişir.',
      'examples': [],
    },
    {
      'title': 'Çekirdek Aile',
      'korean': '핵가족',
      'content': 'En yakın aile üyeleri:',
      'details':
          'Bu terimler günlük hayatta en sık kullanılan aile sözcükleridir.',
      'examples': [
        {
          'word': '가족',
          'pronunciation': 'ga-jok',
          'meaning': 'Aile',
          'usage': 'Genel aile terimi'
        },
        {
          'word': '부모님',
          'pronunciation': 'bu-mo-nim',
          'meaning': 'Anne-baba (saygılı)',
          'usage': 'Resmi durumlarda'
        },
        {
          'word': '아버지',
          'pronunciation': 'a-beo-ji',
          'meaning': 'Baba (resmi)',
          'usage': 'Başkalarına bahsederken'
        },
        {
          'word': '어머니',
          'pronunciation': 'eo-meo-ni',
          'meaning': 'Anne (resmi)',
          'usage': 'Başkalarına bahsederken'
        },
        {
          'word': '아빠',
          'pronunciation': 'a-ppa',
          'meaning': 'Baba (günlük)',
          'usage': 'Aile içinde'
        },
        {
          'word': '엄마',
          'pronunciation': 'eom-ma',
          'meaning': 'Anne (günlük)',
          'usage': 'Aile içinde'
        },
        {
          'word': '아들',
          'pronunciation': 'a-deul',
          'meaning': 'Oğul',
          'usage': 'Erkek çocuk'
        },
        {
          'word': '딸',
          'pronunciation': 'ttal',
          'meaning': 'Kız',
          'usage': 'Kız çocuk'
        },
        {
          'word': '형제',
          'pronunciation': 'hyeong-je',
          'meaning': 'Kardeşler (erkek)',
          'usage': 'Erkek kardeşler'
        },
        {
          'word': '자매',
          'pronunciation': 'ja-mae',
          'meaning': 'Kardeşler (kız)',
          'usage': 'Kız kardeşler'
        },
      ],
    },
    {
      'title': 'Erkek Kardeşler',
      'korean': '남자 형제',
      'content': 'Erkek kardeşler için kullanılan terimler yaşa göre değişir:',
      'details': 'Konuşan kişinin cinsiyeti de bu terimleri etkiler.',
      'examples': [
        {
          'word': '형',
          'pronunciation': 'hyeong',
          'meaning': 'Abi (erkek söyler)',
          'usage': 'Erkek büyük kardeşe'
        },
        {
          'word': '오빠',
          'pronunciation': 'o-ppa',
          'meaning': 'Abi (kız söyler)',
          'usage': 'Kız büyük erkek kardeşe'
        },
        {
          'word': '동생',
          'pronunciation': 'dong-saeng',
          'meaning': 'Küçük kardeş',
          'usage': 'Yaşı küçük kardeşe'
        },
        {
          'word': '남동생',
          'pronunciation': 'nam-dong-saeng',
          'meaning': 'Erkek küçük kardeş',
          'usage': 'Özellikle erkek küçük kardeş'
        },
        {
          'word': '첫째',
          'pronunciation': 'cheot-jjae',
          'meaning': 'İlk çocuk',
          'usage': 'En büyük çocuk'
        },
        {
          'word': '둘째',
          'pronunciation': 'dul-jjae',
          'meaning': 'İkinci çocuk',
          'usage': 'Ortanca çocuk'
        },
        {
          'word': '막내',
          'pronunciation': 'mak-nae',
          'meaning': 'En küçük',
          'usage': 'Ailenin en küçük çocuğu'
        },
        {
          'word': '외아들',
          'pronunciation': 'oe-a-deul',
          'meaning': 'Tek oğul',
          'usage': 'Ailenin tek erkek çocuğu'
        },
        {
          'word': '쌍둥이',
          'pronunciation': 'ssang-dung-i',
          'meaning': 'İkizler',
          'usage': 'Aynı anda doğan kardeşler'
        },
        {
          'word': '삼형제',
          'pronunciation': 'sam-hyeong-je',
          'meaning': 'Üç erkek kardeş',
          'usage': 'Üç erkek kardeş'
        },
      ],
    },
    {
      'title': 'Kız Kardeşler',
      'korean': '여자 형제',
      'content': 'Kız kardeşler için kullanılan terimler:',
      'details': 'Bu terimler de konuşan kişinin cinsiyetine göre değişir.',
      'examples': [
        {
          'word': '누나',
          'pronunciation': 'nu-na',
          'meaning': 'Abla (erkek söyler)',
          'usage': 'Erkek büyük kız kardeşe'
        },
        {
          'word': '언니',
          'pronunciation': 'eon-ni',
          'meaning': 'Abla (kız söyler)',
          'usage': 'Kız büyük kız kardeşe'
        },
        {
          'word': '여동생',
          'pronunciation': 'yeo-dong-saeng',
          'meaning': 'Kız küçük kardeş',
          'usage': 'Küçük kız kardeş'
        },
        {
          'word': '큰딸',
          'pronunciation': 'keun-ttal',
          'meaning': 'Büyük kız',
          'usage': 'En büyük kız çocuk'
        },
        {
          'word': '작은딸',
          'pronunciation': 'ja-geun-ttal',
          'meaning': 'Küçük kız',
          'usage': 'Küçük kız çocuk'
        },
        {
          'word': '외동딸',
          'pronunciation': 'oe-dong-ttal',
          'meaning': 'Tek kız',
          'usage': 'Ailenin tek kız çocuğu'
        },
        {
          'word': '자매',
          'pronunciation': 'ja-mae',
          'meaning': 'Kız kardeşler',
          'usage': 'Kız kardeşler genel'
        },
        {
          'word': '삼자매',
          'pronunciation': 'sam-ja-mae',
          'meaning': 'Üç kız kardeş',
          'usage': 'Üç kız kardeş'
        },
        {
          'word': '친자매',
          'pronunciation': 'chin-ja-mae',
          'meaning': 'Öz kız kardeşler',
          'usage': 'Aynı anne babadan'
        },
        {
          'word': '의자매',
          'pronunciation': 'ui-ja-mae',
          'meaning': 'Üvey kız kardeşler',
          'usage': 'Farklı anne babadan'
        },
      ],
    },
    {
      'title': 'Büyükanne ve Büyükbaba',
      'korean': '조부모',
      'content': 'Büyük anne ve babalar için terimler:',
      'details': 'Anne ve baba tarafına göre farklı isimler kullanılır.',
      'examples': [
        {
          'word': '할아버지',
          'pronunciation': 'ha-ra-beo-ji',
          'meaning': 'Büyükbaba (genel)',
          'usage': 'Her iki taraf için'
        },
        {
          'word': '할머니',
          'pronunciation': 'hal-meo-ni',
          'meaning': 'Büyükanne (genel)',
          'usage': 'Her iki taraf için'
        },
        {
          'word': '친할아버지',
          'pronunciation': 'chin-ha-ra-beo-ji',
          'meaning': 'Büyükbaba (baba tarafı)',
          'usage': 'Babanın babası'
        },
        {
          'word': '친할머니',
          'pronunciation': 'chin-hal-meo-ni',
          'meaning': 'Büyükanne (baba tarafı)',
          'usage': 'Babanın annesi'
        },
        {
          'word': '외할아버지',
          'pronunciation': 'oe-ha-ra-beo-ji',
          'meaning': 'Büyükbaba (anne tarafı)',
          'usage': 'Annenin babası'
        },
        {
          'word': '외할머니',
          'pronunciation': 'oe-hal-meo-ni',
          'meaning': 'Büyükanne (anne tarafı)',
          'usage': 'Annenin annesi'
        },
        {
          'word': '증조할아버지',
          'pronunciation': 'jeung-jo-ha-ra-beo-ji',
          'meaning': 'Büyük büyükbaba',
          'usage': 'Büyükbabanın babası'
        },
        {
          'word': '증조할머니',
          'pronunciation': 'jeung-jo-hal-meo-ni',
          'meaning': 'Büyük büyükanne',
          'usage': 'Büyükbabanın annesi'
        },
        {
          'word': '조상',
          'pronunciation': 'jo-sang',
          'meaning': 'Ata, ecdad',
          'usage': 'Geçmiş nesiller'
        },
        {
          'word': '후손',
          'pronunciation': 'hu-son',
          'meaning': 'Torun, nesil',
          'usage': 'Gelecek nesiller'
        },
      ],
    },
    {
      'title': 'Amca, Dayı, Hala, Teyze',
      'korean': '삼촌과 이모',
      'content': 'Anne ve baba tarafından akrabalar:',
      'details': 'Her akraba türü için farklı kelimeler kullanılır.',
      'examples': [
        {
          'word': '삼촌',
          'pronunciation': 'sam-chon',
          'meaning': 'Amca (baba kardeşi)',
          'usage': 'Babanın erkek kardeşi'
        },
        {
          'word': '고모',
          'pronunciation': 'go-mo',
          'meaning': 'Hala (baba kız kardeşi)',
          'usage': 'Babanın kız kardeşi'
        },
        {
          'word': '외삼촌',
          'pronunciation': 'oe-sam-chon',
          'meaning': 'Dayı (anne erkek kardeşi)',
          'usage': 'Annenin erkek kardeşi'
        },
        {
          'word': '이모',
          'pronunciation': 'i-mo',
          'meaning': 'Teyze (anne kız kardeşi)',
          'usage': 'Annenin kız kardeşi'
        },
        {
          'word': '삼촌댁',
          'pronunciation': 'sam-chon-daek',
          'meaning': 'Amca hanımı',
          'usage': 'Amcanın eşi'
        },
        {
          'word': '고모부',
          'pronunciation': 'go-mo-bu',
          'meaning': 'Hala kocası',
          'usage': 'Halanın eşi'
        },
        {
          'word': '외숙모',
          'pronunciation': 'oe-suk-mo',
          'meaning': 'Dayı hanımı',
          'usage': 'Dayının eşi'
        },
        {
          'word': '이모부',
          'pronunciation': 'i-mo-bu',
          'meaning': 'Teyze kocası',
          'usage': 'Teyzenin eşi'
        },
        {
          'word': '사촌',
          'pronunciation': 'sa-chon',
          'meaning': 'Kuzen',
          'usage': 'Amca, dayı, hala, teyze çocukları'
        },
        {
          'word': '육촌',
          'pronunciation': 'yuk-chon',
          'meaning': 'İkinci kuzen',
          'usage': 'Daha uzak akraba'
        },
      ],
    },
    {
      'title': 'Evlilik ve Eş',
      'korean': '결혼과 배우자',
      'content': 'Evlilik ve eş ile ilgili terimler:',
      'details':
          'Korece\'de eş için farklı saygı seviyelerinde kelimeler vardır.',
      'examples': [
        {
          'word': '결혼',
          'pronunciation': 'gyeol-hon',
          'meaning': 'Evlilik',
          'usage': 'Evlilik kurumu'
        },
        {
          'word': '남편',
          'pronunciation': 'nam-pyeon',
          'meaning': 'Koca, eş (erkek)',
          'usage': 'Kadının eşi'
        },
        {
          'word': '아내',
          'pronunciation': 'a-nae',
          'meaning': 'Karı, eş (kadın)',
          'usage': 'Erkeğin eşi'
        },
        {
          'word': '부인',
          'pronunciation': 'bu-in',
          'meaning': 'Hanım (saygılı)',
          'usage': 'Başkalarının eşi için'
        },
        {
          'word': '신랑',
          'pronunciation': 'sin-rang',
          'meaning': 'Damat',
          'usage': 'Evlenen erkek'
        },
        {
          'word': '신부',
          'pronunciation': 'sin-bu',
          'meaning': 'Gelin',
          'usage': 'Evlenen kadın'
        },
        {
          'word': '약혼자',
          'pronunciation': 'yak-hon-ja',
          'meaning': 'Nişanlı',
          'usage': 'Evlenmeyi planlayan'
        },
        {
          'word': '연인',
          'pronunciation': 'yeon-in',
          'meaning': 'Sevgili',
          'usage': 'Romantik partner'
        },
        {
          'word': '애인',
          'pronunciation': 'ae-in',
          'meaning': 'Sevgili (günlük)',
          'usage': 'Günlük kullanım'
        },
        {
          'word': '배우자',
          'pronunciation': 'bae-u-ja',
          'meaning': 'Eş (resmi)',
          'usage': 'Resmi belgeler'
        },
      ],
    },
    {
      'title': 'Kayın Ailesi',
      'korean': '시댁과 처가',
      'content': 'Evlilik sonrası aile ilişkileri:',
      'details': 'Erkek ve kadın tarafından kayın ailesi için farklı terimler.',
      'examples': [
        {
          'word': '시어머니',
          'pronunciation': 'si-eo-meo-ni',
          'meaning': 'Kaynana (kocanın annesi)',
          'usage': 'Gelinin kaynanası'
        },
        {
          'word': '시아버지',
          'pronunciation': 'si-a-beo-ji',
          'meaning': 'Kayınbaba (kocanın babası)',
          'usage': 'Gelinin kayınbabası'
        },
        {
          'word': '장모님',
          'pronunciation': 'jang-mo-nim',
          'meaning': 'Kaynana (karının annesi)',
          'usage': 'Damadın kaynanası'
        },
        {
          'word': '장인어른',
          'pronunciation': 'jang-in-eo-reun',
          'meaning': 'Kayınbaba (karının babası)',
          'usage': 'Damadın kayınbabası'
        },
        {
          'word': '시누이',
          'pronunciation': 'si-nu-i',
          'meaning': 'Görümce',
          'usage': 'Kocanın kız kardeşi'
        },
        {
          'word': '시동생',
          'pronunciation': 'si-dong-saeng',
          'meaning': 'Kayınbirader',
          'usage': 'Kocanın erkek kardeşi'
        },
        {
          'word': '처남',
          'pronunciation': 'cheo-nam',
          'meaning': 'Kayınbirader (karının erkek kardeşi)',
          'usage': 'Karının erkek kardeşi'
        },
        {
          'word': '처제',
          'pronunciation': 'cheo-je',
          'meaning': 'Baldız (karının kız kardeşi)',
          'usage': 'Karının kız kardeşi'
        },
        {
          'word': '시댁',
          'pronunciation': 'si-daek',
          'meaning': 'Koca tarafı aile',
          'usage': 'Erkek tarafı aile'
        },
        {
          'word': '처가',
          'pronunciation': 'cheo-ga',
          'meaning': 'Karı tarafı aile',
          'usage': 'Kadın tarafı aile'
        },
      ],
    },
    {
      'title': 'Torunlar ve Gelecek Nesiller',
      'korean': '손자손녀',
      'content': 'Çocuklar ve torunlar:',
      'details': 'Aile soyunun devamı ile ilgili terimler.',
      'examples': [
        {
          'word': '손자',
          'pronunciation': 'son-ja',
          'meaning': 'Erkek torun',
          'usage': 'Oğlun erkek çocuğu'
        },
        {
          'word': '손녀',
          'pronunciation': 'son-nyeo',
          'meaning': 'Kız torun',
          'usage': 'Oğlun kız çocuğu'
        },
        {
          'word': '외손자',
          'pronunciation': 'oe-son-ja',
          'meaning': 'Erkek torun (kız tarafından)',
          'usage': 'Kızın erkek çocuğu'
        },
        {
          'word': '외손녀',
          'pronunciation': 'oe-son-nyeo',
          'meaning': 'Kız torun (kız tarafından)',
          'usage': 'Kızın kız çocuğu'
        },
        {
          'word': '증손자',
          'pronunciation': 'jeung-son-ja',
          'meaning': 'Erkek büyük torun',
          'usage': 'Torunun erkek çocuğu'
        },
        {
          'word': '증손녀',
          'pronunciation': 'jeung-son-nyeo',
          'meaning': 'Kız büyük torun',
          'usage': 'Torunun kız çocuğu'
        },
        {
          'word': '고손자',
          'pronunciation': 'go-son-ja',
          'meaning': 'Erkek büyük büyük torun',
          'usage': 'Büyük torunun erkek çocuğu'
        },
        {
          'word': '혈통',
          'pronunciation': 'hyeol-tong',
          'meaning': 'Soy, kan bağı',
          'usage': 'Aile soyunu belirtir'
        },
        {
          'word': '대대손손',
          'pronunciation': 'dae-dae-son-son',
          'meaning': 'Nesilden nesile',
          'usage': 'Kuşaktan kuşağa'
        },
        {
          'word': '세대',
          'pronunciation': 'se-dae',
          'meaning': 'Nesil, kuşak',
          'usage': 'Aynı dönem doğanlar'
        },
      ],
    },
    {
      'title': 'Saygı ve Hitap Şekilleri',
      'korean': '존댓말과 호칭',
      'content': 'Aile içinde saygı ifadeleri:',
      'details': 'Korece\'de yaş ve aile hiyerarşisi çok önemlidir.',
      'examples': [
        {
          'word': '어른',
          'pronunciation': 'eo-reun',
          'meaning': 'Büyük, yaşlı',
          'usage': 'Saygı gösterilecek kişi'
        },
        {
          'word': '웃어른',
          'pronunciation': 'us-eo-reun',
          'meaning': 'Aile büyüğü',
          'usage': 'Aile hiyerarşisinde üst'
        },
        {
          'word': '아랫사람',
          'pronunciation': 'a-raet-sa-ram',
          'meaning': 'Küçük, ast',
          'usage': 'Yaşça küçük olan'
        },
        {
          'word': '말씀',
          'pronunciation': 'mal-sseum',
          'meaning': 'Söz (saygılı)',
          'usage': 'Büyüklerin sözü'
        },
        {
          'word': '말',
          'pronunciation': 'mal',
          'meaning': 'Söz (günlük)',
          'usage': 'Normal konuşma'
        },
        {
          'word': '진지',
          'pronunciation': 'jin-ji',
          'meaning': 'Yemek (saygılı)',
          'usage': 'Büyüklerin yemeği'
        },
        {
          'word': '밥',
          'pronunciation': 'bap',
          'meaning': 'Yemek (günlük)',
          'usage': 'Normal yemek'
        },
        {
          'word': '주무시다',
          'pronunciation': 'ju-mu-si-da',
          'meaning': 'Uyumak (saygılı)',
          'usage': 'Büyüklerin uyuması'
        },
        {
          'word': '자다',
          'pronunciation': 'ja-da',
          'meaning': 'Uyumak (günlük)',
          'usage': 'Normal uyumak'
        },
        {
          'word': '계시다',
          'pronunciation': 'gye-si-da',
          'meaning': 'Bulunmak (saygılı)',
          'usage': 'Büyüklerin varlığı'
        },
      ],
    },
    {
      'title': 'Modern Aile Yapıları',
      'korean': '현대 가족',
      'content': 'Günümüz aile yapıları ve terimler:',
      'details': 'Modern toplumda değişen aile kavramları.',
      'examples': [
        {
          'word': '핵가족',
          'pronunciation': 'haek-ga-jok',
          'meaning': 'Çekirdek aile',
          'usage': 'Anne, baba, çocuklar'
        },
        {
          'word': '대가족',
          'pronunciation': 'dae-ga-jok',
          'meaning': 'Büyük aile',
          'usage': 'Birden fazla nesil bir arada'
        },
        {
          'word': '한부모가족',
          'pronunciation': 'han-bu-mo-ga-jok',
          'meaning': 'Tek ebeveyn aile',
          'usage': 'Anne veya baba ile çocuklar'
        },
        {
          'word': '입양',
          'pronunciation': 'ip-yang',
          'meaning': 'Evlat edinme',
          'usage': 'Yasal olarak çocuk alma'
        },
        {
          'word': '양자',
          'pronunciation': 'yang-ja',
          'meaning': 'Evlatlık',
          'usage': 'Evlat edinilen çocuk'
        },
        {
          'word': '의붓아버지',
          'pronunciation': 'ui-but-a-beo-ji',
          'meaning': 'Üvey baba',
          'usage': 'Annenin ikinci eşi'
        },
        {
          'word': '의붓어머니',
          'pronunciation': 'ui-but-eo-meo-ni',
          'meaning': 'Üvey anne',
          'usage': 'Babanın ikinci eşi'
        },
        {
          'word': '재혼',
          'pronunciation': 'jae-hon',
          'meaning': 'Yeniden evlilik',
          'usage': 'İkinci evlilik'
        },
        {
          'word': '이혼',
          'pronunciation': 'i-hon',
          'meaning': 'Boşanma',
          'usage': 'Evliliğin sona ermesi'
        },
        {
          'word': '독신',
          'pronunciation': 'dok-sin',
          'meaning': 'Bekar',
          'usage': 'Evlenmemiş kişi'
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
        title: const Text('가족 및 관계'),
        backgroundColor: const Color(0xFF8E24AA),
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
                      '${currentStep + 1} / ${familySteps.length}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF8E24AA),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: (currentStep + 1) / familySteps.length,
                  backgroundColor: Colors.grey.shade300,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(Color(0xFF8E24AA)),
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
                        familySteps[currentStep]['title'],
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF8E24AA),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      if (familySteps[currentStep]['examples'].isEmpty)
                        // 기본 설명 (첫 번째 단계)
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () =>
                                  _speak(familySteps[currentStep]['korean']),
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xFF8E24AA).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                      color: const Color(0xFF8E24AA)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      familySteps[currentStep]['korean'],
                                      style: const TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF8E24AA),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    const Icon(
                                      Icons.volume_up,
                                      color: Color(0xFF8E24AA),
                                      size: 28,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              familySteps[currentStep]['content'],
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
                                familySteps[currentStep]['details'],
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
                        // 가족 관계 상세 설명
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                familySteps[currentStep]['content'],
                                style: const TextStyle(
                                  fontSize: 16,
                                  height: 1.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20),

                              Expanded(
                                child: ListView.builder(
                                  itemCount: familySteps[currentStep]
                                          ['examples']
                                      .length,
                                  itemBuilder: (context, index) {
                                    final example = familySteps[currentStep]
                                        ['examples'][index];
                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 12),
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: const Color(0xFF8E24AA)
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
                                        onTap: () => _speak(example['word']),
                                        borderRadius: BorderRadius.circular(12),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Row(
                                            children: [
                                              // 가족 관계 아이콘
                                              Container(
                                                width: 60,
                                                height: 60,
                                                decoration: BoxDecoration(
                                                  color: const Color(0xFF8E24AA)
                                                      .withOpacity(0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xFF8E24AA)),
                                                ),
                                                child: const Center(
                                                  child: Icon(
                                                    Icons.family_restroom,
                                                    color: Color(0xFF8E24AA),
                                                    size: 28,
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
                                                    // 한국어 단어
                                                    Text(
                                                      example['word'],
                                                      style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xFF8E24AA),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),

                                                    // 발음
                                                    Text(
                                                      example['pronunciation'],
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors
                                                            .grey.shade700,
                                                        fontFamily: 'monospace',
                                                      ),
                                                    ),
                                                    const SizedBox(height: 8),

                                                    // 의미
                                                    Text(
                                                      example['meaning'],
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),

                                                    // 사용법
                                                    Text(
                                                      example['usage'],
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors
                                                            .grey.shade600,
                                                        height: 1.4,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              // 음성 재생 아이콘
                                              const Icon(
                                                Icons.volume_up,
                                                color: Color(0xFF8E24AA),
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
                                        familySteps[currentStep]['details'],
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
                if (currentStep < familySteps.length - 1)
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        currentStep++;
                      });
                    },
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text('Sonraki'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8E24AA),
                      foregroundColor: Colors.white,
                    ),
                  )
                else
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('가족 및 관계 강의 완료! 정말 잘하셨어요!'),
                          backgroundColor: Color(0xFF8E24AA),
                        ),
                      );
                    },
                    icon: const Icon(Icons.check),
                    label: const Text('Tamamla'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8E24AA),
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
