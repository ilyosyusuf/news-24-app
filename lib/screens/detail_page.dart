import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsprogroup/models/news_model.dart';
import 'package:newsprogroup/screens/main_page.dart';
import 'package:newsprogroup/screens/news_page.dart';

class DetailPage extends StatelessWidget {
  Article? news;
  DetailPage({Key? key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
            alignment: Alignment.center,
            child: ListTile(
              leading: IconButton(icon: Icon(Icons.chevron_left_outlined, size: 30, color: Colors.black,),
                onPressed: (){
                  Navigator.pop
                  (context, MaterialPageRoute(builder: ((context) => MainPage())));
                },
              ),
              trailing: SizedBox(
                width: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset('assets/icons/Vector.svg'),
                    SvgPicture.asset('assets/icons/share.svg'),
                  ],
                ),
              ),
            ),
            ),
            Expanded(
              flex: 9,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 250,          
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/gifs/loading.gif',
                            image: news!.urlToImage.toString(),
                            fit: BoxFit.cover,
                          )
                    ),
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(news!.title.toString(), style: TextStyle(fontSize: 20),),
                    ),
                    ListTile(
                      leading: const CircleAvatar(
                        radius: 25.0,
                        backgroundImage: CachedNetworkImageProvider('https://source.unsplash.com/random')
                      ),
                      title: Text("By ${news!.author.toString()}", style: TextStyle(color: Colors.grey),),
                      trailing: IconButton(icon: Icon(Icons.more_horiz),onPressed: (){},),
                    ),
                    Container(
                      padding: EdgeInsets.all(15.0),
                      child: Text(news!.description.toString(), style: const TextStyle(fontSize: 25.0),)
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}