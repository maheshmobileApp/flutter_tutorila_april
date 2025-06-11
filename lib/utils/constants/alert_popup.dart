import 'package:flutter/material.dart';



alertPopup(BuildContext context, String message, {Function()? onBack}) {
  return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
            title: Text(message,
                style:const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
            actions: [
              TextButton(
                  onPressed: onBack ??
                      () async {
                        Navigator.pop(context);
                        // navigationService.goBack();
                      },
                  child:const Text(
                    "Ok",
                    style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
                  )),
            ]);
      });
}
