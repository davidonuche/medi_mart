import 'package:flutter/material.dart';

class CommunityScreen extends StatefulWidget {
  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  List<Map<String, dynamic>> _posts = [    {      'user': 'Jane Doe',      'text': 'I\'ve been struggling with anxiety lately. Any tips?',      'comments': [        {'user': 'John Smith', 'text': 'Have you tried meditation? It helps me.'},        {'user': 'Sara Johnson', 'text': 'You should see a therapist.'},      ]
    },
    {
      'user': 'John Smith',
      'text': 'Does anyone else experience chronic pain?',
      'comments': [        {'user': 'Jane Doe', 'text': 'I do. It can be really tough.'},        {'user': 'Sara Johnson', 'text': 'I don\'t, but I\'m here to support you.'},      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community'),
        actions: [
          IconButton(
            icon: Icon(Icons.chat),
            onPressed: () {
              // Navigate to chat feature
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _posts[index]['user'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(_posts[index]['text']),
                SizedBox(height: 16),
                Divider(),
                SizedBox(height: 16),
                Text(
                  'Comments (${_posts[index]['comments'].length})',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _posts[index]['comments'].length,
                  itemBuilder: (context, commentIndex) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _posts[index]['comments'][commentIndex]['user'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(_posts[index]['comments'][commentIndex]['text']),
                        SizedBox(height: 16),
                        Divider(),
                      ],
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to post creation screen
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
