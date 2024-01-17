import 'package:flutter/material.dart';
import 'package:toboto_bloc/model/blog.dart';

class BlogDetails extends StatelessWidget {
  final Blog blog;

  const BlogDetails({Key? key, required this.blog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(blog.title ?? 'Blog Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(blog.thumbnail ?? ''),
            SizedBox(height: 16),
            Text(
              'Title: ${blog.title}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Author: ${blog.author}'),
            SizedBox(height: 8),
            Text('Content: ${blog.content}'),
          ],
        ),
      ),
    );
  }
}
