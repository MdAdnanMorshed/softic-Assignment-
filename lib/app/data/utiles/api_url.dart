abstract class ApiURL {
  ApiURL._();

  static const String baseApiUrl = 'https://secure-falls-43052.herokuapp.com/api/';

  ///------------------- Authentication  url path -----------------------
  static const String loginUrl = '${baseApiUrl}authenticate';

  ///------------------------ Home Url Path ------------------------

  static const String homeAllProductUrl = '${baseApiUrl}products?page=0&size=20';
  static const String homeHotCategoriesUrl = '${baseApiUrl}hot_categories';





}
