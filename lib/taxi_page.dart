import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TaxiPage extends StatefulWidget {
  const TaxiPage({Key? key}) : super(key: key);

  @override
  State<TaxiPage> createState() => _TaxiPageState();
}

class _TaxiPageState extends State<TaxiPage> {
  final FlutterTts flutterTts = FlutterTts();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initTts();
  }

  Future<void> _initTts() async {
    await flutterTts.setLanguage("ko-KR"); // 한국어로 변경
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.4);
  }

  Future<void> _speak(String text) async {
    await flutterTts.speak(text);
  }

  @override
  void dispose() {
    flutterTts.stop();
    _addressController.dispose();
    super.dispose();
  }

  Widget _buildQuickPhrase({
    required String turkish,
    required String description,
    required IconData icon,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFFFA726),
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          turkish,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          description,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.volume_up, color: Color(0xFFFFA726)),
          onPressed: () => _speak(turkish),
        ),
        onTap: () => _speak(turkish),
      ),
    );
  }

  Widget _buildDestinationCard({
    required String name,
    required String turkish,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      elevation: 2,
      child: ListTile(
        leading: const Icon(Icons.location_on, color: Color(0xFF2E7D32)),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(turkish, style: const TextStyle(fontSize: 14)),
        trailing: IconButton(
          icon: const Icon(Icons.volume_up),
          onPressed: () => _speak('$turkish 가주세요'),
        ),
        onTap: () => _speak('$turkish 가주세요'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '🚕 Taksi',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFFFA726),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFFFFA726).withOpacity(0.1),
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          children: [
            // 주소 입력 카드
            Card(
              margin: const EdgeInsets.all(20),
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFFA726), Color(0xFFF57C00)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.local_taxi, size: 60, color: Colors.white),
                    const SizedBox(height: 16),
                    const Text(
                      '여기 가주세요',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '여기 가주세요 / Buraya gidelim lütfen',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _addressController,
                      style: const TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        hintText: 'Adres girin',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: const Icon(Icons.location_on),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_addressController.text.isNotEmpty) {
                          _speak('${_addressController.text} 가주세요');
                        }
                      },
                      icon: const Icon(Icons.volume_up),
                      label: const Text(
                        'Adresi Oku (주소 읽기)',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFFF57C00),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 기본 택시 회화
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Text(
                'Temel Taksi Cümleleri',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF424242),
                ),
              ),
            ),
            _buildQuickPhrase(
              turkish: '여기 가고 싶어요',
              description: 'Buraya gitmek istiyorum',
              icon: Icons.waving_hand,
            ),
            _buildQuickPhrase(
              turkish: '얼마나 걸려요?',
              description: 'Ne kadar sürer?',
              icon: Icons.access_time,
            ),
            _buildQuickPhrase(
              turkish: '얼마예요?',
              description: 'Ne kadar?',
              icon: Icons.attach_money,
            ),
            _buildQuickPhrase(
              turkish: '여기서 세워주세요',
              description: 'Burada durun lütfen',
              icon: Icons.stop_circle,
            ),
            _buildQuickPhrase(
              turkish: '감사합니다',
              description: 'Teşekkür ederim',
              icon: Icons.thumb_up,
            ),

            // 인기 관광지
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 32, 20, 16),
              child: Text(
                'Popüler Yerler',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF424242),
                ),
              ),
            ),
            _buildDestinationCard(
              name: 'İncheon Havalimanı (인천공항)',
              turkish: '인천공항',
            ),
            _buildDestinationCard(
              name: 'Myeongdong (명동)',
              turkish: '명동',
            ),
            _buildDestinationCard(
              name: 'Dongdaemun (동대문)',
              turkish: '동대문',
            ),
            _buildDestinationCard(
              name: 'Gangnam İstasyonu (강남역)',
              turkish: '강남역',
            ),
            _buildDestinationCard(
              name: 'Hongdae (홍대)',
              turkish: '홍대',
            ),
            _buildDestinationCard(
              name: 'Seoul İstasyonu (서울역)',
              turkish: '서울역',
            ),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.orange[200]!),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.orange[700]),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Cümlelere dokunarak sesli dinleyebilirsiniz',
                        style: TextStyle(
                          color: Colors.orange[900],
                          fontSize: 14,
                        ),
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
