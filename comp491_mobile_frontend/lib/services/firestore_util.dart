import 'package:comp491_mobile_frontend/services/firestore_service.dart';
import 'package:comp491_mobile_frontend/services/users_response.dart';
import 'package:get/get.dart';

class FirestoreUtil {
  static FirestoreUtil? _instance;

  FirestoreUtil._();
  static FirestoreUtil get instance => _instance ??= FirestoreUtil._();

  Rx<UsersResponse> usersResponse = UsersResponse.empty().obs;

  Future getUsersResponse(int count) async {
    try {
      var usersReference = FirestoreService.instance
          .getDocumentReferenceById("users_document", "users");
      var usersResult = await usersReference!.get();
      var data = usersResult.data() as Map<String, dynamic>;
      UsersResponse userResponse =
          UsersResponse.fromMap(data['lists'] as Map<String, dynamic>);
      usersResponse.value = userResponse;
      usersReference.snapshots().listen((event) {
        onUsersUpdated((event.data() as Map<String, dynamic>)['lists']
            as Map<String, dynamic>);
      });
      return usersResponse;
    } catch (e) {
      if (count < 3) {
        return getUsersResponse(count + 1);
      }
    }
  }

  void onUsersUpdated(Map<String, dynamic> newResponse) {
    usersResponse.value = UsersResponse.fromMap(newResponse);
  }
}
