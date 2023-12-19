import 'package:blog_app/costom_widgets/costom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
              onPressed: () {},
              child: const Text(
                "Submit",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
