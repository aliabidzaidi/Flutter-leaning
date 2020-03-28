import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        buttonColor: Colors.lightGreen,
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.primary
        )
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Kittens'),
      ),
      body: ListView.builder(
        itemCount: _kittens.length,
        itemExtent: 60.0,
        itemBuilder: _listItemBuilder,
      ),
    );
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    return new GestureDetector(
        onTap: () => showDialog(
          context: context,
          builder: (context) => _dialogBuilder(context, _kittens[index]),
        ),
        child: Container(
          padding: EdgeInsets.only(left: 16.0, top: 20.0),
          child: Text(
          _kittens[index].Name,
          style: Theme.of(context).textTheme.headline
        )
      )
    );
  }

  Widget _dialogBuilder(BuildContext context, Kitten kitten) {
    ThemeData localTheme = Theme.of(context);
    return SimpleDialog(
      contentPadding: EdgeInsets.zero,
      children: <Widget>[
        Image.asset(
            kitten.ImageUrl,
            fit: BoxFit.fill
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                kitten.Name,
                style: localTheme.textTheme.display1,
              ),
              SizedBox(height:8.0),
              Text('${kitten.Age} months old',
                style: localTheme.textTheme.subhead.copyWith(
                  fontStyle: FontStyle.italic
                ),
              ),
              SizedBox(height:20.0),
              Text(kitten.Description,
                style: localTheme.textTheme.body1,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Wrap(
                  children: <Widget>[
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Ignore')
                    ),
                    SizedBox(width: 16.0),
                    RaisedButton(
                        onPressed: () {},
                        child: const Text('Adopt')
                    )
                  ],
                )
              ),

            ],
          ),
        )
      ],
    );
  }
}

class Kitten{
  final String Name;
  final String Description;
  final int Age;
  final String ImageUrl;

  Kitten({this.Name, this.Description, this.Age, this.ImageUrl});
}


final List<Kitten> _kittens = <Kitten>[
  Kitten(
    Name: 'Fluffy Weezel',
    Description: '4 months old, nails growing good, fat furr, also purrs, well trained, sleeps alot',
    Age: 2,
    ImageUrl: 'assets/cats/cat1.jpeg'
  ),
  Kitten(
      Name: 'Skinny Hamlet',
      Description: '4 months old, nails growing good, fat furr, also purrs, well trained, sleeps alot',
      Age: 8,
      ImageUrl: 'assets/cats/cat2.jpeg'
  ),
  Kitten(
      Name: 'Rocky Pret',
      Description: '4 months old, nails growing good, fat furr, also purrs, well trained, sleeps alot',
      Age: 6,
      ImageUrl: 'assets/cats/cat3.jpeg'
  ),
  Kitten(
      Name: 'Nincy Zert',
      Description: '4 months old, nails growing good, fat furr, also purrs, well trained, sleeps alot',
      Age: 12,
      ImageUrl: 'assets/cats/cat4.jpeg'
  )
];
