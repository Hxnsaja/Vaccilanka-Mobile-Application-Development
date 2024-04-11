// form_widgets.dart
import 'package:flutter/material.dart';

Widget buildFieldWithTitle(String title, TextEditingController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
Padding(
        padding: EdgeInsets.only(bottom: 8.0),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.blue,
                width: 1.0,
              ),
            ),
 focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.blue,
                width: 1.0,
              ),
            ),
            hintText: 'Enter $title',
            hintStyle: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
              color: Colors.grey[400],
            ),

            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter $title';
            }
            return null;
          },
        ),
      ),
    ],
  );
}  
Widget buildShortFieldWithTitle(String title, TextEditingController controller, VoidCallback onChangePressed) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),

      focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 1.0,
                    ),
                  ),
                  hintText: 'Enter $title',
                  hintStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[400],
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter $title';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: onChangePressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF94C5FF),
                shape: RoundedRectangleBorder(
                  borderRadius: 
                  BorderRadius.circular(14.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  'Change',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,

                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}