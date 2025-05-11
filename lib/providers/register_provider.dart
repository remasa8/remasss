import 'package:flutter/material.dart';

import '../models/register_model.dart';
import '../services/register_service.dart';

class RigisterProvider extends ChangeNotifier
{
  Rigistermodel? rigistermodel;
  Future<void> getdatalogin({required String email , required String password}) async
  {
    rigistermodel = await RigisterSirvices.Getdatalogin(email: email, password: password);
    notifyListeners();
  }
  Future<void> getdatasignup({required String email , required String password , required String name , required String phone}) async
  {
    rigistermodel = await RigisterSirvices.Getdatasignup(email: email, password: password, name: name, phone: phone);
    notifyListeners();
  }
}