import 'package:durood_together_app/Shared/Const/constant.dart';
import 'package:flutter/material.dart';

class SignupFormContainer extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const SignupFormContainer({
    Key key,
    this.emailController,
    this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Email Container
        Container(
          //width: 50.0.w,
          child: TextFormField(
            controller: emailController,
            validator: (input) {
              if (input.isEmpty) return 'Please Enter Email.';
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Constant.app_primary_color,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.5,
                  color: Constant.app_primary_contrast_color_light,
                ),
                borderRadius: BorderRadius.circular(
                    Constant.app_text_fields_border_radius),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.5,
                  color: Constant.app_primary_contrast_color_light,
                ),
                borderRadius: BorderRadius.circular(40.0),
              ),
              labelText: 'Enter Your Email',
              floatingLabelStyle: TextStyle(
                color: Constant.app_primary_contrast_color,
                fontSize: Constant.h4,
              ),
              prefixIcon: Icon(
                Icons.email,
                color: Constant.app_primary_contrast_color.withOpacity(0.8),
              ),
            ),
            // onSaved: (input) => _email = input,
          ),
        ),

        // Password Container
        Padding(
          padding: const EdgeInsets.only(
            top: 20.0,
            // right: 20.0,
            // left: 20.0,
          ),
          child: Container(
            child: TextFormField(
              controller: passwordController,
              validator: (input) {
                if (input.isEmpty) return 'Please Enter Minimum 6 Characters.';
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Constant.app_primary_color,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.5,
                    color: Constant.app_primary_contrast_color_light,
                  ),
                  borderRadius: BorderRadius.circular(
                      Constant.app_text_fields_border_radius),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.5,
                    color: Constant.app_primary_contrast_color_light,
                  ),
                  borderRadius: BorderRadius.circular(40.0),
                ),
                labelText: 'Enter Your Password',
                floatingLabelStyle: TextStyle(
                  color: Constant.app_primary_contrast_color,
                  fontSize: Constant.h4,
                ),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Constant.app_primary_contrast_color.withOpacity(0.8),
                ),
              ),
              obscureText: true,
              // onSaved: (input) => _password = input,
            ),
          ),
        ),

        // Forgot Password Container
        // Padding(
        //   padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     children: [
        //       Container(
        //         child: InkWell(
        //           child: Text(
        //             "Forgot Password?",
        //             style: TextStyle(
        //               color: Constant.app_primary_contrast_color_light,
        //               fontSize: Constant.h7,
        //               fontWeight: Constant.app_font_weight,
        //               letterSpacing: Constant.app_normal_letter_spacing,
        //             ),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),

        // Login Elevated Button
        // Padding(
        //   padding: const EdgeInsets.only(
        //     top: 10.0,
        //   ),
        //   child: Row(
        //     mainAxisAlignment:
        //         MainAxisAlignment.spaceEvenly,
        //     children: [
        //       ElevatedButton(
        //         onPressed: () {
        //           if (this
        //                   .emailController
        //                   .text
        //                   .isEmpty ||
        //               this.emailController.text ==
        //                   '' ||
        //               this
        //                   .passwordController
        //                   .text
        //                   .isEmpty ||
        //               this.passwordController.text ==
        //                   '') {
        //             final snackBar = SnackBar(
        //               padding: EdgeInsets.symmetric(
        //                 horizontal: 10.0,
        //                 vertical: 30.0,
        //               ),
        //               backgroundColor: Constant
        //                   .app_primary_contrast_color
        //                   .withOpacity(0.7),
        //               content: CustomSnackbar(
        //                 text: 'Please Enter Details',
        //               ),
        //             );
        //             ScaffoldMessenger.of(context)
        //                 .showSnackBar(snackBar);
        //           } else {
        //             setState(() {
        //               this.isLoginPressed =
        //                   !this.isLoginPressed;
        //             });
        //
        //             context
        //                 .read<Authentication>()
        //                 .signIn(
        //                   email: emailController.text
        //                       .trim(),
        //                   password: passwordController
        //                       .text
        //                       .trim(),
        //                 );
        //           }
        //         },
        //         child: !this.isLoginPressed
        //             ? Text(
        //                 'Login',
        //                 style: TextStyle(
        //                   fontSize: Constant
        //                       .app_button_font_size,
        //                   fontWeight: Constant
        //                       .app_font_weight,
        //                   color: Constant
        //                       .app_primary_color,
        //                   letterSpacing: Constant
        //                       .app_normal_letter_spacing,
        //                 ),
        //               )
        //             : CircularProgressIndicator(
        //                 color: Constant
        //                     .app_primary_color,
        //               ),
        //         style: ButtonStyle(
        //           backgroundColor:
        //               MaterialStateProperty.all<
        //                   Color>(
        //             Constant
        //                 .app_primary_contrast_color
        //                 .withOpacity(0.9),
        //           ),
        //           minimumSize:
        //               MaterialStateProperty.all<Size>(
        //             Size(
        //                 Constant.app_button_min_width,
        //                 Constant.app_button_height),
        //           ),
        //           maximumSize:
        //               MaterialStateProperty.all<Size>(
        //             Size(
        //                 Constant.app_button_max_width,
        //                 Constant.app_button_height),
        //           ),
        //           shape: MaterialStateProperty.all(
        //             RoundedRectangleBorder(
        //               borderRadius:
        //                   BorderRadius.circular(
        //                 Constant
        //                     .app_button_border_radius,
        //               ),
        //             ),
        //           ),
        //         ),
        //         autofocus: false,
        //       ),
        //
        //       // Register Elevated Button
        //       // ElevatedButton(
        //       //   onPressed: () async {
        //       //     country = context
        //       //                 .read<
        //       //                     LocationService>()
        //       //                 .userAddress
        //       //                 .length >
        //       //             0
        //       //         ? context
        //       //             .read<LocationService>()
        //       //             .userAddress[0]
        //       //             .country
        //       //             .toString()
        //       //         : '';
        //       //     city = context
        //       //                 .read<
        //       //                     LocationService>()
        //       //                 .userAddress
        //       //                 .length >
        //       //             0
        //       //         ? context
        //       //             .read<LocationService>()
        //       //             .userAddress[0]
        //       //             .locality
        //       //             .toString()
        //       //         : '';
        //       //
        //       //     print(country);
        //       //     print(city);
        //       //
        //       //     result = await context
        //       //         .read<Authentication>()
        //       //         .signUp(
        //       //           email: emailController.text
        //       //               .trim(),
        //       //           password: passwordController
        //       //               .text
        //       //               .trim(),
        //       //           country: country,
        //       //           city: city,
        //       //         );
        //       //
        //       //     print(result);
        //       //     emailController.clear();
        //       //     passwordController.clear();
        //       //   },
        //       //   child: Text(
        //       //     'Register',
        //       //     style: TextStyle(
        //       //       fontSize: 20.0,
        //       //       fontWeight: FontWeight.w600,
        //       //       color: Constant.app_primary_color,
        //       //       letterSpacing: 2.0,
        //       //     ),
        //       //   ),
        //       //   style: ButtonStyle(
        //       //     backgroundColor:
        //       //         MaterialStateProperty.all<
        //       //             Color>(
        //       //       Constant.app_primary_contrast_color
        //       //           .withOpacity(0.9),
        //       //     ),
        //       //     minimumSize: MaterialStateProperty
        //       //         .all<Size>(
        //       //       Size(150, 50),
        //       //     ),
        //       //     shape: MaterialStateProperty.all(
        //       //       RoundedRectangleBorder(
        //       //           borderRadius:
        //       //               BorderRadius.circular(
        //       //                   20.0)),
        //       //     ),
        //       //   ),
        //       // ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
