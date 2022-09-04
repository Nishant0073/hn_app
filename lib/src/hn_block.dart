import 'package:hn_app/src/article.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

class HackerNewsBloc {
  Stream<List<Article>> get articles => _articlesSubject.stream;
  final _articlesSubject = BehaviorSubject<List<Article>>();

  var _articles = [];

  HackerNewsBloc() {
    _updateArticles().then((_) {
      _articlesSubject.add(List.from(_articles));
    });
  }

  Future<Null> _updateArticles() async {
    final futureArticles = _ids.map((id) => _getArticle(id));
    final articles = await Future.wait(futureArticles);
    _articles = articles;
    return null;
  }

  List<int> _ids = [
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
}
