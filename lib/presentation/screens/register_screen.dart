import 'package:flutter/material.dart';
import 'package:avaliacao_individual/auth/login.dart';
import 'package:logging/logging.dart';

import '../../services/functions/auth_functions.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final log = Logger("Register Screen Class");
  final _formKey = GlobalKey<FormState>();
  bool _isPrivate = true;

  late TextEditingController userNameController;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmationController;

  late String userName;
  late String fullName;
  late String email;
  late String password;
  late String passwordConfirmation;

  //optional
  late TextEditingController privacyController;
  late TextEditingController phoneController;
  late TextEditingController cellPhoneController;
  late TextEditingController occupationController;
  late TextEditingController workPlaceController;
  late TextEditingController addressController;
  late TextEditingController complementaryAddressController;

  late String phone;
  late String cellPhone;
  late String occupation;
  late String workPlace;
  late String address;
  late String complementaryAddress;

  late bool register;

  @override
  void initState() {
    userNameController = TextEditingController();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordConfirmationController = TextEditingController();
    //optional
    privacyController = TextEditingController();
    phoneController = TextEditingController();
    cellPhoneController = TextEditingController();
    occupationController = TextEditingController();
    workPlaceController = TextEditingController();
    addressController = TextEditingController();
    complementaryAddressController = TextEditingController();

    register = false;

    //getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Registration Page'),
        ),
        body: Form(
            key: _formKey,
            child: DraggableScrollableSheet(
                initialChildSize: 0.9,
                minChildSize: 0.4,
                maxChildSize: 1.0,
                builder: (context, scrollController) {
                  return SingleChildScrollView(
                    controller: scrollController,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            ///Image
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: Image.network(
                                'https://cdn-icons-png.flaticon.com/512/3456/3456388.png'),
                          ),
                          Container(
                            ///User Name
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                            width: 400,
                            child: TextFormField(
                              key: const ValueKey('userName'),
                              maxLength: 50,
                              controller: userNameController,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                counterText: "",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(90.0),
                                ),
                                labelText: 'User Name',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter User Name';
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                setState(() {
                                  userName = value!;
                                });
                              },
                            ),
                          ),
                          Container(
                            ///Full Name
                            padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                            width: 400,
                            child: TextFormField(
                              key: const ValueKey('fullName'),
                              maxLength: 50,
                              controller: nameController,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                counterText: "",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(90.0),
                                ),
                                labelText: 'Full Name',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter full name';
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                setState(() {
                                  fullName = value!;
                                });
                              },
                            ),
                          ),
                          Container(
                            ///Email
                            padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                            width: 400,
                            child: TextFormField(
                              key: const ValueKey('email'),
                              maxLength: 50,
                              controller: emailController,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                counterText: "",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(90.0),
                                ),
                                labelText: 'Email (<string>@<string>.<dom>)',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter email';
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                setState(() {
                                  email = value!;
                                });
                              },
                            ),
                          ),
                          Container(
                            /// Password
                            padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                            width: 400,
                            child: TextFormField(
                              key: const ValueKey('Password'),
                              maxLength: 20,
                              obscureText: true,
                              controller: passwordController,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(90.0),
                                ),
                                labelText: 'Password',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter password';
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                setState(() {
                                  password = value!;
                                });
                              },
                            ),
                          ),
                          Container(
                            /// Password Confirmation
                            padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                            width: 400,
                            child: TextFormField(
                              key: const ValueKey('passwordConfirmation'),
                              maxLength: 20,
                              obscureText: true,
                              controller: passwordConfirmationController,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(90.0),
                                ),
                                labelText: 'Password Confirmation',
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter password';
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                setState(() {
                                  passwordConfirmation = value!;
                                });
                              },
                            ),
                          ),

                          ///----------Optional properties of the new User----------
                          Container(
                            ///Optional text divider
                            padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                            color: Colors.blueAccent,
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Optional',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            ///Privacy
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              const Text('Public',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Transform.scale(
                                scale: 1.5,
                                child: Switch(
                                  value: _isPrivate,
                                  onChanged: (value) {
                                    setState(() {
                                      _isPrivate = value;
                                    });
                                  },
                                  activeColor: Colors.blue,
                                ),
                              ),
                              const Text('Private',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                          Container(
                            ///Phone
                            padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                            width: 400,
                            child: TextFormField(
                              key: const ValueKey('phone'),
                              maxLength: 50,
                              controller: phoneController,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                counterText: "",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(90.0),
                                ),
                                labelText: 'Phone',
                              ),
                              onSaved: (value) {
                                setState(() {
                                  phone = value!;
                                });
                              },
                            ),
                          ),
                          Container(
                            ///Cell Phone
                            padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                            width: 400,
                            child: TextFormField(
                              key: const ValueKey('cellPhone'),
                              maxLength: 50,
                              controller: cellPhoneController,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                counterText: "",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(90.0),
                                ),
                                labelText: 'Cell Phone',
                              ),
                              onSaved: (value) {
                                setState(() {
                                  cellPhone = value!;
                                });
                              },
                            ),
                          ),
                          Container(
                            ///Occupation
                            padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                            width: 400,
                            child: TextFormField(
                              key: const ValueKey('occupation'),
                              maxLength: 50,
                              controller: occupationController,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                counterText: "",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(90.0),
                                ),
                                labelText: 'Occupation',
                              ),
                              onSaved: (value) {
                                setState(() {
                                  occupation = value!;
                                });
                              },
                            ),
                          ),
                          Container(
                            ///Work Place
                            padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                            width: 400,
                            child: TextFormField(
                              key: const ValueKey('workPlace'),
                              maxLength: 50,
                              controller: workPlaceController,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                counterText: "",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(90.0),
                                ),
                                labelText: 'Work Place',
                              ),
                              onSaved: (value) {
                                setState(() {
                                  workPlace = value!;
                                });
                              },
                            ),
                          ),
                          Container(
                            ///Address
                            padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                            width: 400,
                            child: TextFormField(
                              key: const ValueKey('address'),
                              maxLength: 50,
                              controller: addressController,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                counterText: "",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(90.0),
                                ),
                                labelText: 'Address',
                              ),
                              onSaved: (value) {
                                setState(() {
                                  address = value!;
                                });
                              },
                            ),
                          ),
                          Container(
                            ///Complementary Address
                            padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                            width: 400,
                            child: TextFormField(
                              key: const ValueKey('complAddress'),
                              maxLength: 50,
                              controller: complementaryAddressController,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                counterText: "",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(90.0),
                                ),
                                labelText: 'Complementary Address',
                              ),
                              onSaved: (value) {
                                setState(() {
                                  complementaryAddress = value!;
                                });
                              },
                            ),
                          ),
                          Container(
                            ///Go to Login Button
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueGrey,
                              ),
                              child: const Text('Go back to Login Page'),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()));
                              },
                            ),
                          ),
                          Container(
                            /// Register Button
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),

                            width: 300,
                            height: 80,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightGreen,
                                ),
                                child: const Text('Register'),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    Future<int> res = AuthServices.signupUser(
                                        password,
                                        email,
                                        fullName,
                                        userName,
                                        phone,
                                        cellPhone,
                                        occupation,
                                        workPlace,
                                        address,
                                        complementaryAddress,
                                        _isPrivate,
                                        context);
                                    if (res.toString() == 1.toString()) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen()),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Container(
                                            padding: const EdgeInsets.all(16),
                                            height: 90,
                                            decoration: const BoxDecoration(
                                              color: Colors.indigo,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                            ),
                                            child: Row(
                                              children: [
                                                const SizedBox(width: 48),
                                                Expanded(
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: const [
                                                        Text(
                                                          'Oh Oh!',
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        Text(
                                                          "Something went wrong,"
                                                              " try again :)",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.white),
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ]),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                  }
                                  /*nameController.text,
                              userNameController.text,
                              emailController.text,
                              passwordController.text,
                              passwordConfirmationController.text,
                              privacyController.text as bool,
                              phoneController.text,
                              cellPhoneController.text,
                              occupationController.text,
                              workPlaceController.text,
                              addressController.text,
                              complementaryAddressController.text*/
                                }),
                          ),
                        ],
                      ),
                    ),
                  );
                })));
  }
}
