import 'package:url_launcher/url_launcher.dart';

// ignore: non_constant_identifier_names
LaunchURL(String link) async {
  final Uri url = Uri.parse(link);
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
