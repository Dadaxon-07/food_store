import 'package:url_launcher/url_launcher.dart';

class UrlService{
  static Future<void> makePhoneCall(String phoneNumber)async{
    final Uri launchUri =Uri(scheme: "tel",path: phoneNumber);
    await launchUrl(launchUri);
  }
  static Future<void> launchInBrauther (Uri url)async{
    if(await launchUrl(url,mode: LaunchMode.externalApplication)){
    }else{
      throw "Uri xato !!!$url";
    }
  }
}