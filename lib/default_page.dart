import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:api/age_widget.dart';

class DefaultPage extends StatelessWidget {
  const DefaultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: const AgeWidget(),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.amber,
              child: Center(
                child: TextButton(
                  onPressed: () {
                    ageState.loadData();
                  }, child: Text('Push me'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

// Future<bool> internet() async {
//   try {
//     final result = await InternetAddress.lookup('google.com');
//     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//       return true;
//     }
//   } on SocketException catch (_) {
//     return false;
//   }
// }

}

