import 'package:blog_app/costom_widgets/costom_textfield.dart';
import 'package:flutter/material.dart';

class CreateBlogScreen extends StatefulWidget {
  const CreateBlogScreen({super.key});

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
              labelText: "Enter a category",
              textEditingController: _categoryController),
          CustomTextField(
              labelText: "Enter a date",
              textEditingController: _dateController),
              ElevatedButton(
                onPressed: () {}, 
                child: const Text("Submit")),
        ],
      ),
    );
  }
}
