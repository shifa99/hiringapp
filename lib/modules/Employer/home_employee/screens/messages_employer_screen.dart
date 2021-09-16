import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/components/constants.dart';
import 'package:hiring_app/modules/Employee/home/cubit/cubit.dart';
import 'package:hiring_app/modules/Employee/home/cubit/states.dart';
import 'package:hiring_app/modules/Employer/home_employee/chat_screen.dart';
import 'package:hiring_app/modules/Employer/home_employee/cubit/user_chats_cubit/user_chats_cubit.dart';
import 'package:hiring_app/modules/Employer/home_employee/cubit/user_chats_cubit/user_chats_states.dart';
import 'package:hiring_app/modules/logins/login_employer_screen.dart';

class MessagesEmployerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return BlocProvider(
          create: (context) => UserChatsCubit()..getAllusers(),
          child: BlocBuilder<UserChatsCubit, UserChatsStates>(
              builder: (context, state) {
            if (state is UserChatsSuccessstate) {
              var users = UserChatsCubit.get(context);
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: isGuest
                      ? Center(
                          child: Column(
                            children: [
                              SizedBox(height: 50),
                              Image.asset('assets/images/mustLogin.png'),
                              SizedBox(height: 30),
                              Text('you have to login'),
                              SizedBox(height: 30),
                              defaultButton(
                                  text: 'Login',
                                  onPressed: () {
                                    navigateTo(context, EmployerLoginScreen());
                                  }),
                            ],
                          ),
                        )
                      : ListView.builder(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: users.userChatsModel.employees.length,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              navigateTo(context, ChatScreen(users.userChatsModel.employees[index].id));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage: NetworkImage(users.userChatsModel.employees[index].image),
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(users.userChatsModel.employees[index].fullName),
                                        Text('Cairo, Egypt'),
                                      ],
                                    ),
                                    Spacer(),
                                    Text(
                                      '12:50 PM',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
              );
            } else if (state is UserChatsLoadingstate)
              return loadingProgress();
            else
              return Text('Error');
          }),
        );
  }
}
