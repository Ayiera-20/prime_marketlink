// class user{
//   String? Name;
//   String? Email;
//   String? phoneNumber;
//   String? Password;
//   int? id;
//   User(String n, String e, String p, String s, int i){
//   Name = n;
//   Email = e;
//   phoneNumber = p;
//   Password = s;
//   id = i;
//   }

// }



// class User

//  {
//   String? name;
//   String? email;
//   String? phoneNumber;
//   String? password;
//   int? id;

//   User({
//     required String name,
//     required String email,
//     required String phoneNumber,
//     required String password,
//     required int id,
//   }) {
//     this.name = name;
//     this.email = email;
//     this.phoneNumber = phoneNumber;
//     this.password = password;
//     this.id = id;
//   }
// }

class MyAppUser {
  String? uid; // Firebase user ID
  String? name;
  String? email;
  String? phoneNumber;

  MyAppUser({this.uid, this.name, this.email, this.phoneNumber});

  // Additional constructor for Firebase data conversion
  factory MyAppUser.fromMap(Map<String, dynamic> data, String documentId) {
    return MyAppUser(
      uid: documentId,
      name: data['name'],
      email: data['email'],
      phoneNumber: data['phoneNumber'],
    );
  }

  // Convert user data to a map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }
}



