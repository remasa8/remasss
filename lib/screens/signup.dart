import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/register_provider.dart';

import '../widgets/custum_.dart';
import 'login.dart';

class Signup extends StatelessWidget {

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController name = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<RigisterProvider>(context , listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up"),
        centerTitle: true,
      ),
      body: Form(
        key:formkey ,
        child: Column(
          children: [
            WedgitScreen(
                textInputType: TextInputType.emailAddress,
                controller: email,
                icon: Icon(Icons.email),
                label: "Email"),

            SizedBox(height: 16,),

            WedgitScreen(textInputType: TextInputType.text,
              controller: pass,
              icon: Icon(Icons.password),
              label: "Password" ,
              obscure: true,),

            SizedBox(height: 16,),

            WedgitScreen(textInputType: TextInputType.phone,
                controller: phone,
                icon: Icon(Icons.phone),
                label: "Phone"),

            SizedBox(height: 16,)
            ,
            WedgitScreen(textInputType: TextInputType.text,
                controller: name,
                icon: Icon(Icons.person),
                label: "Name" ),

            SizedBox(height: 16,),

            TextButton(onPressed: () async
            {
              if(formkey.currentState!.validate())
              {
                await pro.getdatasignup(email: email.text,
                    password: pass.text,
                    name: name.text,
                    phone: phone.text);
              }
              if(pro.rigistermodel?.status == true)
              {
                print(pro.rigistermodel?.message);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Login(),));
              }
            }, child: Text("Sign Up")),
            TextButton(onPressed: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
            }, child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
