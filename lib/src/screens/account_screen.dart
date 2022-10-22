import 'package:flutter/material.dart';

class AccountSrceen extends StatefulWidget {
  const AccountSrceen({Key? key}) : super(key: key);

  @override
  State<AccountSrceen> createState() => _AccountSrceenState();
}

class _AccountSrceenState extends State<AccountSrceen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appbar,
        body: body,
        //bottomNavigationBar: bottomNavigationBar,
        backgroundColor: const Color.fromARGB(255, 199, 199, 198),
      ),
    );
  }
  final appbar = AppBar(
    title: const Text('Account'),
    //backgroundColor: Colors.white,
  );

  Widget get body {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    height: 60,
                    width: 70,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image:
                          AssetImage('assets/image/profile.jpg'),
                          fit: BoxFit.cover,
                      ),
                      shape: BoxShape.circle,
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      
                    ],
                  ),
                ),
              ]
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          child: Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
            ),
          ),
        ),
        logoutbtn,
      ],
    );
  }
  Widget get logoutbtn {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 10),
        child: Container(
          alignment: Alignment.center,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.grey.withOpacity(0.5),
          ),
          child: const Text('Log Out', style: TextStyle(color: Colors.white)),
        ),
      ),
      onTap: () {
        
      },
    );
  }
}
