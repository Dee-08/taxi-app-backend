import 'package:flint_dart/flint_dart.dart';
import 'package:taxi_app_backend/src/routes/auth_routes.dart';

void main() {
  final app = Flint(
    withDefaultMiddleware: true,
  );

  app.mount("/auth", authRoutes);
  app.listen(3000);
}
