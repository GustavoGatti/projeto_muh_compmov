import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_muh_compmov/Drawer/IconSectionDown.dart';
import 'package:projeto_muh_compmov/models/user_model.dart';
import 'package:projeto_muh_compmov/screens/item_registration_screen.dart';
import 'package:scoped_model/scoped_model.dart';

import 'CustomHeader.dart';
import 'icon_section.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
          children: <Widget>[
            CustomHeader(),
            IconSection(),
            Divider(color: Colors.grey[500],),
            IconSectionDown(),
          ],
    ),
    );
  }
}

