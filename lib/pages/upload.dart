import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'dart:convert';

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  File? _selectedImage;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: Text('UPLOAD YOUR OWN ANIME',
                            style:TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          ),
                        ],
                      )),
                  decoration: BoxDecoration(
                    gradient:LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight, 
                    colors: [Colors.deepPurple, Colors.teal, Colors.blue],
                    ), 
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.23,
                      right: MediaQuery.of(context).size.width * 0.05,
                      left: MediaQuery.of(context).size.width * 0.05),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: titleController,
                        decoration: InputDecoration(
                          labelText: 'Title Name',
                        ),
                        validator: (value) {
                          if(value==null || value.isEmpty){
                            return 'The title is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Description',
                        ),
                        controller: descriptionController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your description';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        child: Container(
                          alignment: Alignment.center,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.deepPurple,
                                Colors.teal,
                                Colors.blue,
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              'UPLOAD',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          if (_selectedImage != null) {
                            uploadImage(); // Call the upload function when an image is selected
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Image Required"),
                                  content: Text("Please select an image before uploading."),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("OK"),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                      ),
                    ],          
                  ),
                ),
              ],      
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.08,
              left: MediaQuery.of(context).size.width * 0.03,
              right: MediaQuery.of(context).size.width * 0.03,
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.42,
              width: MediaQuery.of(context).size.width * 1,
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(58, 100, 98, 0.298),
                    offset: Offset(0, 6),
                    blurRadius: 12,
                    spreadRadius: 6,
                  ),
                ],
                color: Color.fromARGB(255, 215, 228, 226),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: _selectedImage != null
                    ? Image.file(_selectedImage!)
                    : Text(
                        'No image selected',
                        style: TextStyle(fontSize: 20),
                      ),
              ),
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getImage();
        },
        child: Icon(
          Icons.photo,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue, // You can change the background color if needed
      ),
    );
  }

//function to access the gallery and select an image
  Future<File> getImage() async {
    final ImagePicker _picker = ImagePicker();

    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
      return _selectedImage!;
    } else {
      throw Exception('Image picking failed');
    }
  }

//function to upload the paper
  void uploadImage() async {
    if (_formKey.currentState!.validate()) {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://127.0.0.1:8000/anime/register/'),
      );
      var imageFile = await http.MultipartFile.fromPath(
        'image',
        _selectedImage!.path,
        contentType: MediaType('image', 'jpg'),
      );
      request.files.add(imageFile);
      request.fields['title'] = titleController.text;
      request.fields['description'] = descriptionController.text;

      // Send the request
      var response = await request.send();
      if (response.statusCode == 201) {
        // Paper uploaded successfully
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Upload Successful"),
              content: Text("Paper uploaded successfully."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
        titleController.clear();
        descriptionController.clear();
        setState(() {
          _selectedImage = null;
        });
      } else {
        // Error occurred while uploading paper
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Upload Failed"),
              content: Text("Failed to upload image. Please try again later."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    }
  }
}