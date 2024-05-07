import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChatBot extends StatelessWidget {
  ChatBot({super.key});

  // Create a webview controller
  final _controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // print the loading progress to the console
          // you can use this value to show a progress bar if you want
          debugPrint("Loading: $progress%");
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse("https://chat.openai.com/"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'VitalAge Coach. Bot',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w600,
            // color: const Color.fromRGBO(7, 82, 96, 1),
          ),
        ),
        elevation: 5.0,
      ),
      body: SizedBox(
          width: double.infinity,
          // the most important part of this example
          child: WebViewWidget(
            controller: _controller,
          )),
    );
  }
}
