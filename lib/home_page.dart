import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hello,\nJane Cooper',
                    style: TextStyle(fontSize: 17.0),
                  ),
                  Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/img1.jpg'),
                          fit: BoxFit.cover,
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.0),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
              child: Stack(
                children: [
                  Container(
                    height: 250.0,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 25.0, // soften the shadow
                          //spreadRadius: 5.0, //extend the shadow
                          offset: Offset(
                            5.0, // Move to right horizontally
                            5.0, // Move to bottom Vertically
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: 25.0,
                    left: 20.0,
                    child: Text(
                      'Covid-19\nHealthcare',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    top: 90.0,
                    left: 20.0,
                    child: Text(
                      'Book your next online\nappointments',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Positioned(
                    bottom:20.0,
                    left: 20.0,
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Color(0xff537f77)),
                        foregroundColor: MaterialStateProperty.all(Colors.white),
                      ),
                      child: Text(
                        'See detail',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  //Image.asset('assets/img4.jpg'),
                ],
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
              child: Text(
                'Our Services',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Services(icon: Icons.message,title: 'Consultation',),
                  Services(icon: Icons.house_sharp,title: 'To hospital',),
                  Services(icon: Icons.account_tree_rounded, title: 'Medicines',),
                  Services(icon: Icons.label,title: 'Lab test',),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Reads Health Article',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Color(0xff537f77)),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Article(
                    image: 'assets/images/img2.jpg',
                  ),
                  Article(
                    image: 'assets/images/img3.jpg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Article extends StatelessWidget {
  const Article({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160.0,
      height: 150.0,
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Container(
            width: 160.0,
            height: 150.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Container(
            color: Color(0xffeff5f5),
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Text(
              'Superfoods: Health, benefits, uses, and risk',
              style: TextStyle(
                color: Colors.black,
                fontSize: 11.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class Services extends StatelessWidget {
  const Services({Key? key,required this.icon, required this.title}) : super(key: key);
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(9.0),
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 25.0, // soften the shadow
            // spreadRadius: 5.0, //extend the shadow
            offset: Offset(
              5.0, // Move to right horizontally
              5.0, // Move to bottom Vertically
            ),
          )
        ],
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Icon(icon,color: Color(0xff537f77),size: 35.0,),
          SizedBox(height: 10.0,),
          Text(title,style: TextStyle(fontSize: 10.0),overflow: TextOverflow.ellipsis,)
        ],
      ),
    );
  }
}
