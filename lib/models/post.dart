import 'package:flutter/material.dart';

class Post {
  final Key? key;
  final String username;
  final String content;
  final DateTime time;
  final int likes;
  final int dislikes;
  String? topComment;

  Post(
      {this.key,
      required this.username,
      required this.content,
      required this.time,
      required this.likes,
      required this.dislikes,
      this.topComment});
}

class PostWidget extends StatelessWidget {
  final Post post;

  PostWidget({required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      // elevation: 3,
      color: Color(0xFFF3F3F3),
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(post.username),
                Text(post.time.toString()), // Convert DateTime to String
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(post.content),
          ),
          // if (post.topComment != null)
          //   Padding(
          //     padding: EdgeInsets.all(10),
          //     child: Text('Top Comment: ${post.topComment}'),
          //   ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.comment),
                // Text('${post.likes} likes'),
                Row(
                  children: [
                    Icon(Icons.star_border),
                    SizedBox(width: 5),
                    Text('${post.likes}'),
                    SizedBox(width: 10),
                    Icon(Icons.expand_more),
                    SizedBox(width: 5),
                    Text('${post.dislikes}'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
