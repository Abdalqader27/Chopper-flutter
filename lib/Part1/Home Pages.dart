import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_json_chopper/data/post_api_service.dart';
import 'package:provider/provider.dart';

import 'Singe Post Page.dart';

class Home_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Chopper Log '),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final response = await Provider.of<PostApiServices>(context).postPost({'key': 'value'});
          print(response.body);
        },
      ),
      body: _buildBody(context),
    );
  }

  FutureBuilder<Response> _buildBody(BuildContext context) {
    return FutureBuilder<Response>(
      future: Provider.of<PostApiServices>(context).getPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List posts = json.decode(snapshot.data.bodyString);
          return _buildPosts(context, posts);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView _buildPosts(BuildContext context, List posts) {
    return ListView.builder(
        itemCount: posts.length,
        padding: EdgeInsets.all(8),
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            child: ListTile(
              title: Text(
                posts[index]['title'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(posts[index]['body']),
              onTap: () => _navigationToPsot(context, posts[index]['id']),
            ),
          );
        });
  }
}

_navigationToPsot(BuildContext context, int id) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => SinglePostPage(postId: id)));
}
