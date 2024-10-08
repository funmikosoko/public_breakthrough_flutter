import 'package:flutter/material.dart';
import 'package:my_flutter_app/calendar_booking/calendly.dart';
import 'package:my_flutter_app/common/functions.dart';
import 'package:my_flutter_app/common/variables.dart';
import 'package:my_flutter_app/common/variables_constants.dart';
import 'package:my_flutter_app/course/course_activities.dart';

import 'package:my_flutter_app/cv/cv_html.dart';
import 'package:my_flutter_app/cv/cv.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: textAppPageTitle, // The browser tab name. Where does it come from?
      theme: ThemeData(
        // This is the theme of your application.
        //
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        cardColor: colorSchemeSurface,
        colorScheme: ColorScheme.fromSeed(
          seedColor: colorSchemeSeedColor,
          brightness: colorSchemeBrightness,
        ).copyWith(
          primary: colorSchemePrimary,
          onPrimary: colorSchemeOnPrimary,
          secondary: colorSchemeSecondary,
          onSecondary: colorSchemeOnSecondary,
          error: colorSchemeError,
          onError: colorSchemeOnError,
          surface: colorSchemeSurface,
          onSurface: colorSchemeOnSurface,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorBrandingColor1,
            foregroundColor: colorSchemePrimary,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: colorFloatingActionButtonBackground,
          foregroundColor: colorFloatingActionButtonForeground,
        ),
        scaffoldBackgroundColor: scaffoldBackgroundColor,

        textTheme: textTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: textThemeBodyColor,
                displayColor: textThemeDisplayColor,
              ),
        ),
        useMaterial3: true,
      ),
      home: MyHomePage(title: myHomePageTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final RichText title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: widget.title,
        leading: Row(
          children: [
            PopupMenuButton<String>(
              iconColor: colorBrandingColor1,
              color: Theme.of(context).cardColor,
              // color: Colors.black,
              onSelected: (String result) {
                switch (result) {
                  case 'Option1':
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const CourseActivitiesPage()));
                    break;
                  case 'Option2':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CVPage(
                          name: 'John Doe',
                          contactInfo: 'john.doe@example.com | 555-555-5555',
                          objective:
                              'To obtain a challenging role in software development.',
                          education:
                              'Bachelor of Science in Computer Science, XYZ University',
                          workExperience:
                              'Software Developer, ABC Company (2018-Present)',
                          skills: 'Java, Python, C++, JavaScript',
                          achievements:
                              'Recipient of the XYZ University Computer Science Award',
                        ),
                      ),
                    );
                    break;
                  case 'Option3':
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CvHtmlPage()));
                    break;
                  case 'Option4':
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CalendlyPage()));
                    break;
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Option1',
                  child: Text(textPopupMenuItem1),
                ),
                const PopupMenuItem<String>(
                  value: 'Option2',
                  child: Text(textPopupMenuItem2),
                ),
                const PopupMenuItem<String>(
                  value: 'Option3',
                  child: Text(textPopupMenuItem3),
                ),
                const PopupMenuItem<String>(
                  value: 'Option4',
                  child: Text(textPopupMenuItem4),
                ),
              ],
              icon: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child:
                      Icon(iconPopupMenuItem)), // where is this icon defined?
            ),
          ],
        ),
      ),
      // TODO: if you want to default to a different page, comment out all the "body"
      // section below and replace it with, eg:
      // body: const CalendlyWidget(),
      // or:
      // body: const CVTemplate(
      //   name: 'John Doe',
      //   contactInfo: 'john.doe@example.com | 555-555-5555',
      //   objective: 'To obtain a challenging role in software development.',
      //   education: 'Bachelor of Science in Computer Science, XYZ University',
      //   workExperience: 'Software Developer, ABC Company (2018-Present)',
      //   skills: 'Java, Python, C++, JavaScript',
      //   achievements: 'Recipient of the XYZ University Computer Science Award',
      // ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: SingleChildScrollView(
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            //
            // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
            // action in the IDE, or press "p" in the console), to see the
            // wireframe for each widget.
            mainAxisAlignment: MainAxisAlignment
                .start, // use start instead of center to pull to the top
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 24.0),
                child: GestureDetector(
                  onTap: () async {
                    const url = 'https://www.wearebreakthrough.co.uk/';
                    await launchURL(url);
                  },
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset(imageBranding1),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.01),
                child: GestureDetector(
                  onTap: () async {
                    const url = 'https://www.wearebreakthrough.co.uk/';
                    await launchURL(url);
                  },
                  child: SizedBox(
                    width: 600,
                    height: 600,
                    child: Image.asset(
                        'assets/images/3D+Rendered+image+of+technology+change.jpeg'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height *
                        0.1), // use MediaQuery to make reactive
                child: const Text(textCounterDescription),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  // TODO: how does this work? how to get the best score?
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: textIncrementCounterToolTip,
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
