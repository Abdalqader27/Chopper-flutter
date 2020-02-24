import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/post_api_service.dart';

class SinglePostPage extends StatelessWidget {
  final int postId;

  const SinglePostPage({Key key, this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context)
    {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Chopper log '),),
      body: FutureBuilder<Response>(
        future: Provider.of<PostApiServices>(context).getPost(postId),
        builder: (context, snapshots)
        {
          if (snapshots.connectionState == ConnectionState.done) {
            final Map post = json.decode(snapshots.data.bodyString);
            return _buildPost(context, post);
          } else {
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
    }

  Padding _buildPost(BuildContext context, Map post)
    {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
          post['title'], style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
          SizedBox(height: 8,),
          Text(
            post['body'],
          ),
        ],
      ),
    );
    }

}