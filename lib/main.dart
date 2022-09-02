import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import 'src/article.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> _articles = [
    32687784,
    32682990,
    32671234,
    32683834,
    32685214,
    32684017,
    32666171,
    32687053,
    32673100,
    32683473,
  ];

  Future<Article?> _getArticle(int id) async {
    final storyUrl =
        Uri.https('hacker-news.firebaseio.com', '/v0/item/$id.json');
    final storyRes = await http.get(storyUrl);
    if (storyRes.statusCode == 200) {
      return parseArticle(storyRes.body);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: _articles
            .map(
              (i) => FutureBuilder(
                  future: _getArticle(i),
                  builder: (context, AsyncSnapshot<Article?> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return _buildItem(snapshot.data);
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.orange,
                        ),
                      );
                    }
                  }),
            )
            .toList(),
      ),
    );
  }

  Widget _buildItem(Article? article) {
    return Padding(
      key: Key(article!.id.toString()),
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        title: Text(
          article.title!,
          style: TextStyle(fontSize: 20.0),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Author: ${article.by}"),
                IconButton(
                  onPressed: () => _launchUri(article.url!),
                  icon: Icon(Icons.launch),
                ),
              ],
            ),
          )
        ],
        // onTap: () => _launchUri(article.url),
      ),
    );
  }

  Future<void> _launchUri(String _uri) async {
    if (!await launchUrl(Uri.parse(_uri))) {
      throw 'Could not launch ${_uri}';
    }
  }
}
