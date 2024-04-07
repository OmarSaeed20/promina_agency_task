// ignore_for_file: deprecated_member_use

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina_agency_task/utils/app_constants.dart';
import 'package:promina_agency_task/utils/extensions.dart';

import 'code_picker_widget.dart';

class TextInputWidget extends StatefulWidget {
  const TextInputWidget({
    super.key,
    this.hintText = 'Write something...',
    this.controller,
    this.focusNode,
    this.titleText,
    this.nextFocus,
    this.isEnabled = true,
    this.borderColor = const Color(0xFFFFFFFF),
    this.type = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.maxLines = 1,
    this.onChanged,
    this.onTap,
    this.prefixIcon,
    this.prefixIconWidget,
    this.suffixIcon,
    this.suffixIconSize = 12,
    this.capitalization = TextCapitalization.none,
    this.readOnly = false,
    this.isPassword = false,
    this.isAmount = false,
    this.showCodePicker = false,
    this.isRequiredFill = true,
    this.showLabelText = false,
    this.showBorder = false,
    this.filled = true,
    this.borderRadius = 60,
    this.prefixHeight = 50,
    this.countryDialCode,
    this.onCountryChanged,
    this.validator,
    this.inputFormatters,
    this.labelText,
    this.textAlign = TextAlign.start,
    this.isRequired = true,
  });
  final String? countryDialCode,
      hintText,
      titleText,
      labelText,
      prefixIcon,
      suffixIcon;
  final bool isPassword,
      isAmount,
      showCodePicker,
      isRequiredFill,
      readOnly,
      filled,
      isEnabled,
      showBorder,
      showLabelText,
      isRequired;
  final TextAlign textAlign;
  final TextEditingController? controller;
  final FocusNode? focusNode, nextFocus;
  final TextInputType type;
  final TextInputAction inputAction;
  final void Function()? onTap;
  final Function(String text)? onChanged;
  final String? Function(String?)? validator;
  final Widget? prefixIconWidget;
  final int maxLines;
  final TextCapitalization capitalization;
  final double borderRadius, suffixIconSize, prefixHeight;
  final Color borderColor;
  final List<TextInputFormatter>? inputFormatters;
  final Function(CountryCode countryCode)? onCountryChanged;

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if ((widget.titleText ?? "").isNotEmpty) ...[
          RichText(
            text: TextSpan(
              text: widget.titleText ?? "",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: const Color(0xFF202532),
                  ),
              children: [
                if (widget.isRequiredFill)
                  TextSpan(
                    text: " *",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.red,
                        ),
                  )
              ],
            ),
          ),
          8.height,
        ],
        TextFormField(
          maxLines: widget.maxLines,
          controller: widget.controller,
          focusNode: widget.focusNode,
          validator: widget.validator,
          textAlign: widget.textAlign,
          readOnly: widget.readOnly,
          onTap: widget.onTap,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: AppConstants.textRegular.copyWith(fontSize: 16),
          textInputAction: widget.inputAction,
          keyboardType: widget.type,
          cursorColor: Theme.of(context).primaryColor,
          textCapitalization: widget.capitalization,
          enabled: widget.isEnabled,
          autofocus: false,
          autofillHints: _autofillHints,
          obscureText: widget.isPassword ? _obscureText : false,
          inputFormatters: _inputFormatters,
          decoration: InputDecoration(
            alignLabelWithHint: true,
            border: _border,
            focusedBorder: OutlineInputBorder(
              borderRadius: 8.radius,
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor, //widget.borderColor,
                width: widget.showBorder ? 0 : .75,
              ),
            ),
            enabledBorder: _border,
            fillColor: Theme.of(context).cardColor,
            /* floatingLabelStyle: widget.showLabelText
                ? AppConstants.textRegular.copyWith(
                    color: Theme.of(context).hintColor.withOpacity(.75),
                  )
                : null, */
            filled: widget.filled,
            // labelText : widget.showLabelText? widget.labelText?? widget.hintText : null,
            labelStyle: widget.showLabelText
                ? AppConstants.textRegular.copyWith(
                    color: Theme.of(context).hintColor,
                  )
                : null,
            label: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: widget.labelText ?? '',
                    style: AppConstants.textRegular.copyWith(
                      color: Theme.of(context).hintColor.withOpacity(.75),
                    ),
                  ),
                  if (widget.isRequired && widget.labelText != null)
                    TextSpan(
                      text: ' *',
                      style: AppConstants.textRegular
                          .copyWith(color: Theme.of(context).colorScheme.error),
                    )
                ],
              ),
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(.5),
            ),
            /*  widget.showLabelText
                ? null
                : AppConstants.textRegular
                    .copyWith(color: Theme.of(context).hintColor), */
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            /* prefix: widget.prefixIconWidget,
            prefixIcon: widget.prefixIcon != null
                ? _PrefixIcon(widget: widget)
                : widget.showCodePicker
                    ? _CodePicker(widget: widget)
                    : null, */
            /* suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Theme.of(context).hintColor.withOpacity(0.5),
                    ),
                    onPressed: _toggle,
                  )
                : widget.suffixIcon != null
                    ? SizedBox(
                        width: 20.w,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(widget.suffixIcon!),
                        ),
                      )
                    : null, */
          ),
          onFieldSubmitted: (text) => widget.nextFocus != null
              ? FocusScope.of(context).requestFocus(widget.nextFocus)
              : null,
          onChanged: widget.onChanged,
        ),
      ],
    );
  }

  OutlineInputBorder get _border => OutlineInputBorder(
        borderRadius: 8.radius,
        borderSide: BorderSide(
          color: widget.borderColor,
          width: widget.showBorder ? 0 : .75,
        ),
      );

  List<TextInputFormatter>? get _inputFormatters => switch (widget.type) {
        TextInputType.phone => <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'[0-9+]'))
          ],
        _ => switch (widget.isAmount) {
            true => [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
            false => widget.inputFormatters,
          },
      };

  List<String>? get _autofillHints => switch (widget.type) {
        TextInputType.name => [AutofillHints.name],
        TextInputType.emailAddress => [AutofillHints.email],
        TextInputType.phone => [AutofillHints.telephoneNumber],
        TextInputType.streetAddress => [AutofillHints.fullStreetAddress],
        TextInputType.url => [AutofillHints.url],
        TextInputType.visiblePassword => [AutofillHints.password],
        _ => null,
      };

  void _toggle() => setState(() => _obscureText = !_obscureText);
}

class _PrefixIcon extends StatelessWidget {
  const _PrefixIcon({
    super.key,
    required this.widget,
  });

  final TextInputWidget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.prefixHeight,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: widget.borderRadius.radiusCircular,
          bottomLeft: widget.borderRadius.radiusCircular,
        ),
      ),
      child: Center(
        child: Image.asset(
          widget.prefixIcon!,
          height: 20.h,
          width: 20.h,
          color: Theme.of(context).primaryColor.withOpacity(.6),
        ),
      ),
    );
  }
}

class _CodePicker extends StatelessWidget {
  const _CodePicker({required this.widget});

  final TextInputWidget widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      child: Row(
        children: [
          CodePickerWidget(
            padding: const EdgeInsetsDirectional.only(end: 10),
            flagWidth: 25,
            onChanged: widget.onCountryChanged,
            initialSelection: widget.countryDialCode,
            favorite: [
              widget.countryDialCode != null ? widget.countryDialCode! : 'BD'
            ],
            showDropDownButton: true,
            showCountryOnly: false,
            showOnlyCountryWhenClosed: false,
            showFlagDialog: true,
            hideMainText: false,
            showFlagMain: false,
            dialogBackgroundColor: Theme.of(context).cardColor,
            barrierColor: AppConstants.isDarkMode(context)
                ? Colors.black.withOpacity(0.4)
                : null,
            textStyle: AppConstants.textRegular.copyWith(
              fontSize: 16,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ),
          Text(
            widget.countryDialCode ?? '',
            style: AppConstants.textRegular,
          ),
        ],
      ),
    );
  }
}
