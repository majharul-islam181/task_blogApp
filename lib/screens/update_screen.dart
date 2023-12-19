// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import 'package:blog_app/costom_widgets/costom_textfield.dart';
import 'package:blog_app/screens/bloglist_screen.dart';

class UpdateScreen extends StatefulWidget {
  final String token;
  final String id;
  final String title;
  final String subtitle;
  final String slug;
  final String description;
  final String category;
  final String date;

  const UpdateScreen({
    Key? key,
    required this.token,
    required this.id,
    required this.title,
    required this.subtitle,
    required this.slug,
    required this.description,
    required this.category,
    required this.date,
  }) : super(key: key);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
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
    Map<String, String> headers = {
      "Authorization": 'Bearer ${widget.token}',
    };

    try {
      Response response = await post(
          Uri.parse(
              'https://apitest.smartsoft-bd.com/api/admin/blog-news/update/${widget.id}'),
          headers: headers,
          body: {
            'title': title,
            'sub_title': subTitle,
            'slug': slug,
            'description': description,
            'category_id': categoryId,
            'date': date,
          });

      if (response.statusCode == 200) {
        log('success');
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Successful"),
        ));

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BlogListScreen(
                token: widget.token,
              ),
            ));
      }
    } catch (error) {
      log(error.toString());
    }
  }

  @override
  void initState() {
    _titleController.text = widget.title;
    _subTitleController.text = widget.subtitle;
    _slugController.text = widget.slug;
    _descriptionController.text = widget.description;
    _categoryController.text = widget.category;
    _dateController.text = widget.date;

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        title: const Text('Update Screen'),
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
