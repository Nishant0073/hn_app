import 'dart:convert' as json;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hn_app/src/serializers.dart';

part 'article.g.dart';

abstract class Article implements Built<Article, ArticleBuilder> {
  static Serializer<Article> get serializer => _$articleSerializer;
  int? get id;
  bool? get deleted;
  String? get type;
  String? get by;
  int? get time;
  String? get text;
  bool? get dead;
  int? get parent;
  int? get poll;
  BuiltList<int> get kids;
  String? get url;
  int? get score;
  String? get title;
  BuiltList<int> get parts;
  int? get descendants;
  Article._();
  factory Article([void Function(ArticleBuilder) updates]) = _$Article;
}

List<int> parseTopStories(String jsonString) {
  final parsed = json.jsonDecode(jsonString);
  final listOfIds = List<int>.from(parsed);
  return listOfIds;
  // return [];
}

Article parseArticle(String jsonString) {
  final parsed = json.jsonDecode(jsonString);
  Article article =
      standardSerializers.deserializeWith(Article.serializer, parsed) ??
          Article();
  return article;
}







// class Article {
//   final String by;
//   final int id;
//   final String title;
//   final int time;
//   final String type;
//   final String text;
//   final String url;

//   Article({
//     required this.by,
//     required this.id,
//     required this.title,
//     required this.time,
//     required this.type,
//     required this.text,
//     required this.url,
//   });
// }

// final articles = [
//   Article(
//       by: "chayesfss",
//       id: 32660028,
//       title: "Age Restrictions on Social Media",
//       time: 1661937415,
//       type: "story",
//       url: "https://replicate.com/andreasjansson/stable-diffusion-animation",
//       text:
//           "As some of my kids grow older and create accounts on different platforms I&#x27;ve tried to make them understand they&#x27;re being directly marketed to. I&#x27;m sure it&#x27;s overwhelming for them to understand without the foundational knowledge.\nMy questions is this, every one of these platforms has age restrictions yet they knowingly have millions of accounts and data related to people they know are under whatever that age is.  \nWhy have we not just told any site collecting data on people they know who to be under said age needs to comply with something like COPPA?  Instead we&#x27;re satisfied that if they&#x27;re alerted they&#x27;ll delete the account.  If not alerted by any outside party they&#x27;ll just file it under the 8-13 year olds and market&#x2F;sell all that data including potential mental health related data??  It makes no sense that we&#x27;re not doing a good job keeping our younger generations data out of the hands of those who have no moral compass.  Where&#x27;s the MADD group related to their kids online data security?"),
//   new Article(
//       by: "starkshumour",
//       id: 32658680,
//       text:
//           "According to you, what would be some of the best resources to dive into economics from a perspective of an entrepreneur who is just starting up?",
//       time: 1661923366,
//       title: "Ask HN: Economics 101 for Entrepreneurs",
//       url: "https://replicate.com/andreasjansson/stable-diffusion-animation",
//       type: "story"),
//   Article(
//       by: "DanielleMolloy",
//       url: "https://replicate.com/andreasjansson/stable-diffusion-animation",
//       //"descendants": 15,
//       id: 32656291,
//       //"kids": [32658596],
//       //score: 28,
//       text:
//           "I am currently working in a night owl friendly environment (in research) and started taking notes about what features offices should have to make the prevalent night owls in science &amp; IT take advantage of their most focused hours. (Before I had been working at a place which locked\ndoors at 9:45pm..)<p>Which office features enhance the focus of us night owls? Any suggestions welcome.<p>- 24 hrs access<p>- blackening window blinds, or cellar location<p>- low grade lighting<p>- monitors with reduced blue light<p>- healthy late night food supply<p>- …",
//       time: 1661900545,
//       title: "Ask HN: How would you build a night owl-friendly office?",
//       type: "story"),
//   Article(
//       by: "eimrine",
//       url: "https://replicate.com/andreasjansson/stable-diffusion-animation",
//       //"descendants": 2,
//       id: 32660318,
//       //"kids": [32660445],
//       //"score": 4,
//       text:
//           "What is the least payment possible for you? What is the least payment where the commission is less than rest of transaction? Please indicate the payment systems of the sender and recipient.",
//       time: 1661940665,
//       title:
//           "Ask HN: What is the least payment you can effectively transact in non-cash fiat?",
//       type: "story"),
//   Article(
//       by: "joyIsNotSoGr8",
//       // descendants: 4,
//       url: "https://replicate.com/andreasjansson/stable-diffusion-animation",
//       id: 32659940,
//       //"kids": [32660399, 32660557, 32660362],
//       //"score": 9,
//       text:
//           "Hi, I&#x27;m developing a product for SaaS founders. It includes embeddable pricing page templates and you can split test them easily and quickly. It also attaches effortlessly to your stripe.<p>If you think it will benefit you and save you time, join the BetaList here: splits.ltd\nFeel free to ask any questions.",
//       time: 1661936495,
//       title: "Pricing page templates for SaaS founders",
//       type: "story"),
//   Article(
//       by: "Pooge",
//       //descendants: 0,
//       id: 32659926,
//       // score": 4,
//       url: "https://replicate.com/andreasjansson/stable-diffusion-animation",
//       text:
//           "I have 2.5 years of experience at well-known companies. I believe my CV is really going to put a high-value on me, but, truth is, I&#x27;ve never been good at technical interviews (<i>normal</i> interviews are the opposite). And this might diminish my chances quite a bit.<p>I&#x27;ve not coded professionally for more than a year because I&#x27;ve been in a language school abroad, but I did read technical books. It&#x27;s not like I forgot everything, but I feel like it might be like taking my first swim in the middle of the ocean; how can I make sure this doesn&#x27;t happen?<p>I plan on reading &quot;Cracking the Coding Interview&quot;; is that a good idea? I&#x27;m all ears for your suggestions.",
//       time: 1661936356,
//       title:
//           "How to get back into programming after not doing it professionally for a year?",
//       type: "story"),
//   Article(
//       by: "nicbou",
//       //"descendants": 17,
//       id: 32656205,
//       //"kids": [32659476],
//       //score": 22,
//       url: "https://replicate.com/andreasjansson/stable-diffusion-animation",
//       text:
//           "Recently, I started posting about my work on social media, and now I regularly get invited by LinkedIn strangers to chat over coffee. I enjoy those chats here and there, but with the commute, they&#x27;re 3-hour, 10-euro blind dates in the middle of the day.<p>Business partners also invite me to private networking events. It&#x27;s meant as a token of gratitude for our collaboration, but they&#x27;re an anxiety-inducing nightmare for me.<p>How can I politely decline such invitations without being rude or making excuses? I am not too busy; I just don&#x27;t want to go.",
//       time: 1661900022,
//       title: "Ask HN: How to politely decline requests to meet?",
//       type: "story"),
//   Article(
//       by: "tetris11",
//       //"descendants": 3,
//       url: "https://replicate.com/andreasjansson/stable-diffusion-animation",
//       id: 32659748,
//       //kids": [32660471, 32659827, 32660295],
//       //score": 2,
//       text:
//           "The Raspberry Pi Zero would have been perfect, but the shortage is ongoing it seems.<p>Are there any other small hardware devices that can run off a USB port? Or easily flashable old smartphones?",
//       time: 1661934545,
//       title:
//           "Ask HN: Suggestions for small USB-powered device that can run PiHole?",
//       type: "story"),
//   Article(
//       by: "danhor",
//       url: "https://replicate.com/andreasjansson/stable-diffusion-animation",
//       //"descendants": 211,
//       id: 32648801,
//       //kids": [32649798, 32651637],
//       //"score": 144,
//       text:
//           "Just went out to german users (translated with deepl):<p>We, the Telegram team, ask you to give us your opinion on how the data of German Telegram users may (or may not) be shared with German authorities, including the German police (BKA).<p>Telegram never shares information about your chats or contacts with third parties, including government agencies.<p>Nevertheless, to prevent misuse of our platform by terrorist groups, our current privacy policy since 2018 allows us to disclose IP addresses and phone numbers of terrorist suspects upon government request backed by a court order.<p>We&#x27;re conducting this poll to find out if our German users support our current privacy policy or if they want to reduce or increase the number of cases where Telegram can potentially share data with authorities. We are providing three options to choose from.<p>OPTION 1: No changes. Telegram may continue to share IP addresses and phone numbers of terror suspects only based on a court decision. This option is already included in Telegram&#x27;s current privacy policy.<p>OPTION 2: Upon request by German police authorities, Telegram may disclose IP addresses and phone numbers of suspects of serious crimes, even if not supported by a court decision. This option, if approved, would be completely new for Telegram and therefore requires a change to our privacy policy for users from Germany.<p>OPTION 3: Under no circumstances may Telegram share user information, including IP addresses and phone numbers of terror suspects. If this option is supported, Telegram will change its data structure and privacy policy for users from Germany.<p>Only users registered with German phone numbers can participate in the survey below. We have informed all Telegram users in Germany about this survey. The poll will remain open until September 5, 12:00 pm German time (UTC+2).<p>(Together with an attached poll)<p>Original: https:&#x2F;&#x2F;imgur.com&#x2F;a&#x2F;oHdxchb",
//       time: 1661856693,
//       title:
//           "Telegram is asking German users when to share information with law enforcement",
//       type: "story"),
//   Article(
//       by: "cordialthank",
//       //"descendants": 99,
//       id: 32648013,
//       url: "https://replicate.com/andreasjansson/stable-diffusion-animation",
//       //kids": [
//       //32650414,
//       //32648246,
//       //],
//       //"score": 84,
//       text:
//           "So I was hired in this startup a year ago. Its aim is to make a SaaS. It&#x27;s been painfully obvious that nothing gets done about this, the only projects we work on are bizarre random demos or small open source projects on github for &quot;marketing&quot;.<p>The company has not had a series A funding yet, and was almost bankrupting some months ago until a VC gave them &quot;some&quot; millions. Meanwhile, there&#x27;s still no product, and the company pays for worldwide company trips for no purpose (no conferences or anything), pays for life coaches and frequent global flights for the CEO and who knows what else.<p>When I say &quot;no product&quot; I literally mean it. It only exists on a powerpoint slide without a single line of code implemented.<p>The worst part is this startup is 5-7 years old, and has gone through the bankrupt -&gt; saved last minute by investor cycle more than one time.<p>Average employee stay is 6-14 months. During my employment three managers left the company, and four engineers. There&#x27;s no documentation about anything because people come and go after they see there&#x27;s no future in this company.<p>Should I anonymously inform investors that my startup employer is a scam, and if yes, how should I approach it?",
//       time: 1661848436,
//       title:
//           "Ask HN: Should I inform investors that my startup employer is a scam?",
//       type: "story"),
//   Article(
//       by: "MathCodeLove",
//       url: "https://replicate.com/andreasjansson/stable-diffusion-animation",
//       //"descendants": 10,
//       id: 32652540,
//       //kids": [32653942, 32653470, 32655942, 32658459],
//       //"score": 32,
//       text:
//           "See: https:&#x2F;&#x2F;news.ycombinator.com&#x2F;item?id=23438930<p>Feel free to update us on your progress if you participated in that thread.",
//       time: 1661878483,
//       title:
//           "Ask HN: Side projects that are making money, but you'd not talk about them?",
//       type: "story"),
//   Article(
//       by: "pknomad",
//       url: "https://replicate.com/andreasjansson/stable-diffusion-animation",
//       //descendants": 4,
//       id: 32657997,
//       //kids: [32660737, 32658155, 32658574, 32658084],
//       //"score: 4,
//       text:
//           "Hey HN,<p>How do you find meaning at work&#x2F;life at 31? I&#x27;m finally working as an SRE at a company that pays ok but has very good work-life balance and has pretty good career opportunities. I very much wanted to work in infrastructure after toiling away at post-grad life sciences and then help-desky roles for 6 years. I feel like I should be more excited about the type of work I&#x27;m currently doing but I just don&#x27;t feel excited. When I got the news about the job offer, I felt more sadness than happiness (which was completely unexpected).<p>I feel like I invested way too much time and effort into career and nothing in improving my personal life. I&#x27;m spending more effort these days to travel, re-building relationships (which is hard when all of your friends are married &amp; having kids), and finding new hobbies, but everything just feels dead. I&#x27;m seeing a therapist and it helps but these feels come and go. I just want to feel excited about life again.",
//       time: 1661916067,
//       title: "Find Meaning at Work",
//       type: "story"),
//   Article(
//       by: "chayesfss",
//       id: 32660028,
//       title: "Age Restrictions on Social Media",
//       time: 1661937415,
//       url: "https://replicate.com/andreasjansson/stable-diffusion-animation",
//       type: "story",
//       text:
//           "As some of my kids grow older and create accounts on different platforms I&#x27;ve tried to make them understand they&#x27;re being directly marketed to. I&#x27;m sure it&#x27;s overwhelming for them to understand without the foundational knowledge.\nMy questions is this, every one of these platforms has age restrictions yet they knowingly have millions of accounts and data related to people they know are under whatever that age is.  \nWhy have we not just told any site collecting data on people they know who to be under said age needs to comply with something like COPPA?  Instead we&#x27;re satisfied that if they&#x27;re alerted they&#x27;ll delete the account.  If not alerted by any outside party they&#x27;ll just file it under the 8-13 year olds and market&#x2F;sell all that data including potential mental health related data??  It makes no sense that we&#x27;re not doing a good job keeping our younger generations data out of the hands of those who have no moral compass.  Where&#x27;s the MADD group related to their kids online data security?"),
//   Article(
//       by: "starkshumour",
//       id: 32658680,
//       url: "https://replicate.com/andreasjansson/stable-diffusion-animation",
//       text:
//           "According to you, what would be some of the best resources to dive into economics from a perspective of an entrepreneur who is just starting up?",
//       time: 1661923366,
//       title: "Ask HN: Economics 101 for Entrepreneurs",
//       type: "story"),
//   Article(
//       by: "DanielleMolloy",
//       url: "https://replicate.com/andreasjansson/stable-diffusion-animation",
//       //"descendants": 15,
//       id: 32656291,
//       //"kids": [32658596],
//       //score: 28,
//       text:
//           "I am currently working in a night owl friendly environment (in research) and started taking notes about what features offices should have to make the prevalent night owls in science &amp; IT take advantage of their most focused hours. (Before I had been working at a place which locked\ndoors at 9:45pm..)<p>Which office features enhance the focus of us night owls? Any suggestions welcome.<p>- 24 hrs access<p>- blackening window blinds, or cellar location<p>- low grade lighting<p>- monitors with reduced blue light<p>- healthy late night food supply<p>- …",
//       time: 1661900545,
//       title: "Ask HN: How would you build a night owl-friendly office?",
//       type: "story"),
//   Article(
//       by: "eimrine",
//       url: "https://replicate.com/andreasjansson/stable-diffusion-animation",
//       //"descendants": 2,
//       id: 32660318,
//       //"kids": [32660445],
//       //"score": 4,
//       text:
//           "What is the least payment possible for you? What is the least payment where the commission is less than rest of transaction? Please indicate the payment systems of the sender and recipient.",
//       time: 1661940665,
//       title:
//           "Ask HN: What is the least payment you can effectively transact in non-cash fiat?",
//       type: "story"),
//   Article(
//       by: "joyIsNotSoGr8",
//       url: "https://replicate.com/andreasjansson/stable-diffusion-animation",
//       // descendants: 4,
//       id: 32659940,
//       //"kids": [32660399, 32660557, 32660362],
//       //"score": 9,
//       text:
//           "Hi, I&#x27;m developing a product for SaaS founders. It includes embeddable pricing page templates and you can split test them easily and quickly. It also attaches effortlessly to your stripe.<p>If you think it will benefit you and save you time, join the BetaList here: splits.ltd\nFeel free to ask any questions.",
//       time: 1661936495,
//       title: "Pricing page templates for SaaS founders",
//       type: "story"),
// ];
