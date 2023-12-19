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
            height: 160,
         
            color: Colors.green[200],
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            margin:const  EdgeInsets.all(10),
            child:const Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //title, sub_title, slug, description, category_id, date, tags
                Text(
                  'Title:',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  'Sub-Title:',
                  style: TextStyle(fontSize: 14),
                ),Text(
                  'Slug:',
                  style: TextStyle(fontSize: 14),
                ),Text(
                  'Description:',
                  style: TextStyle(fontSize: 14),
                ),Text(
                  'Category-id:',
                  style: TextStyle(fontSize: 14),
                ),Text(
                  'Date:',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  'Tags:',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
