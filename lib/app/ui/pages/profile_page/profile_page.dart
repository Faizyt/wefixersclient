import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wefixers/app/ui/utils/colorconst.dart';
import '../../../controllers/profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        backgroundColor: ColorConst.primaryColor,
        body: SingleChildScrollView(
          child: FutureBuilder(
            future: controller.userDetails(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(() => controller.checkUser.value?.name != null
                          ? Text(
                              controller.checkUser.value!.name.toString(),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : const CircularProgressIndicator()),
                      Center(
                        child: FutureBuilder(
                          future: controller.userImage("${snapshot.data!.$id}"),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return CircleAvatar(
                                radius: 60,
                                backgroundImage: MemoryImage(snapshot.data!),
                              );
                            }
                            return const CircularProgressIndicator();
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        snapshot.data!.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        snapshot.data!.email.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ElevatedButton(
                          onPressed: () {
                            _showBottomSheet(context, snapshot);
                          },
                          child: const Text('Edit Profile'),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return changePassword(
                                      context, snapshot.data!.$id.toString());
                                });
                          },
                          child: const Text('Change Password'),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Reports'),
                        ),
                      ),
                    ]);
              }
              return const CircularProgressIndicator();
            },
          ),
        ));
  }

  AlertDialog changePassword(BuildContext context, String id) {
    return AlertDialog(
      title: const Text("Update Your Password"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            obscureText: true,
            controller: controller.passwordController,
            decoration: InputDecoration(
              hintText: 'Enter Old Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    10.0), // Add rounded corners to the border
              ),
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 10.0), // Add padding to the text field
              filled: true, // Add a background color to the text field
              fillColor: Colors
                  .grey[200], // Set the background color of the text field
              hintStyle: TextStyle(
                color: Colors.grey[500], // Change the hint text color
                fontSize: 16.0, // Change the hint text font size
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            obscureText: true,
            controller: controller.newPasswordController,
            decoration: InputDecoration(
              hintText: 'Enter New Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    10.0), // Add rounded corners to the border
              ),
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 10.0), // Add padding to the text field
              filled: true, // Add a background color to the text field
              fillColor: Colors
                  .grey[200], // Set the background color of the text field
              hintStyle: TextStyle(
                color: Colors.grey[500], // Change the hint text color
                fontSize: 16.0, // Change the hint text font size
              ),
            ),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel")),
        ElevatedButton(
            onPressed: () {
              controller.updateUserPassword(
                controller.passwordController.text,
                id,
                controller.newPasswordController.text,
              );
              Navigator.pop(context);
            },
            child: const Text("Update")),
      ],
    );
  }

  PersistentBottomSheetController<dynamic> _showBottomSheet(
      BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    return showBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 300,
            color: Colors.amber,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('Edit Your Profile'),
                  const SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                      child: const Text('Update User Name'),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Update User Name'),
                                content: TextField(
                                  controller: controller.nameController,
                                  decoration: InputDecoration(
                                    hintText: 'Enter New Name',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          10.0), // Add rounded corners to the border
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 15.0,
                                        horizontal:
                                            10.0), // Add padding to the text field
                                    filled:
                                        true, // Add a background color to the text field
                                    fillColor: Colors.grey[
                                        200], // Set the background color of the text field
                                    hintStyle: TextStyle(
                                      color: Colors.grey[
                                          500], // Change the hint text color
                                      fontSize:
                                          16.0, // Change the hint text font size
                                    ),
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Cancel")),
                                  ElevatedButton(
                                      onPressed: () {
                                        controller.updateUserName(
                                            controller.nameController.text
                                                .toString(),
                                            snapshot.data!.$id.toString());

                                        Navigator.pop(context);
                                      },
                                      child: const Text('Update')),
                                ],
                              );
                            });
                      }),
                  ElevatedButton(
                    child: const Text('Update E-Mail'),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Update E-Mail'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    controller: controller.emailController,
                                    decoration: InputDecoration(
                                      hintText: 'Enter New E-Mail',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            10.0), // Add rounded corners to the border
                                      ),
                                      contentPadding: const EdgeInsets
                                          .symmetric(
                                          vertical: 15.0,
                                          horizontal:
                                              10.0), // Add padding to the text field
                                      filled:
                                          true, // Add a background color to the text field
                                      fillColor: Colors.grey[
                                          200], // Set the background color of the text field
                                      hintStyle: TextStyle(
                                        color: Colors.grey[
                                            500], // Change the hint text color
                                        fontSize:
                                            16.0, // Change the hint text font size
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextField(
                                    controller: controller.passwordController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      hintText: 'Enter Your Password',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            10.0), // Add rounded corners to the border
                                      ),
                                      contentPadding: const EdgeInsets
                                          .symmetric(
                                          vertical: 15.0,
                                          horizontal:
                                              10.0), // Add padding to the text field
                                      filled:
                                          true, // Add a background color to the text field
                                      fillColor: Colors.grey[
                                          200], // Set the background color of the text field
                                      hintStyle: TextStyle(
                                        color: Colors.grey[
                                            500], // Change the hint text color
                                        fontSize:
                                            16.0, // Change the hint text font size
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Cancel')),
                                ElevatedButton(
                                    onPressed: () {
                                      controller.updateUserEmail(
                                          controller.emailController.text
                                              .toString(),
                                          snapshot.data!.$id.toString(),
                                          controller.passwordController.text
                                              .toString());
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Update')),
                              ],
                            );
                          });
                    },
                  ),
                  // ElevatedButton for updating user phone
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Update User Phone'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    controller: controller.phoneController,
                                    decoration: InputDecoration(
                                      hintText: 'Enter New Phone',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            10.0), // Add rounded corners to the border
                                      ),
                                      contentPadding: const EdgeInsets
                                          .symmetric(
                                          vertical: 15.0,
                                          horizontal:
                                              10.0), // Add padding to the text field
                                      filled:
                                          true, // Add a background color to the text field
                                      fillColor: Colors.grey[
                                          200], // Set the background color of the text field
                                      hintStyle: TextStyle(
                                        color: Colors.grey[
                                            500], // Change the hint text color
                                        fontSize:
                                            16.0, // Change the hint text font size
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextField(
                                    obscureText: true,
                                    controller: controller.passwordController,
                                    decoration: InputDecoration(
                                      hintText: 'Enter The Password',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            10.0), // Add rounded corners to the border
                                      ),
                                      contentPadding: const EdgeInsets
                                          .symmetric(
                                          vertical: 15.0,
                                          horizontal:
                                              10.0), // Add padding to the text field
                                      filled:
                                          true, // Add a background color to the text field
                                      fillColor: Colors.grey[
                                          200], // Set the background color of the text field
                                      hintStyle: TextStyle(
                                        color: Colors.grey[
                                            500], // Change the hint text color
                                        fontSize:
                                            16.0, // Change the hint text font size
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Cancel")),
                                ElevatedButton(
                                  onPressed: () {
                                    controller.updateUserPhone(
                                        controller.phoneController.text
                                            .toString(),
                                        snapshot.data!.$id.toString(),
                                        controller.passwordController.text
                                            .toString());
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Update"),
                                )
                              ],
                            );
                          });
                    },
                    child: const Text('Update Phone Number'),
                  ),

                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close))
                ],
              ),
            ),
          );
        });
  }
}
