import 'package:estate_listings/res/components/general_exceptions_widget.dart';
import 'package:estate_listings/res/components/internet_exceptions_widget.dart';
import 'package:estate_listings/view_models/controller/home/home_view_model.dart';
import 'package:estate_listings/view_models/controller/user_preference/user_preference.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/response/status.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeController = Get.put(HomeViewModel());
  UserPreferences userPreference = UserPreferences();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (homeController.rxRequestStatus.value) {
          case Status.LOADING:
            return Center(
              child: CircularProgressIndicator(),
            );

          case Status.ERROR:
            if (homeController.error.value == 'No Internet:') {
              return InternetExceptionsWidget(onPress: () {
                homeController.refreshApi();
              });
            } else {
              return GeneralExceptionsWidget(onPress: (){
                  homeController.refreshApi();
              });
            }

          case Status.COMPLETED:
            return Center(
              // child: ListView.builder(
              //     itemCount: homeController.userList.value.id!,
              //     itemBuilder: (context, index) {
              //       return Center(
                      child: Text(homeController.userList.value.street.toString())
                      
                        // child: ListTile(
                        //   leading: CircleAvatar(
                        //     backgroundImage: NetworkImage(homeController
                        //         .userList.value.id![index].avatar
                        //         .toString()),
                        //   ),
                        //   title: Text(homeController
                        //       .userList.value.id![index].firstName
                        //       .toString()),
                        //   subtitle: Text(homeController
                        //       .userList.value.id![index].email
                        //       .toString()),
                        // ),
                  //     ),
                  //   );
                  // }),
            );
        }
      }),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         userPreference.removeUser().then((value) {
        //           Get.toNamed(RouteName.loginView);
        //         });
        //       },
        //       icon: Icon(Icons.logout))
        // ],
      ),
    );
  }
}
