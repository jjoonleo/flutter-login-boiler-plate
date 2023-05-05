import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_boiler_plate/feature/user/user.dart';

class ProtectedPage extends ConsumerStatefulWidget {
  const ProtectedPage({super.key});

  @override
  ConsumerState<ProtectedPage> createState() => _ProtectedPageState();
}

class _ProtectedPageState extends ConsumerState<ProtectedPage> {
  var email = TextEditingController();
  var password = TextEditingController();
  String text = "";

  static final storage = FlutterSecureStorage();
  final url = Uri.http('192.168.0.26:8000', 'api/protected');

  checkToken() async {
    var user = ref.read(userState);
    String token = user.mapOrNull(loggedIn: (data) => data.user.token) ?? "";
    print("token" + token);
    var response = await http.get(url, headers: {"Authorization": token});
    var decodedResponse;
    print(response.statusCode);
    if (response.statusCode == 200) {
      decodedResponse = jsonDecode(response.body);
      setState(() {
        text = decodedResponse["msg"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("get page"),
      ),
      body: Center(
        child: Column(children: <Widget>[
          ElevatedButton(onPressed: checkToken, child: Text("get request")),
          Text(text),
        ]),
      ),
    );
  }
}
