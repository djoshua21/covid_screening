import 'package:flutter/material.dart';
import 'package:haefele_health_app/src/core/constants/office_constants.dart';
import 'package:haefele_health_app/src/core/constants/route_constants.dart';
import 'package:haefele_health_app/src/core/view_models/signup_view_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/services.dart';

enum Places {
  one,
  two,
  three,
}

class SignUpView extends StatelessWidget {
  final GlobalKey<FormState> _form = GlobalKey();
  final _authData = {
    'name': '',
    'email': '',
    'password': '',
    'cellphone': '',
    'code': '',
  };

  void _signup({
    BuildContext context,
    SignUpViewModel model,
  }) {
    if (_form.currentState.validate() && model.currentOffice != null) {
      _form.currentState.save();
      model.handleSignUp(
        ctx: context,
        name: _authData['name'],
        email: _authData['email'],
        password: _authData['password'],
        cellphone: _authData['cellphone'],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (context, model, child) => Scaffold(
        //extendBody: true,
        //resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
            height: deviceSize.height,
            width: deviceSize.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Haefele\nHealth',
                  style: TextStyle(fontSize: 40),
                ),
                Form(
                  key: _form,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 1,
                                  color: Colors.grey,
                                ),
                              ),
                              child: model.image == null
                                  ? Icon(Icons.person)
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(40),
                                      child: Image.file(
                                        model.image,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ),
                                    ),
                            ),
                            // SizedBox(width: 5),
                            PopupMenuButton(
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  child: Text(
                                    'Choose Image',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  )),
                              onSelected: (src) => model.takePicture(src),
                              itemBuilder: (ctx) => [
                                PopupMenuItem(
                                  child: Text('Camera'),
                                  value: ImageSource.camera,
                                ),
                                PopupMenuItem(
                                  child: Text('Gallery'),
                                  value: ImageSource.gallery,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Container(
                          // height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                          padding:
                              EdgeInsets.only(left: 10, right: 10, bottom: 4),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              labelText: 'Name',
                              isDense: true,
                              contentPadding: EdgeInsets.only(bottom: 2),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please Add your Name';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _authData['name'] = value;
                            },
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                          padding:
                              EdgeInsets.only(left: 10, right: 10, bottom: 4),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              isDense: true,
                              contentPadding: EdgeInsets.only(bottom: 2),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter An Email Address';
                              }
                              if (!value.contains('@') ||
                                  !value.contains('.')) {
                                return 'Invalid Email address';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _authData['email'] = value;
                            },
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 2),
                          ),
                          padding:
                              EdgeInsets.only(left: 10, right: 10, bottom: 4),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              isDense: true,
                              contentPadding: EdgeInsets.only(bottom: 2),
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter a password';
                              }
                              if (value.length <= 6) {
                                return 'Password too short';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _authData['password'] = value;
                            },
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                          padding:
                              EdgeInsets.only(left: 10, right: 10, bottom: 4),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              labelText: 'Cellphone Number',
                              isDense: true,
                              contentPadding: EdgeInsets.only(bottom: 2),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter Your Cellphone Number';
                              }
                              if (value.length != 10) {
                                return 'Invalid Cellphone Number';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _authData['cellphone'] = value;
                            },
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                          padding:
                              EdgeInsets.only(left: 10, right: 10, bottom: 4),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Employee Code',
                              isDense: true,
                              contentPadding: EdgeInsets.only(bottom: 2),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Employee code is required';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _authData['name'] = value;
                            },
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 2),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Text('Office:'),
                              SizedBox(width: 10),
                              DropdownButton(
                                  hint: Text('Choose Location',
                                      textAlign: TextAlign.center),
                                  value: model.currentOffice ?? null,
                                  onChanged: (newPlace) {
                                    model.changeOffice(newPlace);
                                  },
                                  items: [
                                    DropdownMenuItem(
                                      value: Offices.johannesburg,
                                      //onTap: () => model.changeOffice(Offices.johannesburg),
                                      child: Text(OfficeConstants.johannesburg),
                                    ),
                                    DropdownMenuItem(
                                      value: Offices.capeTown,
                                      //onTap: () => model.changeOffice(Offices.capeTown),
                                      child: Text(OfficeConstants.capeTown),
                                    ),
                                    DropdownMenuItem(
                                      value: Offices.australia,
                                      //onTap: () => model.changeOffice(Offices.capeTown),
                                      child: Text(OfficeConstants.australia),
                                    ),
                                    DropdownMenuItem(
                                      value: Offices.london,
                                      //onTap: () => model.changeOffice(Offices.capeTown),
                                      child: Text(OfficeConstants.london),
                                    ),
                                  ]),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        model.isBusy
                            ? CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: () =>
                                    //Todo: Add Extra layer of validation by adding a confirm password popup.
                                    _signup(context: context, model: model),
                                child: Text('Sign Up'),
                              ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed(RoutePaths.login);
                            },
                            child: Text('Switch to Login')),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
