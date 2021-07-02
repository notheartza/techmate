import 'package:flutter/material.dart';

class CommentNews extends StatefulWidget {


  @override
  _CommentNewsState createState() => _CommentNewsState();
}

class _CommentNewsState extends State<CommentNews> {
  List<String> _comments = [];
  final TextEditingController _controller = TextEditingController();
  var img = 'http://178.128.56.0/Image/Profile.png';
  var placeholder = 'Img/ImgUser.png';

  void _addComment(String val) {
    setState(() {
      _comments.add(val);
    });
  }

  Widget _buildCommentList() {
    // ignore: missing_return
    return ListView.builder(
      // ignore: missing_return
      itemBuilder: (context, index) {
        if (index < _comments.length) {
          return _buildCommentItem(_comments[index]);
        }
      },
    );
  }

  Widget _buildCommentItem(String Comment) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: FadeInImage.assetNetwork(
          placeholder: placeholder,
          image: img,
          height: 40,
          width: 40,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(Comment),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: _buildCommentList(),
          ),
          Container(
            height: 1,
            color: Colors.grey,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: TextField(
                  controller: _controller,
                  onSubmitted: (String Comment) {
                    if (Comment!="") {
                      _controller.clear();
                      _addComment(Comment);
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(20),
                    hintText: 'Comment Here'
                  ),
                ),
              ),
              IconButton(
                iconSize: 25,
                onPressed: (){
                  if(_controller.text.toString()!=""){
                  _addComment(_controller.text.toString());
                  _controller.clear();}
                },
                icon: Icon(Icons.send),
                color: Colors.blueAccent,
              )
            ],
          )
        ],
      ),
    );
  }
}
