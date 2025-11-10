import 'package:flint_dart/flint_ui.dart';
import './templates/verify_template.dart';
import 'package:flint_dart/mail.dart';

class VerifyMail extends TransactionalMailable {
  final String title = "Verify Required";
  final String content = "Use the code to verify your app";
  final String otp;

  VerifyMail(
      {required super.recipientEmail,
      required super.recipientName,
      required this.otp});

  @override
  String get subject => title;

  @override
  FlintWidget build() {
    return VerifyTemplate(
        title: title,
        content: content,
        otp: otp,
        recipientEmail: recipientEmail,
        recipientName: recipientName);
  }
}
