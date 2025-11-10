import 'package:flint_dart/auth.dart';
import 'package:flint_dart/flint_dart.dart';
import 'package:taxi_app_backend/src/mail/verify_mail.dart';
import 'package:taxi_app_backend/src/models/user_model.dart';

class AuthController {
  Future<Response> register(Request req, Response res) async {
    final body = await req.validate({
      "name": "required|string|min:5",
      "email": "required|email|min:3",
      "password": "required|string|min:3|confirmed",
      "phone": "string|min:3",
      "role": "string|min:3",
    });
    final data = await Auth.register(
        name: body["name"],
        email: body["email"],
        password: body["password"],
        additionalData: {
          'gender': body['gender'],
          'phone': body['phone'],
        });

    var otp =
        await Auth.generateNumericVerificationCode(data["email"], length: 5);

    final verify = await VerifyMail(
        recipientEmail: data['email'], recipientName: data["name"], otp: otp);
    verify.send();
    return res.respond({"message": "User registered", "data": data});
  }

  Future<Response> login(Request req, Response res) async {
    var body = await req
        .validate({"email": "required|email", "password": "required|string"});

    final token = await Auth.login(body['email'], body["password"]);

    return res.json({
      "status": "User logged in successfully",
      "data": {
        "user": User().where("email", body["email"]),
        "token": token,
      }
    });
  }
}
