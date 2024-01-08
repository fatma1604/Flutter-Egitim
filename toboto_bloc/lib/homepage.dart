import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toboto_bloc/blogItem.dart';
import 'package:toboto_bloc/bolg.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List blogList = [];
  @override
  void initState() {
    //metodları çalıştırıyor
    super.initState();
    fetchBlogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
        ),
        body: blogList.isEmpty
            ? Center(
                child: CircularProgressIndicator(), //yükleniyor
              )
            : RefreshIndicator //kaydırdımda yenileme özelliği LİSTEYİ GÜNCELLEME
                (
                    onRefresh: () async {
                      fetchBlogs();
                    },
                    child: ListView.builder(
                      itemBuilder: (ctx, index) =>
                          BlogItem(blog: blogList[index]),
                      itemCount: blogList.length,
                    )));
  }

  void fetchBlogs() async {
    Uri url = Uri.parse("https://tobetoapi.halitkalayci.com/api/Articles");
    final response = await http.get(url);
    final jsonDate = json.decode(response.body);
    setState(() {
      blogList = jsonDate.map((json) => Blog.fromJson(json)).toList();
    });
  }
}
