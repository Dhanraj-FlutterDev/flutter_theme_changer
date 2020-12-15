import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
        saveThemesOnChange: true,
        loadThemeOnInit: false,
        themes: <AppTheme>[
          AppTheme.light(id: 'light'),
          AppTheme.dark(id: 'dark'),
          AppTheme(
              id: 'custom_theme_made_by_you',
              description: 'made with colors',
              data: ThemeData(
                buttonColor: Colors.yellow,
                scaffoldBackgroundColor: Colors.orange,
                dialogBackgroundColor: Colors.lightBlueAccent.shade100,
                accentColor: Colors.greenAccent,
                backgroundColor: Colors.amber.shade200
              ),
          )
        ],
        child: ThemeConsumer(
          child: Builder(
              builder: (context) => MaterialApp(
                home: DemoApp(),
                theme: ThemeProvider.themeOf(context).data,
              )
          ),
        )
    );
  }
}

class DemoApp extends StatefulWidget {
  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {

  @override
  Widget build(BuildContext context) {
    var controller = ThemeProvider.controllerOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Example'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 200,
              color: Colors.blue.shade100,
              child: Center(
                child: Text('Themes Demo App',style: TextStyle(fontSize: 20.0),),
              ),
            ),
            Padding(padding: EdgeInsets.all(20.0),
            child: RaisedButton(
                child: Text('Theme Dialog'),
                onPressed: (){
                  showDialog(context: context,builder: (_)=> ThemeDialog());
                }
            ),
            ),
            Text('Current Theme ${controller.theme.id}',style: TextStyle(fontSize: 10.0),),
          ],
        ),
      ),
    );
  }
}














