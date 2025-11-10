import 'package:flint_dart/flint_ui.dart';

class VerifyTemplate extends FlintEmailTemplate {
  final String title;
  final String content;

  final String otp;

  VerifyTemplate({
    required this.title,
    required this.content,
    required super.recipientEmail,
    required super.recipientName,
    required this.otp,
  });

  @override
  FlintWidget buildContent() {
    return FlintBox(
      padding: EdgeInsets.all(0),
      children: [
        FlintColumn(
          padding: EdgeInsets.all(24),
          children: [
            FlintText(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: '#1a1a1a',
              ),
              align: TextAlign.center,
            ),
            FlintText(
              content,
              style: TextStyle(
                fontSize: 14,
                color: '#666666',
              ),
              align: TextAlign.center,
            ),
            FlintButton(
              text: otp,
              style: ButtonStyle.primary().copyWith(
                backgroundColor: theme.primaryColor,
                textStyle: TextStyle(
                  color: '#ffffff',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              borderRadius: BorderRadius.circular(6),
            ),
            FlintBox(
              margin: EdgeInsets.only(top: 32),
              padding: EdgeInsets.all(16),
              backgroundColor: '#f8f9fa',
              borderRadius: BorderRadius.circular(6),
              children: [
                FlintText(
                  'You received this email because you subscribed to our Verify updates.',
                  style: TextStyle(
                    fontSize: 12,
                    color: '#666666',
                  ),
                  align: TextAlign.center,
                ),
                FlintBox(
                  margin: EdgeInsets.only(top: 8),
                  children: [
                    FlintRichText(
                      children: [
                        FlintTextSpan(
                          'Unsubscribe',
                          style: TextStyle(
                            color: '#999999',
                            decoration: TextDecoration.underline,
                          ),
                          onTap: 'https://example.com/unsubscribe',
                        ),
                      ],
                      align: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
