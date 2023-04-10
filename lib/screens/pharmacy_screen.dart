import 'package:flutter/material.dart';

import '../utils/colors.dart';

class PharmacyScreen extends StatefulWidget {
  const PharmacyScreen({Key? key}) : super(key: key);

  @override
  _PharmacyScreenState createState() => _PharmacyScreenState();
}

class _PharmacyScreenState extends State<PharmacyScreen> {
  @override
  void initState() {
    super.initState();
  }


  List<Pharmacy> pharmacies = [
    Pharmacy(
        name: 'Medplus Pharmacy',
        address: 'No 1, Ikeja City Mall, Alausa, Ikeja, Lagos',
        phone: '+234 701 234 5678',
        rating: 4.5),
    Pharmacy(
        name: 'Healthplus Pharmacy',
        address: 'No 2, The Palms Shopping Mall, Lekki, Lagos',
        phone: '+234 701 234 5678',
        rating: 4.0),
    Pharmacy(
        name: 'Alpha Pharmacy',
        address: 'No 3, Surulere Shopping Mall, Surulere, Lagos',
        phone: '+234 701 234 5678',
        rating: 3.5),
    Pharmacy(
        name: 'Mega Pharmacy',
        address: 'No 4, Apapa Shopping Plaza, Apapa, Lagos',
        phone: '+234 701 234 5678',
        rating: 4.0),
    Pharmacy(
        name: 'Drugfield Pharmacy',
        address: 'No 5, Silverbird Galleria, Victoria Island, Lagos',
        phone: '+234 701 234 5678',
        rating: 3.0),
    Pharmacy(
        name: 'Safeway Pharmacy',
        address: 'No 6, City Mall, Onikan, Lagos',
        phone: '+234 701 234 5678',
        rating: 4.5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.klemon,
        elevation: 0,
        title: Center(child: Text('Pharmacies')),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search for a pharmacy",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: pharmacies.length,
              itemBuilder: (context, index) {
                return PharmacyItem(
                  pharmacy: pharmacies[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Pharmacy {
  final String name;
  final String address;
  final String phone;
  final double rating;

  Pharmacy({
    required this.name,
    required this.address,
    required this.phone,
    required this.rating,
  });
}

class PharmacyItem extends StatelessWidget {
  final Pharmacy pharmacy;
  const PharmacyItem({Key? key, required this.pharmacy}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            pharmacy.name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            pharmacy.address,
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 4),
          Text(
            pharmacy.phone,
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.star, color: Colors.yellow),
              SizedBox(width: 4),
              Text(pharmacy.rating.toString()),
            ],
          ),
        ],
      ),
    );
  }
}
