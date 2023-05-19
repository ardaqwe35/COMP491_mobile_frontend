import 'package:comp491_mobile_frontend/services/firestore_service.dart';
import 'package:comp491_mobile_frontend/services/users_response.dart';
import 'package:get/get.dart';

class FirestoreUtil {
  static FirestoreUtil? _instance;

  FirestoreUtil._();
  static FirestoreUtil get instance => _instance ??= FirestoreUtil._();

  Rx<UsersResponse> usersResponse = UsersResponse.empty().obs;
  Future init() async {
    List<dynamic> results = await Future.wait([
      getUsersResponse(0),
      //getPostResponse(0),
    ]);
    if (results[0] != null) {
      usersResponse.value = results[0];
    }
  }

  Future getUsersResponse(int count) async {
    try {
      var usersReference = FirestoreService.instance.getDocumentReferenceById(
          "users-response", FirestoreService.instance.userId);
      var usersResult = await usersReference!.get();
      var data = usersResult.data() as Map<String, dynamic>;
      UsersResponse userResponse = UsersResponse.fromMap(data);
      usersResponse.value = userResponse;
      usersReference.snapshots().listen((event) {
        onUsersUpdated(event.data() as Map<String, dynamic>);
      });
      return userResponse;
    } catch (e) {
      if (count < 3) {
        return getUsersResponse(count + 1);
      }
    }
  }

  Future getUsersResponseWithUid(int count, String uid) async {
    try {
      var usersReference = FirestoreService.instance
          .getDocumentReferenceById("users-response", uid);
      var usersResult = await usersReference!.get();
      var data = usersResult.data() as Map<String, dynamic>;
      UsersResponse userResponse = UsersResponse.fromMap(data);
      usersResponse.value = userResponse;
      usersReference.snapshots().listen((event) {
        onUsersUpdated((event.data() as Map<String, dynamic>));
      });
      return userResponse;
    } catch (e) {
      if (count < 3) {
        return getUsersResponse(count + 1);
      }
    }
  }

  Future createNewUserDocument() async {
    FirestoreService.instance
        .getCollectionReferenceById("users-response")!
        .doc(FirestoreService.instance.userId)
        .set({
      "id": FirestoreService.instance.userId,
      "name": "",
      "bannerUrl": "",
      "followerCount": 0,
      "gildCount": 0,
      "ppUrl": "",
      "previousPosts": [],
      "followers": []
    });
  }

  void onUsersUpdated(Map<String, dynamic> newResponse) {
    usersResponse.value = UsersResponse.fromMap(newResponse);
  }
}
