import 'package:get/get.dart';

class Languages extends Translations{
  @override
  
  Map<String, Map<String, String>> get keys => {
    'en_US':{
      'internet_exception':"We're unable to show results.\nPlease check your data\nconnection.",
      'general_exception':"We're unable to process your request.\nPlease try again.",
      'Welcome_back':"Welcome\nback",
      'login':"Login",
      'email_hint':'Email',
      'password_hint':'Password',
      
    },
    'es_ES':{
      'email_hint':'Enter email'
    },
    'fr_FR':{
      'email_hint':'Enter email'
    },
    'de_DE':{
      'email_hint':'Email eingeben'
    },
    'hi':{
      'email_hint':'ईमेल दर्ज करें',
      'Welcome_back':"वापसी पर स्वागत है"
    },
  };

}