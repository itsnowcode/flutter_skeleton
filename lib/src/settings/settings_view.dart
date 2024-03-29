import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'settings_controller.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends StatefulWidget {
  const SettingsView({Key? key, required this.controller}) : super(key: key);

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  State<StatefulWidget> createState() {
    return SettingsState();
  }
}

class SettingsState extends State<SettingsView> {
  User? user;
  List<String> lists = [];
  StreamSubscription? sub;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;

    FirebaseAuth.instance.userChanges().listen((user) {
      if (user == null) {
        return;
      }

      sub = FirebaseFirestore.instance
          .collection('apps')
          .doc('flutter_skeleton')
          .collection('users')
          .snapshots()
          .listen((snapshot) {
        var li = <String>[];
        for (final document in snapshot.docs) {
          li.add(document.data()['name']);
        }

        setState(() {
          lists = li;
        });
      });
    });
  }
  
@override
  void dispose() {
    sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        // Glue the SettingsController to the theme selection DropdownButton.
        //
        // When a user selects a theme from the dropdown list, the
        // SettingsController is updated, which rebuilds the MaterialApp.
        child: Column(
          children: [
            DropdownButton<ThemeMode>(
              // Read the selected themeMode from the controller
              value: widget.controller.themeMode,
              // Call the updateThemeMode method any time the user selects a theme.
              onChanged: widget.controller.updateThemeMode,
              items: const [
                DropdownMenuItem(
                  value: ThemeMode.system,
                  child: Text('System Theme'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.light,
                  child: Text('Light Theme'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.dark,
                  child: Text('Dark Theme'),
                )
              ],
            ),
            Text(widget.controller.packageInfo.appName),
            Text(widget.controller.packageInfo.packageName),
            TextButton(
              onPressed: () async {
                if (user != null) {
                  return;
                }
                var credential =
                    await FirebaseAuth.instance.signInAnonymously();
                setState(() {
                  user = credential.user;
                });
              },
              child: Text(
                  user == null ? 'sign in anonymously' : 'already logined'),
            ),
            ...lists.map((e) => Text(e)).toList(),
          ],
        ),
      ),
    );
  }
}
