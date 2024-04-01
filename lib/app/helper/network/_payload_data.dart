part of 'client_api.dart';

class PayloadData {
  Future<Map?> catchPayloadData(http.Response response) async {
    debugPrint('status code payload data : ${response.statusCode.toString()}');
    dynamic jsonResponse;
    try {
      switch (response.statusCode) {
        case 200:
          jsonResponse = {
            "error": false,
            "status": true,
            "statusCode": 200,
            "metadata": json.decode(response.body)
          };
          return jsonResponse;
        case 400:
          final jsonResponse = json.decode(response.body);
          return jsonResponse;
        case 401:
          jsonResponse = {
            "error": true,
            "status": false,
            "statusCode": 403,
            "message": response.body
          };
          return jsonResponse;
        case 403:
          jsonResponse = {
            "error": true,
            "status": false,
            "statusCode": 403,
            "message": "Forbidden"
          };
          return jsonResponse;
        case 404:
          jsonResponse = {
            "error": true,
            "status": false,
            "statusCode": 404,
            "message": "Page not found"
          };
          return jsonResponse;
        case 408:
          jsonResponse = {
            "error": true,
            "status": false,
            "statusCode": 408,
            "message": "Request timeout please try again"
          };
          return jsonResponse;
        case 500:
          jsonResponse = {
            "error": true,
            "status": false,
            "statusCode": 500,
            "message": "Internal server error"
          };
          return jsonResponse;
      }
    } on SocketException {
      Get.snackbar(TxtNotifSnackbar.txtTitleNotifSnackbar.notification,
          TxtNotifSnackbar.txtBodyNotifSnackbar.tryagain);
    }
    return {"error": true, "data": []};
  }
}
