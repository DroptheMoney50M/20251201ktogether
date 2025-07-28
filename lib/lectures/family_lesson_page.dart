import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

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
                                              // 가족 아이콘
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

                                                    // 터키어 뜻
                                                    Text(
                                                      example['meaning'],
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.black87,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),

                                                    // 사용법
                                                    Text(
                                                      example['usage'],
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors
                                                            .grey.shade600,
                                                        fontStyle:
                                                            FontStyle.italic,
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
                          content: Text('가족 및 관계 강의 완료! 훌륭해요!'),
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
