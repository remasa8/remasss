import 'package:dio/dio.dart';


import '../models/register_model.dart';

class RigisterSirvices
{
  static Dio dio = Dio();
  static Future<Rigistermodel>  Getdatalogin({required String email , required String password}) async
  {
    try
    {
      Response response = await dio.post("https://elsewedyteam.runasp.net/api/Login/CheckUser" ,

          data: {
        "email":email,
        "password":password
      });

      if(response.statusCode == 200)
      {
        return Rigistermodel.fromjson(response.data);
      }
      else
      {
        throw ("error");
      }
    }
    catch(e)
    {
      throw Exception(e);
    }
  }

  static Future<Rigistermodel>  Getdatasignup({required String email , required String password , required String name , required String phone}) async
  {
    try
    {
      Response response = await dio.post("https://elsewedyteam.runasp.net/api/Register/AddUser" ,

          data: {
        "email":email,
        "password":password,
        "phone":phone,
        "name":name
      });

      if(response.statusCode == 200)
      {
        return Rigistermodel.fromjson(response.data);
      }
      else
      {
        throw ("error");
      }
    }

    catch(e)
    {
      throw Exception(e);
    }
  }
}