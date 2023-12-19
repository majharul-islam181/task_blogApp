import 'dart:convert';
import 'dart:developer';

import 'package:blog_app/models/response/bloglist_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BlogListScreen extends StatefulWidget {
  final String token;
  const BlogListScreen({super.key, required this.token});

  @override
  State<BlogListScreen> createState() => _BlogListScreenState();
}

class _BlogListScreenState extends State<BlogListScreen> {
  List<bloglistModelDataBlogsData> bloglist = [];

  Future<List<bloglistModelDataBlogsData>> getData() async {
    Map<String, String> headers = {
      "Authorization": 'Bearer ${widget.token}',
    };
    final response = await http.get(
        Uri.parse("https://apitest.smartsoft-bd.com/api/admin/blog-news"),
        headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> successData = jsonDecode(response.body);
      bloglistModel bloglistData = bloglistModel.fromJson(successData);
      for (var element in bloglistData.data!.blogs!.data!) {
        log(element!.id.toString());
        bloglist.add(element);
      }
      return bloglist;
    } else {
      return bloglist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Title:  ${bloglist[index].title}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Sub-Title:  ${bloglist[index].subTitle}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Slug:  ${bloglist[index].slug}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Description:  ${bloglist[index].description}',
                          style: const TextStyle(fontSize: 14),
                          maxLines: 1,
                        ),
                        Text(
                          'Category-id:  ${bloglist[index].categoryId}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Date: ${bloglist[index].date} ',
                          style: const TextStyle(fontSize: 14),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
      ),
    );
  }
}
