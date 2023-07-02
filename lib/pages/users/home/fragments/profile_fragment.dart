import 'package:e_book_hub/models/users/user_details_model.dart';
import 'package:e_book_hub/services/api_services.dart';
import 'package:e_book_hub/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileFragment extends StatefulWidget {
  const ProfileFragment({Key? key}) : super(key: key);

  @override
  State<ProfileFragment> createState() => _ProfileFragmentState();
}

class _ProfileFragmentState extends State<ProfileFragment> {
  String sUserid = "";
  UserDetailsModel userDetailsModel = UserDetailsModel();
  bool isDataLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    checkLogin();
  }

  void checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sUserid = prefs.getString('id')!;
    getUserDetails(sUserid);
  }

  void getUserDetails(String sUserid) async {
    APIServices.getUserDetails(sUserid).then((value) {
      userDetailsModel = value;
      setState(() {
        isDataLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return !isDataLoaded
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UserDetails(userDetailsModel: userDetailsModel),
              const Divider(
                thickness: 2, // thickness of the line
                indent: 20, // empty space to the leading edge of divider.
                endIndent:
                    20, // empty space to the trailing edge of the divider.
                color:
                    Colors.black45, // The color to use when painting the line.
                height: 20, // The divider's height extent.
              ),
              ContactDetails(userDetailsModel: userDetailsModel),
              const SizedBox(height: 10),
              CardView(userDetailsModel: userDetailsModel),
            ],
          );
  }
}

class UserDetails extends StatelessWidget {
  final UserDetailsModel userDetailsModel;
  const UserDetails({Key? key, required this.userDetailsModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage('assets/images/profile.jpg'),
                  fit: BoxFit.fill),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              userDetailsModel.userDetails!.name!,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class ContactDetails extends StatelessWidget {
  final UserDetailsModel userDetailsModel;
  const ContactDetails({Key? key, required this.userDetailsModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Email: ${userDetailsModel.userDetails!.email!}",
                style: const TextStyle(fontSize: 16),
              )),
          const SizedBox(height: 10),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Mobile Number: ${userDetailsModel.userDetails!.mobile!}",
                style: const TextStyle(fontSize: 16),
              )),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class CardView extends StatelessWidget {
  final UserDetailsModel userDetailsModel;
  const CardView({Key? key, required this.userDetailsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20.0),
      elevation: 3,
      child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(100)),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {},
                  child: const MenuItems(
                title: "Edit Profile",
                icon: Icons.edit,
              )),
              const SizedBox(
                height: 7,
              ),
              GestureDetector(
                onTap: () {},
                child: const MenuItems(
                  title: "Setting",
                  icon: Icons.settings,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              GestureDetector(
                onTap: () {},
                child: const MenuItems(
                  title: "My Uploads",
                  icon: Icons.upload,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              GestureDetector(
                onTap: () {},
                child: const MenuItems(
                  title: "Information",
                  icon: Icons.info_rounded,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              GestureDetector(
                onTap: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.remove('id');
                  prefs.remove('name');
                  prefs.remove('email');
                  Navigator.pushNamedAndRemoveUntil(context, MyRoutes.loginPage, (route) => false,);
                },
                child: const MenuItems(
                  title: "Log Out",
                  icon: Icons.logout,
                ),
              ),
            ],
          )),
    );
  }
}

class MenuItems extends StatelessWidget {
  final IconData icon;
  final String title;
  const MenuItems({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          Icon(
            icon,
            size: 40,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ]),
        const Align(
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.chevron_right,
            size: 30,
          ),
        )
      ],
    );
  }
}
