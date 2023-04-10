import 'package:flutter/material.dart';
import 'package:medi_mart/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF2fa7e1),
                  Color(0xFFadd984),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to MediMart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Find doctors, order medicines, and connect with the community',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Search for medicines or doctors',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Popular Medications',
              style: TextStyle(
                color: AppColor.kdarkblue,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                GridView.count(
                  crossAxisCount: 2,
                  padding: EdgeInsets.all(16.0),
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  children: [
                    _buildMedicationCard(
                        context, 'Ibuprofen', 'assets/imgs/Ibuprofen.png'),
                    _buildMedicationCard(
                        context, 'Paracetamol', 'assets/imgs/paracetamol.png'),
                    _buildMedicationCard(
                        context, 'Paracetamol', 'assets/imgs/doliprane.png'),
                    _buildMedicationCard(
                        context, 'Ibuprofen', 'assets/imgs/ibuprofen400.png'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 5.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              'Promotions',
              style: TextStyle(
                  color: AppColor.kdarkblue,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          _buildPromotionCard(
            context,
            'Free delivery for orders over \$50',
            'Use code FREESHIP at checkout',
            'assets/imgs/banner.png',
          ),
        ],
      ),
    );
  }

  Widget _buildMedicationCard(
      BuildContext context, String name, String imageUrl) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromotionCard(
      BuildContext context, String title, String description, String imageUrl) {
    return Card(
      child: Container(
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF2fa7e1),
              Color(0xFFadd984),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: AppColor.mainColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2),
              Text(
                description,
                style: TextStyle(
                  color: AppColor.kdarkblue,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
