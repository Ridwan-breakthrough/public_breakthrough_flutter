import 'package:flutter/services.dart' show PlatformAssetBundle;
import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter/services.dart' show rootBundle;

Future<String> readMarkdownFromAssets(String filename) async {
  try {
    final assetBundle = PlatformAssetBundle();
    // String contents = await rootBundle.loadString(filename, cache: false);
    String contents = await assetBundle.loadString(filename, cache: false);
    // cache faluse doesn't appear to work, need to trigger hot reload to work
    // assetBundle.clear();
    return contents;
  } catch (e) {
    print("Error reading file in readMarkdownFromAssets: $e");
    return '';
  }
}

Future<void> launchURL(String url) async {
  var targetUrl = Uri.parse(url);
  if (await canLaunchUrl(targetUrl)) {
    await launchUrl(targetUrl);
  } else {
    throw 'Could not launch $url';
  }
}
