import 'package:flutter/material.dart';
import 'package:finals/database/helper.dart';
import 'package:finals/constants/fonts.dart';

class Review extends StatefulWidget {
  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> reviews = [];

  @override
  void initState() {
    super.initState();
    _loadReviews();
  }

  Future<void> _loadReviews() async {
    final List<Map<String, dynamic>> loadedReviews = await dbHelper.getReviews();
    setState(() {
      reviews = loadedReviews;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: DataTable(
            columns: const [
              DataColumn(label: Text('NUMBER')),
              DataColumn(label: Text('COMMENTS')),
            ],
            rows: reviews
                .map(
                  (review) => DataRow(
                    cells: [
                      DataCell(Text(review['id'].toString())),
                      DataCell(Text(review['review'])),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddReviewDialog();
        },
        child: Icon(Icons.add, color: Colors.white,),
        backgroundColor: Color(0xFF674846),
      ),
    );
  }

  Future<void> _showAddReviewDialog() async {
    TextEditingController reviewController = TextEditingController();

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('ADD REVIEW', style: headingTextStyle)),
          content: TextField(
            controller: reviewController,
            decoration: InputDecoration(labelText: 'Type Here..'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('CANCEL', style: subheadingTextStyle),
            ),
            TextButton(
              onPressed: () async {
                await dbHelper.insertReview(reviewController.text);
                _loadReviews();
                Navigator.of(context).pop();
              },
              child: Text('ADD', style: subheadingTextStyle),
            ),
          ],
        );
      },
    );
  }
}
