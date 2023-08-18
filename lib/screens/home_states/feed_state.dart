import 'package:flutter/material.dart';
import 'package:map_app/models/post.dart';

class FeedState extends StatelessWidget {
  const FeedState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5, top: 5),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [tag('friends'), tag('Global')],
            ),
          ),
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: 40,
              itemBuilder: (BuildContext context, int index) {
                return PostWidget(
                    post: Post(
                  username: 'John Doe',
                  content: 'This is the content of the post.',
                  time: DateTime.now(),
                  likes: 42,
                  dislikes: 8,
                  topComment: 'Great post!',
                ));
              },
            ),
          ),
          Container(
            height: 40,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Start Typing',
                fillColor: Colors.green,
                border: OutlineInputBorder(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget tag(String content) {
    return Container(
      alignment: Alignment.center,
      color: Colors.red,
      child: Text(
        content,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
