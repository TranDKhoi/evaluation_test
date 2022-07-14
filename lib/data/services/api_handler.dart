import 'package:evaluation_test/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

ApiResponseHandler({
  required http.Response res,
  required BuildContext context,
  required VoidCallback onSuccess,
  required VoidCallback onFailed,
}) {
  switch (res.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      onFailed();
      break;
    case 500:
      showSnackBar(context, "Server Error");
      break;
  }
}
