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

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final TextEditingController _textController = new TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];
  bool _isComposing = false;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Wacko Messenger'),
      ),
      body: new Column(
        children: <Widget>[
          new Flexible(
            child: ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          new Divider(height: 1.0),
          new Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          )
        ],
      ),
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
                    onChanged: (String text){
                      setState(() {
                        if(text.length > 0)
                          _isComposing = true;
                      });
                    },
                    onSubmitted: _handleSubmitted,
                    decoration: new InputDecoration.collapsed(
                        hintText: "Send a message"),
                  ),
                ),
                new Container(
                  margin: const EdgeInsets.only(left: 4.0),
                  child: new IconButton(
                    icon: new Icon(Icons.send),
                    onPressed: _isComposing ? () => _handleSubmitted(_textController.text): null,
                  ),
                )
              ],
            )));
  }

  void _handleSubmitted(String text) {
    if (text.isEmpty) {
      return;
    }
    _textController.clear();
    setState((){
      _isComposing = false;
    });
    ChatMessage message = new ChatMessage(
      text: text,
      animationController: new AnimationController(
        duration: new Duration(milliseconds: 300),
        vsync: this,
      ),
    );

    setState(() {
      _messages.insert(0, message);
    });

    message.animationController.forward();
  }

  @override
  void dispose() {
    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.animationController});
  final String text;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
      sizeFactor:
          CurvedAnimation(parent: animationController, curve: Curves.easeIn),
      axisAlignment: 0.0,
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Circle Avatar
            new Container(
                margin: const EdgeInsets.only(right: 4.0),
                child: new CircleAvatar(child: new Text(_name[0]))),
            //Name + Message Column
            new Expanded(

              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //Name Text
                  new Text(
                    _name,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                  //Message Text
                  new Container(
                      margin: const EdgeInsets.only(top: 4.0),
                      child: new Text(
                        text
                      ))
                ],
              ),
            )
          ],
        )
      )
    );
  }
}
