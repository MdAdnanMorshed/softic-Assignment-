import 'package:shared_value/shared_value.dart';

 SharedValue<bool> is_logged_in = SharedValue(
  value: false, // initial value
  key: "is_logged_in", // disk storage key for shared_preferences
);

final SharedValue<String> access_token = SharedValue(
  value: "", // initial value
  key: "access_token", // disk storage key for shared_preferences
);

final SharedValue<String> user_id = SharedValue(
  value: "", // initial value
  key: "user_id", // disk storage key for shared_preferences
);


