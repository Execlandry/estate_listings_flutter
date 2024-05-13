import 'package:estate_listings/data/response/status.dart';
import 'package:estate_listings/res/components/general_exceptions_widget.dart';
import 'package:estate_listings/res/components/internet_exceptions_widget.dart';
import 'package:estate_listings/res/routes/routes_name.dart';
// import 'package:estate_listings/res/routes/routes_name.dart';
import 'package:estate_listings/view_models/controller/home/home_view_model.dart';
import 'package:estate_listings/view_models/controller/user_preference/user_preference.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    homeController.userApi();
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
              return GeneralExceptionsWidget(onPress: () {
                homeController.refreshApi();
              });
            }

          case Status.COMPLETED:
            return Center(
              child: ListView.builder(
                  itemCount: homeController.userList.value.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        // leading: CircleAvatar(
                        //   backgroundImage: NetworkImage(homeController
                        //       .userList.value.data![index].avatar
                        //       .toString()),
                        // ),
                        title: Text(homeController
                            .userList.value.data![index].name
                            .toString()),
                        subtitle: Text(homeController
                            .userList.value.data![index].email
                            .toString()),
                      ),
                    );
                  }),
            );
        }
      }),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                userPreference.removeUser().then((value) {
                  Get.toNamed(RouteName.loginView);
                });
              },
              icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}
