import 'package:flutter/material.dart';
import 'package:yemek_tarifi_odev_mobil/Components/CommentListItem.dart';
import 'package:yemek_tarifi_odev_mobil/models/CommentModel.dart';
import 'package:yemek_tarifi_odev_mobil/services/CommentService.dart';

class CommentList extends StatefulWidget {

  int foodId;

  CommentList({@required this.foodId});

  @override
  _CommentListState createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {

  List<CommentModel> _comments;
  bool _loading;

  void getComments() {
    _loading = true;
    CommentService.getCommentsByFoodID(widget.foodId).then((value) {
      setState(() {
        _comments = value;
        _loading = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getComments();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
          key: UniqueKey(),
          itemCount: null == _comments ? 0 : _comments.length,
          itemBuilder: (context, index) {
            return InkWell(
                child: Column(
                  children: [
                    SizedBox(height: 15,),
                    CommentListItem(
                      commentModel: _comments[index],
                    ),
                    SizedBox(height: 15,)
                  ],
                )
            );
          }),
    );
  }
}
