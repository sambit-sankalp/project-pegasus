import 'package:auto_route/auto_route.dart';
import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mondaymorning/src/providers/mockdata/mock_data.dart';
import 'package:mondaymorning/src/services/graphql/queries/homepage/getLatestIssues.dart';
import 'package:mondaymorning/src/widgets/articleCarousel.dart';
import 'package:mondaymorning/src/widgets/article_tile.dart';
import 'package:mondaymorning/src/widgets/custom_icon_button.dart';
import 'package:mondaymorning/src/services/navigation/router.gr.dart';

/// ArticlesPage : Overview of articles containing carousel cards Article Overview Tiles and 2 Menu Buttons
// class ArticlesPage extends StatelessWidget {
//   /// Constructor for [ArticlesPage]
//   ArticlesPage({Key? key}) : super(key: key);
//
//   /// Instance of [Post]
//   final articles = Post.posts;
//
//   @override
//   Widget build(BuildContext context) {
//     return Query(options: QueryOptions(
//       document: gql(getLastestIssueQuery.getLastestIssue),
//       variables: {
//         'onlyPublished' : true,
//         'limit' : 2,
//       },
//     ),
//         builder: (QueryResult? result, { VoidCallback? refetch, FetchMore? fetchMore }) {
//
//           if (result!.hasException) {
//             return Text(result.exception.toString());
//           }
//
//           if (result.isLoading) {
//             return Text('Loading');
//           }
//
//           // it can be either Map or List
//           print(result);
//
//           return Center(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 10,
//               ),
//               child: ScrollConfiguration(
//                 behavior: MyBehavior(),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       ArticleCarousel(),
//
//                       SizedBox(height: 13),
//
//                       for (int i = 1; i < articles.length; i++)
//                         ArticleTile(
//                           articleTitle: articles[i].title,
//                           articleDescription: articles[i].description,
//                           time: articles[i].time,
//                           author: articles[i].author,
//                           onTileTap: () {
//                             context.router.push(
//                               FullRouteArticle(postId: articles[i].id),
//                             );
//                           },
//                         ),
//                       SizedBox(height: 2),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Container(
//                               margin: EdgeInsets.only(left: 6, right: 5),
//                               child: CustomIconButton(
//                                 icon: Icons.calendar_today_outlined,
//                                 text: 'Upcoming Events',
//                                 onButtonTap: () {
//                                   context.router.push(
//                                     ComingSoonRoute(),
//                                   );
//                                 },
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             child: Container(
//                               margin: EdgeInsets.only(right: 6, left: 5),
//                               child: CustomIconButton(
//                                 icon: Icons.pie_chart_outline,
//                                 text: 'Ongoing Poll',
//                                 onButtonTap: () {
//                                   context.router.push(
//                                     ComingSoonRoute(),
//                                   );
//                                 },
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 10),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//     );
//   }
// }

class ArticlesPage extends StatelessWidget {
  /// Constructor for [ArticlesPage]
  ArticlesPage({Key? key}) : super(key: key);

  /// Instance of [Post]
  final articles = Post.posts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon(
              AssetImage("assets/images/mmlogo.png"),
              color: Theme.of(context).appBarTheme.foregroundColor,
              size: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 170,
              child: AutoSizeText(
                'Monday Morning',
                style: GoogleFonts.ibmPlexSans(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.156,
            ),
          ],
        ),
        centerTitle: true,
        leading: const AutoBackButton(),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ArticleCarousel(),

                  SizedBox(height: 13),

                  for (int i = 1; i < articles.length; i++)
                    ArticleTile(
                      articleTitle: articles[i].title,
                      articleDescription: articles[i].description,
                      time: articles[i].time,
                      author: articles[i].author,
                      onTileTap: () {
                        context.router.push(
                          FullRouteArticle(postId: articles[i].id),
                        );
                      },
                    ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 6, right: 5),
                          child: CustomIconButton(
                            icon: Icons.calendar_today_outlined,
                            text: 'Upcoming Events',
                            onButtonTap: () {
                              context.router.push(
                                ComingSoonRoute(),
                              );
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 6, left: 5),
                          child: CustomIconButton(
                            icon: Icons.pie_chart_outline,
                            text: 'Ongoing Poll',
                            onButtonTap: () {
                              context.router.push(
                                ComingSoonRoute(),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
