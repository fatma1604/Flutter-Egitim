import 'package:flutter/material.dart';
import 'package:toboto_bloc/model/blog.dart';
import 'package:toboto_bloc/screens/blog_detaill.dart';

class BlogItem extends StatelessWidget {
  const BlogItem({Key? key, required this.blog}) : super(key: key);
  final Blog blog;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BlogDetails(
                      blog: blog,
                    )));
      },
      child: Card(
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: EdgeInsets.all(8.20),
          child: Column(
            children: [
              AspectRatio(
                  //verdimiz orana göre içindeki childı oranlıyor maksimum whit hegit oranı oluyor
                  aspectRatio: 4 / 2,
                  child: Container(
                      color: Colors.grey[300],
                      child: Image.network(blog.thumbnail!))),
              ListTile(
                title: Text(blog.title!),
                subtitle: Text(blog.author!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
