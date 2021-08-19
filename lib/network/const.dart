
// POST
// UPDATE
// DELETE

// GET

// base url : https://newsapi.org/
// method (url) : v2/top-headlines?
// queries : country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca

// https://newsapi.org/v2/everything?q=tesla&apiKey=65f7f556ec76449fa7dc7c0069f040ca
// vase url:  https://newsapi.org/
//  method (url):   v2/everything?
//   puary : q=tesla&apiKey=65f7f556ec76449fa7dc7c0069f040ca



import 'package:newsapp/cubit/newscupit.dart';
import 'package:newsapp/screen/webView/wevview.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

Widget bulidarticalitem(artical,context,index){
  return Container(
    color: NewsCupit.get(context).selsecteditem==index &&NewsCupit.get(context).isDesktop  ?Colors.grey[200]:null,
    child: InkWell(
      onTap: (){
        NewsCupit.get(context).businesSelected(index);
       // Navigator.of(context).push(MaterialPageRoute(builder: (e)=>WevView(artical['url'])));
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/loding.gif',
                image: '${artical['urlToImage']}',
                fit: BoxFit.cover,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // image:
                  // DecorationImage(
                  //   image:
                  //   NetworkImage('${artical['urlToImage']}'),
                  //   fit: BoxFit.cover,
                  //
                  // )
              ),

            ),
            SizedBox(width: 20,),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${artical['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text( '${artical['publishedAt']}',style: TextStyle(color:Colors.grey,),),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget mydivider(){
  return Container(
    width: double.infinity,
    height: 1,
    color: Colors.grey[300],
  );
}

Widget articalBulider(list,context,{isserch=false}) =>list.length> 0 ? ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder: (context,index)=> bulidarticalitem(list[index],context,index),
    separatorBuilder:(context,index)=>mydivider(),
    itemCount: list.length)
    :isserch ? Container():Center(child: CircularProgressIndicator());

void navigatTo(Widget,context){
  Navigator.of(context).push(
    MaterialPageRoute(builder: Widget)
  );
}