import 'package:flint_dart/flint_ui.dart';
import './templates/verify_template.dart';
import 'package:flint_dart/mail.dart';

class VerifyMail extends TransactionalMailable {
  final String title;
  final String content;
  final String? imageUrl;

  VerifyMail({
    required super.recipientEmail,
    required super.recipientName,
    required this.title,
    required this.content,
    this.imageUrl,
  });

  @override
  String get subject => title;

  @override
  FlintWidget build() {
    return VerifyTemplate(
      title: title,
      content: content,
      imageUrl: imageUrl,
    );
  }
}
