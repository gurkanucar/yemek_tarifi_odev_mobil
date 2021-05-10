import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/models/CommentModel.dart';
import 'package:yemek_tarifi_odev_mobil/pages/ProfilePage.dart';
import 'package:yemek_tarifi_odev_mobil/services/CommentService.dart';

import '../Constans.dart';

class CommentListItem extends StatefulWidget {

  CommentModel commentModel;

  CommentListItem({@required this.commentModel});

  @override
  _CommentListItemState createState() => _CommentListItemState();
}

class _CommentListItemState extends State<CommentListItem> {

  CommentModel data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*CommentService.getCommentsByFoodID(1).then((value){
     setState(() {
       data=value.first;
     });
    });
*/

    setState(() {
      data=widget.commentModel;
    });


  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Material(
          borderRadius: BorderRadius.circular(20),
          elevation: 10,
          child: Container(
            width: MediaQuery.of(context).size.width*0.9,
            child: Column(
              children: [
                Material(
                  borderRadius: BorderRadius.circular(40),
                  child: InkWell(
                      onTap: () {
                        print("kullaniciya tıklandi");
                         Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage(
                                  userID: data.userId)));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10,left: 10,top: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 60,
                                child: Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(200),
                                    child: FadeInImage.assetNetwork(
                                      fit: BoxFit.cover,
                                      placeholder: 'assets/loading.gif',
                                      image:
                                      data?.userPhotoUrl !=
                                          null
                                          ? Constants.BASE_URL +
                                          data?.userPhotoUrl
                                          : 'assets/loading.gif',
                                    ),
                                  ),
                                ),
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              child: Text(
                                data?.username != null
                                    ? "   " + data?.username
                                    : "UserName",
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.bold),
                              ),
                              flex: 5,
                            )
                          ],
                        ),
                      )),
                ),

                Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(left: 10, top: 10,bottom: 20),
                      child: Text(
                        data?.comment != null
                            ? data?.comment
                            : "yorum...",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff4C4C4C),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )),

              ],
            ),
          ),
        )
    );
  }
}
