import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suitmedia/common/styles.dart';
import 'package:suitmedia/model/email_model.dart';

class CardUser extends StatelessWidget {
  final AllData dataUser;

  const CardUser({required this.dataUser});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, bottom: 50),
      child: Material(
        color: primaryColor,
        child: ListTile(
          onTap: () => Navigator.pop(context, dataUser.firstName),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              dataUser.avatar,
            ),
          ),
          title: Text(dataUser.firstName + dataUser.lastName,
              style: Theme.of(context).textTheme.subtitle1),
          subtitle: Text(dataUser.email,
              style: Theme.of(context).textTheme.subtitle2),
        ),
      ),
    );
  }
}

// Hero(
//             tag: dataUser.avatar,
//             child: 