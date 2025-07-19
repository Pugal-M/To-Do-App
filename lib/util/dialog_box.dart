// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:food/util/bottons_page.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onsave;
  VoidCallback oncancel;
  DialogBox({
  super.key,
  required this.controller,
  required this.onsave,
  required this.oncancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[100],
      content: SizedBox(
        height: 140,
        width: 100,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                
                border: UnderlineInputBorder(),
                hintText: ' Add a New Task...',
              ),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
               crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              MyButton(text: 'Cancel', onPressed:oncancel),
              MyButton(text: 'Save', onPressed:onsave),
            ]),
          )
          ],
        ),
      ),
    );
  }
}