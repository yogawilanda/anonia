// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// showConfirmDialog(
//   BuildContext context,
//   String title,
//   String description,
//   String confirmBtnTxt,
//   String cancelBtnTxt,
//   Function onConfirmClicked,
// ) {
//   // set up the buttons
//   Widget cancelButton = TextButton(
//     child: Text(cancelBtnTxt),
//     onPressed: () {
//       Navigator.of(context).pop(); // dismiss dialog
//     },
//   );
//   Widget confirmButton = TextButton(
//     child: Text(confirmBtnTxt),
//     onPressed: () {
//       onConfirmClicked.call();
//       Navigator.of(context).pop(); // dismiss dialog
//     },
//   );
//   // set up the AlertDialog
//   AlertDialog alert = AlertDialog(
//     title: Text(title),
//     content: Text(description),
//     actions: [
//       cancelButton,
//       confirmButton,
//     ],
//   );
//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }

// showInfoDialog(BuildContext context, String title, String description, String confirmBtnTxt) {
//   // set up the buttons

//   Widget confirmButton = TextButton(
//     child: Text(confirmBtnTxt),
//     onPressed: () {
//       Navigator.of(context).pop(); // dismiss dialog
//     },
//   );
//   // set up the AlertDialog
//   AlertDialog alert = AlertDialog(
//     title: Text(title),
//     content: Text(description),
//     actions: [
//       confirmButton,
//     ],
//   );
//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }

import 'package:flutter/material.dart';

class AlertDialogHapus extends StatelessWidget {
  const AlertDialogHapus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}
