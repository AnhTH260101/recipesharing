import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipesharing/core/extensions/context.dart';

import '../../enums/enums.dart';
import '../../utils/constants.dart';



class TextFieldWidget extends StatefulWidget {
  final bool autofocus;
  final TextEditingController textEditingController;
  final String? labelText;
  final String? hintText;
  final EnumActionTextInput actionTextInput;
  final FocusScopeNode node;
  final String? errorText;
  final bool hidden;
  final Decoration? decoration;
  final EnumModeInput modeInput;
  final int numberLines;
  final bool enabled;
  final Widget? prefixIcon;

  const TextFieldWidget(
      {Key? key,
        this.autofocus = false,
        this.labelText,
        this.numberLines = 1,
        this.hintText,
        this.decoration,
        this.hidden = false,
        this.enabled = true,
        this.errorText,
        this.modeInput = EnumModeInput.text,
        required this.textEditingController,
        this.actionTextInput = EnumActionTextInput.next,
        this.prefixIcon,
        required this.node})
      : super(key: key);

  @override
  State<TextFieldWidget> createState() =>
      _MushRoomTextFieldWidgetState();
}

class _MushRoomTextFieldWidgetState extends State<TextFieldWidget> {
  bool myHidden = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          enabled: widget.enabled,
          maxLines: widget.numberLines,
          autofocus: widget.autofocus,
          controller: widget.textEditingController,
          cursorColor: Colors.black38,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 1.6, // Change the border width
                color: Constants.primaryLightColor,// Change the color when focused
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 0.1,
                color: Colors.black12,
              ),
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: (widget.hidden)
                ? IconButton(
              onPressed: () {
                setState(
                      () {
                    if (widget.textEditingController.text != "") {
                      myHidden = !myHidden;
                    }
                  },
                );
              },
              icon: Icon(
                myHidden ? Icons.visibility_off : Icons.visibility,
                color: Colors.black38,
              ),
            )
                : const SizedBox(),
            labelText: widget.labelText,
            labelStyle: context.textTheme.bodyMedium,
            hintText: widget.hintText,
            hintStyle: context.textTheme.displaySmall,
            filled: true,
            errorStyle: context.textTheme.bodyMedium,
          ),
          keyboardType: keyboardType(), // Show a numeric keyboard
          inputFormatters: (widget.modeInput == EnumModeInput.number)
              ? <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly, // Allow only digits
          ]
              : null,
          style: widget.enabled
              ? context.textTheme.bodyMedium
              : context.textTheme.bodyMedium,
          obscureText: (widget.hidden) ? myHidden : false,
          textInputAction: textInputAction(),
          onFieldSubmitted: (_) {
            if (widget.hidden &&
                widget.actionTextInput == EnumActionTextInput.next) {
              FocusScope.of(context).nextFocus();
            }
          },
        ),
        (widget.errorText != null)
            ? SizedBox(
          height: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.errorText!,
                style: context.textTheme.bodyMedium,
              ),
            ],
          ),
        )
            : const SizedBox(height: 20)
      ],
    );
  }

  TextInputAction textInputAction() {
    switch (widget.actionTextInput) {
      case EnumActionTextInput.next:
        return TextInputAction.next;
      case EnumActionTextInput.end:
        return TextInputAction.done;
    }
  }

  TextInputType keyboardType() {
    switch (widget.modeInput) {
      case EnumModeInput.text:
        return TextInputType.text;
      case EnumModeInput.number:
        return TextInputType.number;
    }
  }

  void Function()? onEditingComplete(EnumActionTextInput actionTextInput) {
    switch (actionTextInput) {
      case EnumActionTextInput.next:
        return widget.node.nextFocus;
      case EnumActionTextInput.end:
        return widget.node.unfocus;
    }
  }
}