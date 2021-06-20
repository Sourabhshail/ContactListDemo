import 'package:flutter/material.dart';

class ContactDetails extends StatefulWidget {
  final String name;//if you have multiple values add here
  ContactDetails(this.name, {Key key}): super(key: key);

  @override
  _ContactDetailsState createState() {
    return _ContactDetailsState();
  }
}

class _ContactDetailsState extends State<ContactDetails> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact detail')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Center(child: Text(widget.name))
          ),

        ],
      ),
    );
  }


}