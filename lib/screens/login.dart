import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Screens/Signup.dart';
import '../providers/register_provider.dart';
import '../widgets/custum_.dart';
import 'homepage.dart';

class Login extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  GlobalKey<FormState> formkeys = GlobalKey<FormState>();
//werrr
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<RigisterProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up"),
        centerTitle: true,
      ),
      body: Form(
        key: formkeys,
        child: Column(
          children: [

            ClipOval(
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/7/78/Image.jpg',
                width: 100.0,
                height: 100.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),

            WedgitScreen(
              textInputType: TextInputType.emailAddress,
              controller: email,
              icon: Icon(Icons.email),
              label: "Email",
            ),

            SizedBox(height: 16),

            WedgitScreen(
              textInputType: TextInputType.text,
              controller: pass,
              icon: Icon(Icons.password),
              label: "Password",
              obscure: true,
            ),

            SizedBox(height: 16),

            TextButton(
              onPressed: () async {
                if (formkeys.currentState!.validate()) {
                  await pro.getdatalogin(email: email.text, password: pass.text);
                }
                if (pro.rigistermodel?.status == true) {
                  print(pro.rigistermodel?.message);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                }
              },
              child: Text("Login"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Signup()),
                );
              },
              child: Text("Sign up"),
            ),
          ],
        ),
      ),
    );
  }
}