import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:http/http.dart' as http;
import '../function/app_functions.dart';
import '../function/my_local_db.dart';
import '../models/nearby_model.dart';
import '../models/user_info_model.dart';
import '../utils/route_names.dart';




final db = FirebaseFirestore.instance;
final storage = FirebaseStorage.instance;

Future<File> _compressImage(File file) async {
  int length = await file.length();
  File compressedFile = file;
  if ((length / 1000) >= 1000) {
    compressedFile = await FlutterNativeImage.compressImage(
      file.path,
      percentage: 70,
      quality: 70,
    );
  }
  return compressedFile;
}

class ApiFunctions {
  static User? user = FirebaseAuth.instance.currentUser;
  static String usernotfound = 'No user found for that email.';
  static String wrongpassword = 'Wrong password provided for that user.';
  static String password = 'Password should be at least 6 characters';
  static String weakpassword = 'The password provided is too weak.';
  static String emailalreadyinuse =
      'The account already exists for that email.';
  static String noInternet = 'No Internet Connection';
  static String nameD = 'name', emailD = 'email', typeD = 'type', uidD = 'uid';
  static String verifiedD = 'isVerified', timejoinedD = 'timejoined';

  /// Login Function
  static Future<void> login(BuildContext context, {email, pass}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass)
          .then((value) {
        final refUser = db.collection("users").doc(value.user!.uid);
        refUser.get().then((value) async {
          if (value.exists) {
            Map<String, dynamic> data = value.data()!;
            await LocalDB()
                .saveUserInfo(UserInfoData(
              name: data[nameD],
              email: data[emailD],
              type: data[typeD],
              uid: data[uidD],
              password: pass,
              isVerified: data[verifiedD],
              timejoined: data[timejoinedD],
              city: data['city'],
              country: data['country'],
            ))
                .then((value) {
              AppFunction.showAlert(context, 'Login Successful',
                  type: AlertType.success);
              Navigator.pushReplacementNamed(context, homeRoute);
            });
          } else {
            AppFunction.showAlert(context, 'User not found',
                type: AlertType.error);
          }
        });
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        AppFunction.showAlert(context, usernotfound, type: AlertType.error);
      } else if (e.code == 'wrong-password') {
        AppFunction.showAlert(context, wrongpassword, type: AlertType.error);
      } else {
        AppFunction.showAlert(context, '$e', type: AlertType.error);
      }
    } catch (e) {
      AppFunction.showAlert(context, '$e', type: AlertType.error);
    }
  }

  /// Register Function
  static Future<void> registerInd(BuildContext context,
      {name, email, pass}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass)
          .then((value) async {
        final refUser = db.collection("users").doc(value.user!.uid);
        refUser.set({
          'name': name,
          'email': email,
          'type': 'individual',
          'uid': value.user!.uid,
          'isVerified': false,
          'city': '-',
          'country': '-',
          'timejoined': DateTime.now().toString(),
        }).then((v) async {
          await LocalDB()
              .saveUserInfo(UserInfoData(
            name: name,
            email: email,
            type: 'individual',
            uid: value.user!.uid,
            isVerified: false,
            password: pass,
            timejoined: DateTime.now().toString(),
          ))
              .then((value) {
            AppFunction.showAlert(context, 'Registration Successful',
                type: AlertType.success);
            Navigator.pushReplacementNamed(context, homeRoute);
          });
        });
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        AppFunction.showAlert(context, weakpassword, type: AlertType.error);
      } else if (e.code == 'email-already-in-use') {
        AppFunction.showAlert(context, emailalreadyinuse,
            type: AlertType.error);
      } else if (e.code == 'network-request-failed') {
        AppFunction.showAlert(context, noInternet, type: AlertType.error);
      } else {
        AppFunction.showAlert(context, '$e', type: AlertType.error);
      }
    } catch (e) {
      AppFunction.showAlert(context, '$e', type: AlertType.error);
    }
  }

  /// Register Function
  static Future<void> registerNGO(BuildContext context,
      {name, phone, pass, email}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass)
          .then((value) async {
        final refUser = db.collection("users").doc(value.user!.uid);
        refUser.set({
          'name': name,
          'phone': phone,
          'email': email,
          'type': 'ngo',
          'uid': value.user!.uid,
          'isVerified': false,
          'infolevel': 1,
          'timejoined': DateTime.now().toString(),
        }).then((v) async {
          await LocalDB()
              .saveUserInfo(UserInfoData(
            name: name,
            email: email,
            phone: phone,
            type: 'ngo',
            uid: value.user!.uid,
            isVerified: false,
            password: pass,
            timejoined: DateTime.now().toString(),
          ))
              .then((value) {
            AppFunction.showAlert(context, 'Registration Successful',
                type: AlertType.success);
            Navigator.pushReplacementNamed(context, homeRoute);
          });
        });
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        AppFunction.showAlert(context, weakpassword, type: AlertType.error);
      } else if (e.code == 'email-already-in-use') {
        AppFunction.showAlert(context, emailalreadyinuse,
            type: AlertType.error);
      } else if (e.code == 'network-request-failed') {
        AppFunction.showAlert(context, noInternet, type: AlertType.error);
      } else {
        AppFunction.showAlert(context, '$e', type: AlertType.error);
      }
    } catch (e) {
      AppFunction.showAlert(context, '$e', type: AlertType.error);
    }
  }

  /// File Upload(Image) Function
  static Future<String> uploadImage(BuildContext context, file,
      {String? folder}) async {
    List splitFile = file.split('/');
    String folderName = folder ?? 'donations';
    final storageRef = storage.ref().child('$folderName/${splitFile.last}');

    try {
      File? compressedImg = await _compressImage(File(file));
      final response = await storageRef.putFile(compressedImg);
      if (response.state == TaskState.success) {
        return await response.ref.getDownloadURL().then((value) async {
          // AppFunction.showAlert(context, 'Image Uploaded Successfully',
          //     type: AlertType.success);
          return value;
        });
      } else {
        return '${response.state}';
      }
    } on FirebaseException catch (e) {
      AppFunction.showAlert(context, '$e', type: AlertType.error);
      return '';
    } catch (e) {
      AppFunction.showAlert(context, '$e', type: AlertType.error);
      return '';
    }
  }

  /// Donation Submission Function
  static Future<void> submitDonation(
    BuildContext context, {
    name,
    size,
    qty,
    qlt,
    loc,
    del,
    note,
    List? imgs,
    List? category,
  }) async {
    try {
      final refDonation = db.collection("donations").doc();
      refDonation.set({
        'uid': user!.uid,
        'name': name,
        'size_brand': size,
        'quality': qlt,
        'quantity': qty,
        'category': category,
        'location': loc,
        'deliverytype': del,
        'note': note,
        'images': imgs,
        'claimed': 0,
        'claimerInfo': {},
        'date_created': DateTime.now().toString(),
      }).then((v) async {
        AppFunction.showAlert(context, 'Submission Successful',
            type: AlertType.success);
        Navigator.pushReplacementNamed(
          context,
          donateSuccessRoute,
          arguments: {
            'location': loc,
            'category': category,
            'title': category![0],
          },
        );
      });
    } catch (e) {
      AppFunction.showAlert(context, '$e', type: AlertType.error);
    }
  }

  /// Change Password Function
  static Future<void> changePass(BuildContext context, String password) async {
    try {
      await FirebaseAuth.instance.currentUser!
          .updatePassword(password)
          .then((value) {
        AppFunction.showAlert(context, 'Password Updated',
            type: AlertType.success);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        AppFunction.showAlert(context, weakpassword, type: AlertType.error);
      } else if (e.code == 'requires-recent-login') {
        AppFunction.showAlert(context, 'Kindly login again',
            type: AlertType.error);
      } else {
        AppFunction.showAlert(context, '$e', type: AlertType.error);
      }
    } catch (e) {
      AppFunction.showAlert(context, '$e', type: AlertType.error);
    }
  }

  /// Reset Password Function
  static Future<void> resetPass(BuildContext context, String email) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email)
          .then((value) {
        AppFunction.showAlert(context, 'Password Reset Link Sent to your email',
            type: AlertType.success);
        Navigator.pop(context);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        AppFunction.showAlert(context, 'Invalid email address.',
            type: AlertType.error);
      } else if (e.code == 'user-not-found') {
        AppFunction.showAlert(context,
            'There is no user record corresponding to this email address. The user may have been deleted.',
            type: AlertType.error);
      } else {
        AppFunction.showAlert(context, '$e', type: AlertType.error);
      }
    } catch (e) {
      AppFunction.showAlert(context, '$e', type: AlertType.error);
    }
  }

  /// Fetch Nearby Homes
  static Future<List<NearByModel>> getnearbyPlace(String latlng) async {
    String keyword = 'orphanage';
    String location = latlng;
    String radius = '1500';
    String type = 'orphanage home';
    String key = 'AIzaSyDD8M8-u_p2Hpkf0xgm_OjLnDPWyyo16og';
    final response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?keyword=$keyword&location=$location&radius=$radius&type=$type&key=$key'));
    final result = jsonDecode(response.body);
    final List nearby = result['results'];

    return nearby.map((e) => NearByModel.fromJson(e)).toList();
  }

  /// Edit Profile
  static Future<void> editProfile(context, {name, city, country, data}) async {
    try {
      final refUser = db.collection("users").doc(user!.uid);
      refUser.update({
        'name': name,
        'city': city,
        'country': country,
      }).then((v) async {
        await LocalDB()
            .updateUser(UserInfoData(
          name: name,
          city: city,
          country: country,
          email: data['email'],
          type: data['individual'],
          uid: data['uid'],
          isVerified: data['verified'],
          password: data['pass'],
          timejoined: data['date'],
        ))
            .then((value) {
          AppFunction.showAlert(context, 'Profile Updated Successful',
              type: AlertType.success);
          Navigator.pop(context);
        });
      });
    } on FirebaseException catch (e) {
      AppFunction.showAlert(context, 'Permission denied, kindly re-login',
          type: AlertType.error);
      AppFunction.forcedLogout(e.code);
    }
  }

  /// Fetch Request
  static Future<List> fetchRequests() async {
    try {
      final response = await db.collection('requests').get();
      if (response.docs.isNotEmpty) {
        return response.docs;
      } else {
        return [];
      }
    } on FirebaseException catch (e) {
      AppFunction.forcedLogout(e.code);
      return [];
    }
  }
}
