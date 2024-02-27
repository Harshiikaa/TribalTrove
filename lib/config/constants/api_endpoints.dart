class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  // For Windows
  // static const String baseUrl = "http://10.0.2.2:5000/api";

  //home
  // static const String baseUrl = "http://192.168.1.68:5000/api/";
  // static const String baseUrl = "http://192.168.1.66:5000/api/";

  // college
  static const String baseUrl = "http://192.168.137.1:5000/api/";

  // For MAC
  // static const String baseUrl = "http://192.168.18.195:5000/api/";

  //From WIFI or IP config
  //static const String baseUrl = "http://192.168.4.4:3000/api/v1/";

  // ====================== Auth Routes ======================

  // static const String register = "$baseUrl/user/create";
  static const String register = "user/create";
  static const String login = "user/login";
  static const String uploadImage = "user/uploadImage";

  // ====================== Seller Routes ======================
  static const String loginSeller = "seller/login";
  // static const String register = "$baseUrl/user/create";
  static const String registerSeller = "seller/create";
  static const String uploadImageSeller = "seller/uploadImage";

  // ====================== Product Routes ======================
  static const String createProduct = "product/createProduct";
  static const String getAllProducts = "product/getProducts";
  static const String getSingleProduct = "product/getProduct/:id";
  static const String getProductBySellerID = "product/getProductsBySellerApi/";

  // static const String getProductByCategory = "product/getProductByCategory";
  static const String updateProduct = "product/updateProduct/";
  static const String deleteProduct = "product/deleteProduct/";

// ====================== Favorite Routes ======================
  static const String createFavorite = "favorite/createFavorite";
  static const String getFavoriteByUserID = "favorite/getFavoriteByUserID/";
  static const String getFavorite = "favorite/getFavorite/";
  static const String removeFavorite = "favorite/removeFavorite/";

  // ====================== MyCart Routes ======================
  static const String addToCart = "cart/addToCart";
  static const String getCartByUserID = "cart/getCartByUserID/:id";
  static const String getCart = "cart/getCart/";
  static const String removeFromCart = "cart/removeFromCart/";

  static const limitPage = 20;
}
