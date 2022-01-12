import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suitmedia/common/styles.dart';
import 'package:suitmedia/ui/second_screen.dart';

class FirstScreen extends StatefulWidget {
  static const routeName = '/first_screen';
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final nameController = TextEditingController();
  final textController = TextEditingController();

  // bool isPalindrome(String input) {
  //   input = textController.text;
  //   for (int i = 0; i < input.length ~/ 2; i++) {
  //     if (input[i] != input[input.length - i - 1]) {
  //       print(false);
  //       return false;
  //     }
  //   }
  //   print(input);
  //   print(true);
  //   return true;
  // }

// void palindrome(String input) {
//   input = textController.text;
//     var len = input.length;
//     var mid = Mat.floor(len/2);

//     for ( var i = 0; i < mid; i++ ) {
//         if (input[i] != input[len - 1 - i]) {
//             return false;
//         }
//     }

//     return true;
// }
  bool palindrome() {
    String? original = textController.text;
    print(original);

    String? reverse = original.split('').reversed.join('');
    print(reverse);

    if (original == reverse) {
      final snackBar = SnackBar(content: const Text('True'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print('Its A Palindrome');
    } else {
      final snackBar = SnackBar(content: const Text('False'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print('Its A Not Palindrome');
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    String name = 'Name is empty';
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background.png'),
                    fit: BoxFit.cover),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 116,
                        height: 116,
                        child: Image.asset('assets/btn_add_photo .png'),
                      ),
                      SizedBox(height: 58.12),
                      _buildNameField(),
                      SizedBox(height: 22.12),
                      _buildTextField(),
                      SizedBox(height: 45),
                      MaterialButton(
                        child: Text('CHECK',
                            style: Theme.of(context).textTheme.headline6),
                        color: secondaryColor,
                        textTheme: ButtonTextTheme.primary,
                        height: 53,
                        minWidth: MediaQuery.of(context).size.width,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        onPressed: () {
                          // print(palindrome);
                          palindrome();
                        },
                      ),
                      SizedBox(height: 22.12),
                      MaterialButton(
                        child: Text('NEXT',
                            style: Theme.of(context).textTheme.headline6),
                        color: secondaryColor,
                        height: 53,
                        minWidth: MediaQuery.of(context).size.width,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, SecondScreen.routeName,
                              arguments: nameController.text);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      style: Theme.of(context).textTheme.subtitle2,
      controller: nameController,
      validator: (text) {
        if (text != null && text.isNotEmpty) {
          return null;
        } else {
          return 'Name can\'t be empty!';
        }
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(
          color: Colors.red,
          wordSpacing: 5.0,
        ),
        hintText: 'Name',
        hintStyle: Theme.of(context).textTheme.subtitle2,
      ),
    );
  }

  Widget _buildTextField() {
    return TextFormField(
      style: Theme.of(context).textTheme.subtitle2,
      controller: textController,
      decoration: InputDecoration(
        errorStyle: TextStyle(
          color: Colors.red,
          wordSpacing: 5.0,
        ),
        hintText: 'Palindrome',
        hintStyle: Theme.of(context).textTheme.subtitle2,
      ),
    );
  }
}
