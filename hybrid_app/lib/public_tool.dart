import 'package:flutter/cupertino.dart';

showAlertViewDouble(BuildContext context, String title, String content,Function ontap) {
  showCupertinoModalPopup<int>(
      context: context,
      builder: (t) {
        var dialog = CupertinoAlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('确定'),
              isDefaultAction: true,
              onPressed: () {
                Navigator.of(t).pop();
                if(ontap != null)ontap();
              },
            ),
            CupertinoDialogAction(
              child: Text('取消'),
              isDestructiveAction: true,
              onPressed: () {
                Navigator.of(t).pop();
              },
            ),
          ],
        );
        return dialog;
  });
}

showAlertViewSingle(BuildContext context, String title, String content,Function ontap) {
  showCupertinoModalPopup<int>(
      context: context,
      builder: (t) {
        var dialog = CupertinoAlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('确定'),
              isDefaultAction: true,
              onPressed: () {
                Navigator.of(t).pop();
                if(ontap != null)ontap();
              },
            ),
          ],
        );
        return dialog;
  });
}
