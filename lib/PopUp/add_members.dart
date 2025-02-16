import 'package:award/PopUp/user_model.dart';
import 'package:get/get.dart';

class AddMembersController extends GetxController {
  var addedUsers = added.obs; // Final added list
  var tempAdded = <User>[].obs; // Temporary list for selection

  // Add user to tempAdded list
  void addToTemp(User user) {
    if (!tempAdded.any((u) => u.userId == user.userId)) {
      tempAdded.add(user);
    }
  }

  // Remove user from tempAdded list
  void removeFromTemp(User user) {
    tempAdded.removeWhere((u) => u.userId == user.userId);
  }

  // Confirm additions: Move tempAdded items to addedUsers
  void confirmSelections() {
    for (var user in tempAdded) {
      if (!addedUsers.any((u) => u.userId == user.userId)) {
        addedUsers.add(user);
      }
    }
    tempAdded.clear(); // Clear temp list after confirmation
  }

  // Remove user from the final added list
  void removeUser(User user) {
    addedUsers.removeWhere((u) => u.userId == user.userId);
  }

  // Check if user is in the final added list
  bool isUserAdded(User user) {
    return addedUsers.any((u) => u.userId == user.userId);
  }

  // Check if user is in the temp list
  bool isUserInTemp(User user) {
    return tempAdded.any((u) => u.userId == user.userId);
  }
}
