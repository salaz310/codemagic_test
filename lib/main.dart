import 'package:flutter/material.dart';

void main() => runApp(

  new FriendlyChatApp()
  /*
    ESTO LO VAMOS A SEPARAR EN 2 WIDGETS 
  new MaterialApp(
    title: "FriendlyChat",
    home: new Scaffold(
      appBar: new AppBar(
        title: new Text("Friendlychat"),
      ),
    ),
  )*/
);

class FriendlyChatApp extends StatelessWidget{

  @override 
  Widget build(BuildContext context){
    return new MaterialApp(
      title: "Friendlychat",
      home: new ChatScreen(),
    );
  }
}


class ChatScreen extends StatefulWidget{
  @override
  State createState()=> new ChatScreenState();
}


class ChatScreenState extends State<ChatScreen>{

  final TextEditingController _textController= new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Chat para los amigos")),
      body: _buildTextComposer(),
    );
  }

Widget _buildTextComposer(){

  return new IconTheme(
    data: new IconThemeData(color: Theme.of(context).accentColor),
    child: new Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new Row(
        children: <Widget>[
          ///SE PUSO DENTRO DE UN FLEXIBLE PARA QUE AUTOMATICAMENTE USARA 
          ///EL ESPACIO QUE EL BOTON DE ENVIAR DEJA LIBRE
          new Flexible(
            child: new TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: new InputDecoration.collapsed(
                hintText: "¡Escribe tu mensaje!"
        ),
      ),
      
          ),
         new Container(
           margin: new EdgeInsets.symmetric(horizontal: 4.0),           //new
           child: new IconButton(                                       //new
            icon: new Icon(Icons.send),                                //new
            onPressed: () => _handleSubmitted(_textController.text)
         ),
         ),
        ],
      ),
      
    )
    );
  }

  void _handleSubmitted(String text){
      _textController.clear();
  }

}

