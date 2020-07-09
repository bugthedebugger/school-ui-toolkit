import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:school_ui_toolkit/src/colors/school_toolkit_colors.dart';

class SchoolToolkitTextField extends StatefulWidget {
  final bool obscureText;
  final TextEditingController controller;
  final Function(String) onChanged;
  final Function(String) onSaved;
  final Function(String) onFieldSubmitted;
  final VoidCallback onTap;
  final String errorText;
  final String label;
  final String hint;

  const SchoolToolkitTextField({
    Key key,
    this.obscureText = false,
    this.controller,
    this.onChanged,
    this.onSaved,
    this.onFieldSubmitted,
    this.onTap,
    this.errorText,
    this.label,
    this.hint,
  }) : super(key: key);

  @override
  _SchoolToolkitTextFieldState createState() => _SchoolToolkitTextFieldState();
}

class _SchoolToolkitTextFieldState extends State<SchoolToolkitTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      onFieldSubmitted: widget.onFieldSubmitted,
      onTap: widget.onTap,
      decoration: InputDecoration(
        hintText: widget.hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            ScreenUtil().setWidth(5.0),
          ),
          borderSide: BorderSide(
            color: SchoolToolkitColors.lightBlue,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            ScreenUtil().setWidth(5.0),
          ),
          borderSide: BorderSide(
            color: SchoolToolkitColors.lightBlue,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(20),
        ),
        errorText: widget.errorText,
        labelText: widget.label,
      ),
    );
  }
}
