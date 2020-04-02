import 'package:flutter/material.dart';

const String _name = "Abid Zaidi";

void main() {
  runApp(new WackoChatApp());
}

class WackoChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Wacko Messenger",
      home: new ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = new TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Wacko Messenger'),
      ),
      body: _buildTextComposer(),
    );
  }

  Widget _buildTextComposer() {
    return new IconTheme(
        data: new IconThemeData(color: Theme.of(context).accentColor),
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: <Widget>[
                new Flexible(
                  child: new TextField(
                    controller: _textController,
                    onSubmitted: _handleSubmitted,
                    decoration: new InputDecoration.collapsed(
                        hintText: "Send a message"),
                  ),
                ),
                new Container(
                  margin: const EdgeInsets.only(left: 4.0),
                  child: new IconButton(
                    icon: new Icon(Icons.send),
                    onPressed: () => _handleSubmitted(_textController.text),
                  ),
                )
              ],
            )));
  }

  void _handleSubmitted(String text) {
    print(text);
    _textController.clear();
    ChatMessage message = new ChatMessage(text: text);

    setState(() {
      _messages.insert(0, message);
    });

  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Circle Avatar
            new Container(
                margin: const EdgeInsets.only(right: 4.0),
                child: new CircleAvatar(child: new Text(_name[0]))
            ),
            //Name + Message Column
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //Name Text
                new Text(_name, style: Theme.of(context).textTheme.subhead,),
                //Message Text
                new Container(
                  margin: const EdgeInsets.only(top: 4.0),
                  child: new Text(text)
                )
              ],
            )
          ],
        ));
  }
}
