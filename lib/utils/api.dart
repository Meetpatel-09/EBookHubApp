
class MyAPI {
  // static String api = "http://172.20.10.3:80/ebookhub/api/";
  static String api = "http://192.168.1.3:80/ebookhub/api/";

  static String uploadImage = "http://192.168.1.3:80/ebookhub/uploadimge.php";
  static String getImage = "http://192.168.1.3:80/ebookhub/upload/";

  static String login = "${api}users/login.php";
  static String register = "${api}users/create.php";

  static String uploadBook = "${api}books/create.php";

  static String getAllBooks = "${api}books/readall.php";
  static String getAllBooksCategoryWise = "${api}books/readallcategorywise.php?category=";

  static String getUserDetails = "${api}users/readsingle.php?id=";
}