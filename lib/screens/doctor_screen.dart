import 'package:flutter/material.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  _DoctorScreenState createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  final List<String> _doctors = [
    'Dr. John Doe',
    'Dr. Jane Smith',
    'Dr. James Williams',
    'Dr. Emily Johnson',
    'Dr. Michael Brown',
    'Dr. Elizabeth Davis',
    'Dr. William Garcia',
    'Dr. Susan Martinez',
    'Dr. David Rodriguez',
    'Dr. Linda Hernandez',
    'Dr. Thomas Wilson',
    'Dr. Karen Anderson',
  ];

  List<String> _filteredDoctors = [];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredDoctors.addAll(_doctors);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterDoctors(String query) {
    List<String> filteredList = [];
    if (query.isNotEmpty) {
      _doctors.forEach((doctor) {
        if (doctor.toLowerCase().contains(query.toLowerCase())) {
          filteredList.add(doctor);
        }
      });
    } else {
      filteredList.addAll(_doctors);
    }
    setState(() {
      _filteredDoctors.clear();
      _filteredDoctors.addAll(filteredList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find a Doctor'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.filter_list),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for a doctor',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (value) {
                _filterDoctors(value);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredDoctors.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/imgs/banner.png'),
                  ),
                  title: Text(_filteredDoctors[index]),
                  subtitle: Text('Specialty: Cardiology'),
                  onTap: () {
                    // Navigate to doctor's profile
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
