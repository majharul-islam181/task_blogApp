import 'dart:convert';

import 'package:blog_app/models/response/bloglist_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BlogListScreen extends StatefulWidget {
  const BlogListScreen({super.key});

  @override
  State<BlogListScreen> createState() => _BlogListScreenState();
}

class _BlogListScreenState extends State<BlogListScreen> {
  
  List<bloglistModel> bloglist = [];

  Future<List<bloglistModel>> getData() async {
    final response = await http
        .get(Uri.parse("https://apitest.smartsoft-bd.com/api/admin/blog-news"));

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        bloglist.add(bloglistModel.fromJson(index));
      }
      return bloglist;
    } else {
      return bloglist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog List'),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: bloglist.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 160,
                    color: Colors.green[200],
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    margin: const EdgeInsets.all(10),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //title, sub_title, slug, description, category_id, date, tags
                        Text(
                          'Title: ${bloglist[index].} }',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Sub-Title:',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Slug:',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Description:',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Category-id:',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
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
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
