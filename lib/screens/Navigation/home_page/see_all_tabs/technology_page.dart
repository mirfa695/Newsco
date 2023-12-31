import 'package:flutter/material.dart';
import 'package:newsco/custom_widgets/Custom_Box.dart';
import 'package:newsco/model_class/class_article.dart';
import 'package:newsco/provider/api_provider.dart';
import 'package:newsco/routing/route_name.dart';
import 'package:provider/provider.dart';

class TechnologyPage extends StatelessWidget {
  const TechnologyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: context.read<ApiProvider>().fetchApi(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return InkWell(onTap: (){
                  Navigator.pushNamed(context, RouteName.newsDetails,arguments: 'hello');
                },
                  child: CustomBox(image: snapshot.data![index].urlToImage,
                    text: snapshot.data![index].title,
                    text1: snapshot.data![index].author,
                    text2: snapshot.data![index].publishedAt,
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: snapshot.data!.length,
            );
          }
          return Text('Error');
        },
      ),
    );
  }
}
