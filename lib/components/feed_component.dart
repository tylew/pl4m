import 'package:flutter/material.dart';
import 'package:map_app/models/post.dart';

class FeedComponent extends StatefulWidget {
  final Future<List<Post>> Function() fetchPosts;

  const FeedComponent({super.key, required this.fetchPosts});

  @override
  State<FeedComponent> createState() => _FeedComponentState();
}

class _FeedComponentState extends State<FeedComponent> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
