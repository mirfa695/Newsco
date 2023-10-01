
import 'package:flutter/material.dart';
import 'package:newsco/custom_widgets/Custom_Box.dart';
import 'package:newsco/provider/api_provider.dart';
import 'package:newsco/services/api_service.dart';
import 'package:provider/provider.dart';
class AllTabPage extends StatelessWidget {
  const AllTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: FutureBuilder(future: context.read<ApiProvider>().getApi(context),
          builder: (context,snapshot){
        if(snapshot.hasData){
          {
            return SizedBox(height: 720,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,),
                itemBuilder: (BuildContext context,int index){
                  return SizedBox(height: 120,
                    child: InkWell(onTap: (){},
                      child: CustomBox(text1: snapshot.data["articles"][index]["author"],image: snapshot.data["articles"][index]["urlToImage"],
                        text: snapshot.data["articles"][index]["title"],text2: snapshot.data["articles"][index]["publishedAt"],),
                    ),
                  );
                }, itemCount: snapshot.data["articles"].length,),
            );
            // return CustomContainer(text: snapshot.data["articles"][2]["title"],image: snapshot.data["articles"][2]["urlToImage"],);
          }
        }else{return Text('error');}
      }
      ),
    );
  }
}
