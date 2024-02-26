import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(WebApp());
}

class WebApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter WebView",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: WebViewScreen(),
    );
  }
}

class WebViewScreen extends StatefulWidget {
  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController _controller;
  TextEditingController _urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Webview"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _urlController,
                    decoration: InputDecoration(
                      labelText: "Enter URL",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    _loadUrl();
                  },
                  child: Text("Load"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _loadUrl() {
    String url = _urlController.text.trim();
    if (url.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WebViewPage(url: url),
        ),
      );
    }
  }
}

class WebViewPage extends StatelessWidget {
  final String url;

  WebViewPage({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Webview"),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// //https://orix.designer.contineonx.com/contineo/webapps/helpdocs/support
// void main() => runApp(WebApp());

// class WebApp extends StatelessWidget {
//   late WebViewController _controller;
//   TextEditingController _urlController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Flutter WebView",
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Webview"),
//         ),
//         body: Column(
//           children: [
//             Container(
//               padding: EdgeInsets.all(16.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       controller: _urlController,
//                       decoration: InputDecoration(
//                         labelText: "Enter URL",
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                   ElevatedButton(
//                     onPressed: () {
//                       _loadUrl();
//                     },
//                     child: Text("Load"),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [Colors.blue, Colors.lightBlueAccent],
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                   ),
//                 ),
//                 child: Center(
//                   child: Card(
//                     margin: EdgeInsets.all(20.0),
//                     elevation: 8.0,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15.0),
//                     ),
//                     child: Padding(
//                       padding: EdgeInsets.all(9.0),
//                       child: WebView(
//                         initialUrl: '',
//                         javascriptMode: JavascriptMode.unrestricted,
//                         onWebViewCreated: (WebViewController webViewController) {
//                           _controller = webViewController;
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _loadUrl() {
//     String url = _urlController.text.trim();
//     if (url.isNotEmpty) {
//       _controller.loadUrl(url);
//     }
//   }
// }



// void main() {
//   runApp(
//     const MaterialApp(
//       // theme: ThemeData(useMaterial3: true),
//       home: WebViewApp(),
//     ),
//   );
// }

// class WebViewApp extends StatefulWidget {
//   const WebViewApp({super.key});

//   @override
//   State<WebViewApp> createState() => _WebViewAppState();
// }

// class _WebViewAppState extends State<WebViewApp> {
//   late final WebViewController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = WebViewController()
//       ..loadRequest( 
//         Uri.parse('https://vuejs.org/guide/extras/animation.html'),  //https://orix.designer.contineonx.com/contineo/webapps/helpdocs/support
//       );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Orix WebView'),
//       ),
//       body: WebViewWidget(
//         controller: controller,
//       ),
//     );
//   }
// }
