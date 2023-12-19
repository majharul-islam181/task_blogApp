import 'package:flutter/material.dart';

class BlogListScreen extends StatefulWidget {
  const BlogListScreen({super.key});

  @override
  State<BlogListScreen> createState() => _BlogListScreenState();
}

class _BlogListScreenState extends State<BlogListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog List'),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 120,
            width: 100,
            color: Colors.green[200],
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  'Title',
                  style: TextStyle(fontSize: 18),

                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
