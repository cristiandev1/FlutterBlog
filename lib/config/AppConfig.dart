class AppConfig{
  static const bool developer = true;
  static const String urlLocalPhotos = "lib/assets/";
  static const String urlProduction = "";
  static const String urlApi = developer ? 'http://192.168.1.67/_apis/api_blog/' : urlProduction;
  static const String appVersion = "1";
  static const String apiKey = 'fe47ab70da8f411513f046c989ca24db';
}