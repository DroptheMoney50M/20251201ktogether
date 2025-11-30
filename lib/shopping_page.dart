import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({Key? key}) : super(key: key);

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  final FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _initTts();
  }

  Future<void> _initTts() async {
    await flutterTts.setLanguage("ko-KR"); // 한국어로 변경
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
  }

  Future<void> _speak(String text) async {
    await flutterTts.speak(text);
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  Widget _buildPhraseCard({
    required String title,
    required String turkish,
    required IconData icon,
    required Color color,
    bool isHighlight = false,
  }) {
    return Card(
      elevation: isHighlight ? 8 : 4,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: isHighlight ? 12 : 8,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(isHighlight ? 20 : 12),
      ),
      child: InkWell(
        onTap: () => _speak(turkish),
        borderRadius: BorderRadius.circular(isHighlight ? 20 : 12),
        child: Container(
          padding: EdgeInsets.all(isHighlight ? 24 : 16),
          decoration: BoxDecoration(
            gradient: isHighlight
                ? LinearGradient(
                    colors: [color.withOpacity(0.7), color],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
            color: isHighlight ? null : Colors.white,
            borderRadius: BorderRadius.circular(isHighlight ? 20 : 12),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isHighlight
                      ? Colors.white.withOpacity(0.3)
                      : color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  size: isHighlight ? 40 : 32,
                  color: isHighlight ? Colors.white : color,
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
                        fontSize: isHighlight ? 16 : 14,
                        fontWeight: FontWeight.w600,
                        color: isHighlight ? Colors.white.withOpacity(0.9) : Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      turkish,
                      style: TextStyle(
                        fontSize: isHighlight ? 22 : 18,
                        fontWeight: FontWeight.bold,
                        color: isHighlight ? Colors.white : color,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.volume_up,
                color: isHighlight ? Colors.white : color,
                size: isHighlight ? 32 : 24,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Color(0xFF424242),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '🛍️ Alışveriş',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFE91E63),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFFE91E63).withOpacity(0.1),
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Dongdaemun · Myeongdong Alışveriş İfadeleri',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),

            // 킬러 콘텐츠 - 깎아주세요
            _buildPhraseCard(
              title: 'Pazarlık Yapma (깎아주세요)',
              turkish: '깎아주세요',
              icon: Icons.local_offer,
              color: const Color(0xFFE91E63),
              isHighlight: true,
            ),

            _buildSectionTitle('Fiyat Sorma (가격 문의)'),
            _buildPhraseCard(
              title: 'Ne Kadar? (얼마예요?)',
              turkish: '얼마예요?',
              icon: Icons.attach_money,
              color: Colors.green,
            ),
            _buildPhraseCard(
              title: 'Çok Pahalı (너무 비싸요)',
              turkish: '너무 비싸요',
              icon: Icons.trending_up,
              color: Colors.orange,
            ),
            _buildPhraseCard(
              title: 'Daha Ucuz (더 싸게 해주세요)',
              turkish: '더 싸게 해주세요',
              icon: Icons.arrow_downward,
              color: Colors.blue,
            ),

            _buildSectionTitle('Beden & Renk (사이즈 & 색상)'),
            _buildPhraseCard(
              title: 'Deneyebilir Miyim? (입어봐도 돼요?)',
              turkish: '입어봐도 돼요?',
              icon: Icons.checkroom,
              color: Colors.purple,
            ),
            _buildPhraseCard(
              title: 'Daha Büyük Beden (더 큰 사이즈)',
              turkish: '더 큰 사이즈 있어요?',
              icon: Icons.straighten,
              color: Colors.indigo,
            ),
            _buildPhraseCard(
              title: 'Başka Renk (다른 색)',
              turkish: '다른 색 있어요?',
              icon: Icons.palette,
              color: Colors.pink,
            ),

            _buildSectionTitle('Satın Alma & Ödeme (구매 & 결제)'),
            _buildPhraseCard(
              title: 'Bunu Alacağım (이거 살게요)',
              turkish: '이거 살게요',
              icon: Icons.shopping_cart,
              color: Colors.teal,
            ),
            _buildPhraseCard(
              title: 'Kart Kabul Ediliyor Mu? (카드 돼요?)',
              turkish: '카드 돼요?',
              icon: Icons.credit_card,
              color: Colors.cyan,
            ),
            _buildPhraseCard(
              title: 'Fiş Alabilir Miyim? (영수증 주세요)',
              turkish: '영수증 주세요',
              icon: Icons.receipt,
              color: Colors.brown,
            ),
            _buildPhraseCard(
              title: 'Poşet Alabilir Miyim? (봉투 주세요)',
              turkish: '봉투 주세요',
              icon: Icons.shopping_bag,
              color: Colors.amber,
            ),

            _buildSectionTitle('Diğer (기타)'),
            _buildPhraseCard(
              title: 'İade Yapabilir Miyim? (환불 돼요?)',
              turkish: '환불 돼요?',
              icon: Icons.assignment_return,
              color: Colors.red,
            ),
            _buildPhraseCard(
              title: 'Düşüneceğim (생각해볼게요)',
              turkish: '생각해볼게요',
              icon: Icons.psychology,
              color: Colors.grey,
            ),
            _buildPhraseCard(
              title: 'Teşekkürler (감사합니다)',
              turkish: '감사합니다',
              icon: Icons.thumb_up,
              color: Colors.lightGreen,
            ),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.pink[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.pink[200]!),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.lightbulb_outline, color: Colors.pink[700]),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Alışveriş İpuçları',
                            style: TextStyle(
                              color: Colors.pink[900],
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '• Dongdaemun toptan pazarı sabah erken saatlerde daha canlıdır\n'
                      '• Birkaç ürün alıyorsanız "Toplu alırsam?" deyin\n'
                      '• Kartlara dokunarak sesli dinleyebilirsiniz',
                      style: TextStyle(
                        color: Colors.pink[900],
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
