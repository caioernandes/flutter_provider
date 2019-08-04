import 'package:flutter/material.dart';
import 'package:flutter_provider/core/models/post.dart';

class PostListItem extends StatelessWidget {
  final Post post;
  final Function onTap;

  const PostListItem({this.post, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              offset: Offset(0, 2),
              color: Color.fromARGB(80, 0, 0, 0)
            )
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(post.title, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),),
            Text(post.body, maxLines: 2, overflow: TextOverflow.ellipsis,)
          ],
        ),
      ),
    );
  }
}
