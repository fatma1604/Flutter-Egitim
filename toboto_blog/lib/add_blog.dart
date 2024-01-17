//texform kulama sebebbimiz doğrumu diye kontrol etmek isteye biliriz ve bunu kulanırız
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class AddBlog extends StatefulWidget {
  const AddBlog({Key? key}) : super(key: key);

  @override
  _AddBlogState createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  final _fromKey = GlobalKey<FormFieldState>();  //kontrol amaçlı
  final ImagePicker imagePicker = ImagePicker();
  XFile? selectedImage;
  String title = "";
  String content = "";
  String authour = "";
  submit() async {
    //post isteği atma
    Uri url = Uri.parse("https://tobetoapi.halitkalayci.com/api/Articles");
    var request = http.MultipartRequest("POST", url);
    request.fields["title"] = title;
    request.fields["Content"] = content;
    request.fields["auther"] = authour;
    if (selectedImage != null) {
      http.MultipartFile file =
          await http.MultipartFile.fromPath("File", selectedImage!.path);
      request.files.add(file);
    }
    final response = await request.send();
    if (response.statusCode == 201) {
      Navigator.pop(context, true);
    }
  }

  pickImage() async {
    XFile? selectedFile =
        await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      selectedImage = selectedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("blog ekle")),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
             //key alanı var
            key: _fromKey,
            child: ListView(children: [
              if (selectedImage != null) Image.file(File(selectedImage!.path)),
              ElevatedButton(
                  onPressed: () {
                    pickImage();
                  },
                  child: Text("Fotoraf Seç")),
              //bunun için image picker dosyası yükledik
              TextFormField(
                decoration: const InputDecoration(label: Text("Blog Bağlığı")),
                onSaved: (newValue) {
                  title = newValue!;
                }, //sev ve valudet alanları cağrıldında calışıcak ve kontrol yapılıcaktır
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Lütfen Bir Blog Seçiniz";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(label: Text("Blog İçeriği")),
                maxLength: 5,
                onSaved: (newValue) {
                  content = newValue!;
                }, //sev ve valudet alanları cağrıldında calışıcak ve kontrol yapılıcaktır
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Lütfen Bir İçerik Gireniz";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(label: Text("Adınız")),
                onSaved: (newValue) {
                  authour = newValue!;
                }, //sev ve valudet alanları cağrıldında calışıcak ve kontrol yapılıcaktır
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Lütfen Bir Ad Giriniz";
                  }
                  return null;
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_fromKey.currentState!.validate()) {
                      _fromKey.currentState!.save();
                      submit();
                    }
                  },
                  child: Text("Blog Ekle "))
            ]),
          ),
        ));
  }
}
