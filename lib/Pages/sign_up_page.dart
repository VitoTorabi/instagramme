import 'package:flutter/material.dart';

import 'package:instagram_1/Pages/login_page.dart';

class SignUpPage extends StatefulWidget {
	static String tag = 'signup-page';

	@override
	State createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
	@override
	Widget build(BuildContext context) {
//
//		final avatar2 =  CircleAvatar(
//			backgroundColor: Colors.transparent,
//			child: Image.asset('images/alucard.jpg'),
//			radius: 48.0,
//		)
		final avatar = RawMaterialButton(
			onPressed: (){},
			shape: new CircleBorder(),
			child: CircleAvatar(
				backgroundColor: Colors.transparent,
				child: Image.asset('images/alucard.jpg'),
				radius: 48.0,
			),
		);

		final username = TextFormField(
			//keyboardType: TextInputType.emailAddress,
			autofocus: false,
			initialValue: 'Vito',
			decoration: InputDecoration(
				hintText: 'username',
				contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
				border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
			),
		);

		final password = TextFormField(
			autofocus: false,
			initialValue: '1234',
			obscureText: true,
			decoration: InputDecoration(
				hintText: 'Password',
				contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
				border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
			),
		);

		final biography = TextFormField(
			autofocus: false,
			decoration: InputDecoration(
				hintText: 'biography',
				contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
				border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
			),
		);

		final register = Padding(
			padding: EdgeInsets.symmetric(vertical: 14.0),
			child: RaisedButton(
				shape: RoundedRectangleBorder(
					borderRadius: BorderRadius.circular(24),
				),
				onPressed: () {
					Navigator.of(context).pushNamed(LoginPage.tag);
				},
				padding: EdgeInsets.all(12),
				color: Colors.lightBlueAccent,

				child: Text('Register', style: TextStyle(color: Colors.blue[50])),
			),
		);


		return Scaffold(
			backgroundColor: Colors.blue[50],
			body: Center(
				child: ListView(
					shrinkWrap: true,
					padding: EdgeInsets.only(left: 24.0, right: 24.0),
					children: <Widget>[
						avatar,
						SizedBox(height: 40.0),
						username,
						SizedBox(height: 8.0),
						password,
						SizedBox(height: 8.0),
						biography,
						SizedBox(height: 18.0),
						register
					],
				),
			),
		);
	}


}