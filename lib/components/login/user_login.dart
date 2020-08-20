import 'package:flutter/material.dart';
import 'package:food_app/database/tables/tbl_user.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool _autoValidate = false;
  bool _obscureText = true;
  bool isLoading = false;
  Icon _icon = Icon(Icons.visibility_off);

  String errorEmail = 'Invalid Email', errorPassword = 'Invalid Password';

  void _toggle(){
    setState(() {
      _obscureText = !_obscureText;
      _icon = _obscureText ? Icon(Icons.visibility_off) : Icon(Icons.visibility);
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final TblUsers userInstance = TblUsers.usersInstance;

  Future getUser(email, pass) async{
    var user = await userInstance.getSpecific(email, pass);
    print(user[0]['id']);
    if (user.isEmpty)
      {
        _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('No User Found!')));
        setState(() {
          isLoading = false;
        });
      }
    else{
      isLoading = false;
      Navigator.pushReplacementNamed(context, '/r', arguments: {
        'id' : user[0]['id'],
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 2,
              child: Container(
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://image.freepik.com/free-photo/hands-holding-burger-yellow-background_23-2148258479.jpg'
                      ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        child: Container(
                          margin: EdgeInsets.only(top: 180),
                          child: Center(
                            child: Text(
                                'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Ubuntu',
                              ),
                            ),
                          ),
                        ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: isLoading ?
              Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.yellow[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
                ),)
                  :Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300],
                          blurRadius: 20,
                          offset: Offset(0,10),
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      autovalidate: _autoValidate,
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[100]))
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Enter Email",
                                  labelStyle: TextStyle(
                                    color: Colors.grey[400],
                                  ),
                                ),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
                                onFieldSubmitted: (value){
                                  FocusScope.of(context).nextFocus();
                                },
                                validator: (value){
                                  if( value.isEmpty || !value.contains('@'))
                                  {
                                    return errorEmail;
                                  }
                                  return null;
                                },
                                controller: email,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        labelText: "Enter Password",
                                        labelStyle: TextStyle(
                                          color: Colors.grey[400],
                                        ),
                                      ),
                                      obscureText: _obscureText,
                                      textInputAction: TextInputAction.done,
                                      keyboardType: TextInputType.visiblePassword,
                                      onFieldSubmitted: (value){
                                        FocusScope.of(context).unfocus();
                                      },
                                      controller: password,
                                      validator: (value){
                                        if (value.isEmpty || value.length <= 0)
                                        {
                                          return errorPassword;
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Positioned(
                                    right: 5,
                                    child: IconButton(
                                      icon: _icon,
                                      onPressed: _toggle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          colors: [
                            Colors.yellow[300],
                            Colors.red[200],
                          ],
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.yellow[100],
                        onTap: () {
                          setState(() {
                            if(_formKey.currentState.validate())
                            {
                              isLoading = true;
                              _formKey.currentState.save();
                              getUser(email.text, password.text);
                            }else{
                              isLoading = false;
                              _autoValidate = true;
                            }
                          });
                        },
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
