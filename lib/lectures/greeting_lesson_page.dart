import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

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
      'examples': [
        {'situation': 'Tanışırken', 'phrase': '안녕하세요!'},
        {'situation': 'Dükkanda', 'phrase': '안녕하세요, 어서 오세요'},
      ],
    },
    {
      'title': 'Günün Vakitlerine Göre',
      'korean': '좋은 아침입니다',
      'pronunciation': 'Jo-eun a-chim-im-ni-da',
      'turkish': 'Günaydın (çok resmi)',
      'usage': 'Sabah saatlerinde kullanılır',
      'examples': [
        {'situation': 'İş yerinde', 'phrase': '좋은 아침입니다'},
        {'situation': 'Samimi ortam', 'phrase': '안녕히 주무셨어요?'},
      ],
    },
    {
      'title': 'Kendini Tanıtma - İsim',
      'korean': '제 이름은 ___ 입니다',
      'pronunciation': 'Je i-reum-eun ___ im-ni-da',
      'turkish': 'Benim adım ___ (resmi)',
      'usage': 'İlk tanışmalarda kullanılır',
      'examples': [
        {'situation': 'Resmi tanıtım', 'phrase': '제 이름은 김민수입니다'},
        {'situation': 'Arkadaşça', 'phrase': '저는 민수예요'},
      ],
    },
    {
      'title': 'Nereli Olduğunu Söyleme',
      'korean': '저는 터키에서 왔습니다',
      'pronunciation': 'Jeo-neun Teo-ki-e-seo wat-seum-ni-da',
      'turkish': 'Ben Türkiye\'den geldim',
      'usage': 'Ülkenizi tanıtırken kullanılır',
      'examples': [
        {'situation': 'Resmi', 'phrase': '저는 터키에서 왔습니다'},
        {'situation': 'Samimi', 'phrase': '터키에서 왔어요'},
      ],
    },
    {
      'title': 'Hoş Geldiniz',
      'korean': '만나서 반갑습니다',
      'pronunciation': 'Man-na-seo ban-gap-seum-ni-da',
      'turkish': 'Tanıştığımıza memnun oldum',
      'usage': 'İlk tanışmalarda kullanılır',
      'examples': [
        {'situation': 'İş toplantısı', 'phrase': '만나서 반갑습니다'},
        {'situation': 'Arkadaş grubu', 'phrase': '만나서 반가워요'},
      ],
    },
    {
      'title': 'Teşekkür Etme',
      'korean': '감사합니다',
      'pronunciation': 'Gam-sa-ham-ni-da',
      'turkish': 'Teşekkür ederim (resmi)',
      'usage': 'Her durumda kullanılabilir',
      'examples': [
        {'situation': 'Çok resmi', 'phrase': '정말 감사합니다'},
        {'situation': 'Günlük', 'phrase': '고마워요'},
      ],
    },
    {
      'title': 'Özür Dileme',
      'korean': '죄송합니다',
      'pronunciation': 'Joe-song-ham-ni-da',
      'turkish': 'Özür dilerim (resmi)',
      'usage': 'Hata yaptığınızda kullanılır',
      'examples': [
        {'situation': 'Ciddi hata', 'phrase': '정말 죄송합니다'},
        {'situation': 'Hafif özür', 'phrase': '미안해요'},
      ],
    },
    {
      'title': 'Vedalaşma',
      'korean': '안녕히 가세요',
      'pronunciation': 'An-nyeong-hi ga-se-yo',
      'turkish': 'Güle güle (gidene söylenir)',
      'usage': 'Birisi ayrılırken kullanılır',
      'examples': [
        {'situation': 'Siz kalıyorsunuz', 'phrase': '안녕히 가세요'},
        {'situation': 'Siz gidiyorsunuz', 'phrase': '안녕히 계세요'},
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

                      // 주요 문구
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
                              Text(
                                greetingSteps[currentStep]['korean'],
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFF9800),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    greetingSteps[currentStep]['pronunciation'],
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey.shade700,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  const Icon(
                                    Icons.volume_up,
                                    color: Color(0xFFFF9800),
                                    size: 24,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // 터키어 뜻
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          greetingSteps[currentStep]['turkish'],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      const SizedBox(height: 16),

                      // 사용법
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.info, color: Colors.green),
                                const SizedBox(width: 8),
                                const Text(
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
                                fontSize: 14,
                                color: Colors.green.shade700,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // örnek durumlar
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Örnek Durumlar:',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFF9800),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Expanded(
                              child: ListView.builder(
                                itemCount: greetingSteps[currentStep]
                                        ['examples']
                                    .length,
                                itemBuilder: (context, index) {
                                  final example = greetingSteps[currentStep]
                                      ['examples'][index];
                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 12),
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: const Color(0xFFFF9800)
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
                                      onTap: () => _speak(example['phrase']),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  example['situation'],
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFFFF9800),
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  example['phrase'],
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Icon(
                                            Icons.volume_up,
                                            color: Color(0xFFFF9800),
                                            size: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
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
                          content: Text('인사 강의 완료! 훌륭해요!'),
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
