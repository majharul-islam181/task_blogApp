import 'dart:developer';
import 'dart:ffi';

import 'package:blog_app/costom_widgets/costom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class CreateBlogScreen extends StatefulWidget {
  final String token;
  const CreateBlogScreen({super.key, required this.token, });

  @override
  State<CreateBlogScreen> createState() => _CreateBlogScreenState();
}

class _CreateBlogScreenState extends State<CreateBlogScreen> {
  final _titleController = TextEditingController();
  final _subTitleController = TextEditingController();
  final _slugController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _categoryController = TextEditingController();
  final _dateController = TextEditingController();

  collectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(200),
      lastDate: DateTime(20254),
    );
    if (pickedDate != null) {
      setState(() {
        _dateController.text = DateFormat('dd-MM-yyyy').format(pickedDate);
      });
    }
  }

  void createBlog(String title, String subTitle, String slug, String categoryId,
      String description, String date) async {

    int a = int.parse(categoryId);

    Map<String, String> headers = {
      "Authorization": 'Bearer ${widget.token}',
    };

    try {
      Response response = await post(
          Uri.parse(
              'https://apitest.smartsoft-bd.com/api/admin/blog-news/store'),headers: headers,
          body: {
            'title': title,
            'sub_title': subTitle,
            'slug': slug,
            'description': description,
            'category_id': a.toInt(),
            'date': date,
          });

      if (response.statusCode == 200) {
        log('success');
      }
    } catch (error) {
      log(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Blog'),
      ),
      body: Column(
        children: [
          CustomTextField(
              labelText: "Enter a Title",
              textEditingController: _titleController),
          CustomTextField(
              labelText: "Enter a sub-Title",
              textEditingController: _subTitleController),
          CustomTextField(
              labelText: "Enter a slug",
              textEditingController: _slugController),
          CustomTextField(
              labelText: "Enter a description",
              textEditingController: _descriptionController),
          CustomTextField(
              labelText: "Enter a category id",
              textEditingController: _categoryController),
          Container(
              padding: const EdgeInsets.all(15),
              height: MediaQuery.of(context).size.width / 3,
              child: Center(
                  child: TextField(
                controller: _dateController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_today),
                  labelText: "Enter Date",
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2100));

                  if (pickedDate != null) {
                    print(pickedDate);
                    String formattedDate =
                        DateFormat('dd-MM-yyyy').format(pickedDate);
                    print(formattedDate);
                    setState(() {
                      _dateController.text = formattedDate;
                    });
                  } else {}
                },
              ))),
          ElevatedButton(
              onPressed: () {
                createBlog(
                    _titleController.text,
                    _subTitleController.text,
                    _slugController.text,
                    _categoryController.text,
                    _descriptionController.text,
                    _dateController.text);
              },
              child: const Text(
                "Submit",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
