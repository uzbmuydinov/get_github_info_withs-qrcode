/*
import 'package:flutter/material.dart';
import 'package:get_github_info/models/user_model.dart';
import 'package:get_github_info/services/http_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
static final String id="home_page";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  List<User> list = [];
  User user = User(id: 1);

  void _apiLoadUser() async {
    setState(() {
      isLoading = true;
    });
    var users = await Network.GET(Network.API_USER, {});

    if (users != null) {
      setState(() {
        print(users);

        user = Network.parseUser(users);

        isLoading = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiLoadUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get github info"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blueGrey,
      ),

        // isLoading?Center(child: CircularProgressIndicator.adaptive(),
        // ):
      body: SingleChildScrollView(

        child: Column(

           children: [
             Container(
               height: MediaQuery.of(context).size.height,
               width: MediaQuery.of(context).size.width,
               color: Colors.orangeAccent,
               child: Column(
                 children: [
                   // user info
                   */
/*ClipRRect(
                     borderRadius: BorderRadius.circular(80),
                     child: Image.network(,
                     height: 80,
                       width: 80,
                       fit: BoxFit.cover,
                     ),

                   ),*/ /*

                   SizedBox(height: 20),
                   Text(user.name!,
                   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                   )
                 ],
               ),


             )
           ],
        ),
      )
    );
  }
}
*/

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_github_info/models/user_model.dart';
import 'package:get_github_info/services/http_service.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = 'home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user;
  bool isLoading = false;

  void _getUser() async {
    setState(() {
      isLoading = true;
    });
    await Network.getHttp(Network.apiGet, Network.paramsEmpty()).then((value) {
      _getResponse(userFromJson(value));
    });
  }

  void _getResponse(User _user) {
    setState(() {
      isLoading = false;
      user = _user;
      print(user!.name);
    });
  }

  @override
  void initState() {
    _getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !isLoading && user != null
          ? SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  user!.avatarUrl == null
                      ? const CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('assets/images/user.png'),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(80),
                          child: CachedNetworkImage(
                            height: 80,
                            width: 80,
                            imageUrl: user!.avatarUrl!,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(
                              strokeWidth: 3,
                              color: Color.fromRGBO(193, 53, 132, 1),
                            ),
                          ),
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    user!.name!,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Username:  ${user!.name!}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Repositories:  ${user!.publicRepos!}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Followers:  ${user!.followers!}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Followings:  ${user!.following!}',
                          style: const TextStyle(fontSize: 16),
                        ),


                      ],
                    ),
                  ),
                  SizedBox(height: 50,),
                  Container(
                    child: PrettyQr(
                      data: "Mo'minjon",
                      size: 200,
                      elementColor: Colors.blueGrey,
                      roundEdges: false,
                      typeNumber: 4,
                      image: NetworkImage('https://yt3.ggpht.com/ytc/AKedOLS5N9lNZtr7TBqf1TWWWoAWyA81gW7azirGAAIX=s900-c-k-c0x00ffffff-no-rj'),
                    ),
                  )
                ],

              ),
            )
          : SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
    );
  }
}
