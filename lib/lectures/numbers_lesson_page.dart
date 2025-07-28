import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

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
