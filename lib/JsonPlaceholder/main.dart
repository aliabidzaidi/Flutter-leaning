import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlearning/JsonPlaceholder/Post.dart';
import 'package:flutterlearning/JsonPlaceholder/Album.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
          drawer: new AppDrawer(),
          appBar: new AppBar(title: new Text("Http Example")),
          body: new AppBody()),
    );
  }
}

class AppBody extends StatefulWidget {
  @override
  _AppBodyState createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  Future<Album> futureAlbum;
  Future<List<Post>> futurePosts;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
    futurePosts = fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20.0),
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _getAlbumWidget(snapshot.data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner.
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
        Divider(height: 1.0),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: FutureBuilder<List<Post>>(
              future: futurePosts,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return _getPostsWidget(snapshot.data);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                // By default, show a loading spinner.
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _getAlbumWidget(Album data) {
    return Row(
      children: <Widget>[
        Text(data.userId.toString()),
        SizedBox(
          width: 10.0,
        ),
        Text(data.title)
      ],
    );
  }

  Widget _getPostsWidget(List<Post> posts){
    return ListView.builder(
          itemBuilder: (context, index){
            Post p = posts[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: new Text(
                    p.id.toString() + " - " + p.title,
//                    style: new TextStyle(fontSize: Theme.of(context).textTheme.headline.fontSize),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            );
          },
        itemCount: posts.length,

      );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }
}
