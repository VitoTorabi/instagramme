import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MakePost extends StatefulWidget {
  @override
  _MakePostState createState() => _MakePostState();
}

class _MakePostState extends State<MakePost> {
  String _imagePath;
  File _image;

  var captionText = TextEditingController();

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _imagePath = image.path;
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    final setPhoto = Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: getImage,

        padding: EdgeInsets.only(bottom: 12, top: 12, left: 21, right: 21),
        color: Colors.lightBlueAccent,
        child: Text('Add Photo'),
        textColor: Colors.blue[50], //Icon(Icons.add, color: Colors.blue[50],),
      ),
    );

    var caption = TextFormField(
      //keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: captionText,
      maxLength: 120,
      //initialValue: '',
      decoration: InputDecoration(
        hintText: 'Caption',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final post = Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {},
        padding: EdgeInsets.only(bottom: 12, top: 12, left: 40, right: 40),
        color: Colors.lightBlueAccent,
        child: Text('Post', style: TextStyle(color: Colors.blue[50])),
      ),
    );

    final buttonBox = Flex(
      mainAxisAlignment: MainAxisAlignment.center,
      direction: Axis.horizontal,
      children: <Widget>[
        //SizedBox(width: 40.0),
        post,
        setPhoto
      ],
    );

    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _image == null
              ? Text('No image selected.')
              : Image.asset(_imagePath,
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height / 2.5),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.only(left: 13.0, right: 13.0),
            child: caption,
          ),
          buttonBox
        ],
      )),
    );
  }
}
