
import 'package:e_commerece_app/core/shared/my_shared.dart';
import 'package:e_commerece_app/core/shared/my_shared_keys.dart';

class LoginLocal {

  loginCash({
    required final String name,
    required final String email,
    required final String imageUrl,
    required final String phone,
    required final String token,
    required final int userId,
  }) {
    MyShared.putString(key: MySharedKeys.email, value: email);
    MyShared.putString(key: MySharedKeys.username, value: name);
    MyShared.putString(key: MySharedKeys.imageUrl, value: imageUrl);
    MyShared.putString(key: MySharedKeys.phone, value: phone);
    MyShared.putString(key: MySharedKeys.apiToken, value: token);
    MyShared.putInt(key: MySharedKeys.userid, value: userId);
  }

  loginLocal() {}
}
