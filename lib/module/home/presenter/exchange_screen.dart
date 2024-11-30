import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RedeemScreen extends StatelessWidget {
  const RedeemScreen({super.key});

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Modular.to.navigate('/'); 
        break;
      case 1:
        Modular.to.navigate('/redeem'); 
        break;
      case 2:
        Modular.to.navigate('/collect');
        break;
    }
  }

  void _showSuccessModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1B2330),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                backgroundColor: Color(0xFF7B61FF),
                radius: 40,
                child: Icon(
                  Icons.check,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Benefício resgatado",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Obrigado por contribuir para um futuro sustentável",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF000A18),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "#492394294",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000A18), 
      appBar: AppBar(
        backgroundColor: const Color(0xFF000A18),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.receipt_long, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    _showSuccessModal(context);
                  },
                  child: _buildGiftCard(
                    logo: 'https://via.placeholder.com/150', 
                    title: 'Gift Card\nIfood 20\$',
                    credits: '20 créditos',
                    color: Colors.red,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _showSuccessModal(context);
                  },
                  child: _buildGiftCard(
                    logo: 'https://via.placeholder.com/150', 
                    title: 'Gift Card\nUber 10\$',
                    credits: '10 \$BURGER',
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1B2330),
        selectedItemColor: const Color(0xFF7B61FF),
        unselectedItemColor: Colors.grey,
        currentIndex: 1, 
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Resgatar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive),
            label: 'Coleta',
          ),
        ],
      ),
    );
  }

  Widget _buildGiftCard({
    required String logo,
    required String title,
    required String credits,
    required Color color,
  }) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1B2330),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(logo),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            credits,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
