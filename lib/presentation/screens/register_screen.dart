import 'package:flutter/material.dart';
import 'package:avaliacao_individual/auth/login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isPrivate = true;

  late TextEditingController userNameController;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmationController;

  //optional
  late TextEditingController privacyController;
  late TextEditingController phoneController;
  late TextEditingController cellPhoneController;
  late TextEditingController occupationController;
  late TextEditingController workPlaceController;
  late TextEditingController addressController;
  late TextEditingController complementaryAddressController;

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

    //getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Registration Page'),
        ),
        body: DraggableScrollableSheet(
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
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Image.network(
                            'https://cdn-icons-png.flaticon.com/512/3456/3456388.png'),
                      ),
                      Container(
                        ///User Name
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        width: 400,
                        child: TextField(
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
                        ),
                      ),
                      Container(
                        ///Full Name
                        padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                        width: 400,
                        child: TextField(
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
                        ),
                      ),
                      Container(
                        ///Email
                        padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                        width: 400,
                        child: TextField(
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
                        ),
                      ),
                      Container(
                        /// Password
                        padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                        width: 400,
                        child: TextField(
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
                        ),
                      ),
                      Container(
                        /// Password Confirmation
                        padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                        width: 400,
                        child: TextField(
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
                        child: TextField(
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
                        ),
                      ),
                      Container(
                        ///Cell Phone
                        padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                        width: 400,
                        child: TextField(
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
                        ),
                      ),
                      Container(
                        ///Occupation
                        padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                        width: 400,
                        child: TextField(
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
                        ),
                      ),
                      Container(
                        ///Work Place
                        padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                        width: 400,
                        child: TextField(
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
                        ),
                      ),
                      Container(
                        ///Address
                        padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                        width: 400,
                        child: TextField(
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
                        ),
                      ),
                      Container(
                        ///Complementary Address
                        padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                        width: 400,
                        child: TextField(
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
                                    builder: (context) => const LoginScreen()));
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
                          onPressed: () => registerButtonPressed(
                              nameController.text,
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
                              complementaryAddressController.text),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }

  registerButtonPressed(
      String userName,
      String fullName,
      String email,
      String password,
      String confirmationPassword,
      bool privacy,
      String phone,
      String cellPhone,
      String occupation,
      String workPlace,
      String address,
      String complementaryAddress) {}
}
