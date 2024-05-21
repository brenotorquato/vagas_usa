import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    _openURL();
  }

  Future<void> _openURL() async {
    try {
      await launchUrl(
        Uri.parse('https://vagasusa.com/search'),
        customTabsOptions: CustomTabsOptions(
          colorSchemes: CustomTabsColorSchemes.defaults(
            toolbarColor: Colors.blueAccent,
          ),
          shareState: CustomTabsShareState.on,
          urlBarHidingEnabled: true,
          showTitle: true,
        ),
        safariVCOptions: safariControllerOptions(),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  SafariViewControllerOptions safariControllerOptions() {
    return const SafariViewControllerOptions(
      preferredBarTintColor: Color(0xFF007BFF),
      preferredControlTintColor: Colors.white,
      barCollapsingEnabled: true,
      dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
    );
  }

  @override
  Widget build(BuildContext context) {
    var styleFrom = ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.all(14.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text('Vagas USA'),
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                debugPrint("botão de menu lateral acionado!!!");
              },
            ),
            actions: [
              IconButton(
                onPressed: () {
                  debugPrint("botão de notificação acionado!!!");
                },
                icon: const Icon(Icons.notifications),
              )
            ]),
        // body: contentCenter(styleFrom),
        body: contentCenterFull(styleFrom),
      ),
    );
  }

  Center contentCenterFull(ButtonStyle styleFrom) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 90),
        ElevatedButton(
          onPressed: () {
            _openURL();
          },
          style: styleFrom,
          child: const Text(
            'Voltar',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 90),
        Text("versão 0.0.1"),
      ],
    ));
  }

  Center contentCenter(ButtonStyle styleFrom) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          _openURL();
        },
        style: styleFrom,
        child: const Text(
          'Voltar',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
