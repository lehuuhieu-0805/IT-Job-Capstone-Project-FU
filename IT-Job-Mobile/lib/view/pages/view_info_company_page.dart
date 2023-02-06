import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:it_job_mobile/constants/app_color.dart';

class ViewInfoCompanyPage extends StatefulWidget {
  ViewInfoCompanyPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  State<ViewInfoCompanyPage> createState() => _ViewInfoCompanyPageState();
}

class _ViewInfoCompanyPageState extends State<ViewInfoCompanyPage> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item, fit: BoxFit.cover, width: 1000.0),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            // child: Text(
                            //   'No. ${imgList.indexOf(item)} image',
                            //   style: TextStyle(
                            //     color: Colors.white,
                            //     fontSize: 20.0,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                ),
                items: imageSliders,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'FPT Software',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                  Image.network(
                    'https://dsa.org.vn/wp-content/uploads/2017/11/fpt.png',
                    fit: BoxFit.cover,
                    width: 150,
                    height: 150,
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Giới thiệu về công ty',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'FPT Corporation is a global leading technology and IT services provider headquartered in Vietnam, with nearly US\$\1.3 billion in revenue and 30,000 employees in 26 countries. As a pioneer in digital transformation, FPT delivers world-class services in Smart factory, Digital platforms, RPA, AI, IoT, Enterprise Mobility, Cloud, AR/VR, Business Applications, Application Services, BPO, and so on. The company has served over 700+ customers worldwide, a hundred of which are Fortune Global 500 companies in the industries of Aerospace & Aviation, Automotive, Banking and Finance, Logistics & Transportation, Utilities and more.',
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Vị trí tuyển dụng',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Back-end Developer'),
                          Text('Mobile'),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Java, C#'),
                          Text('Flutter'),
                        ],
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Trình độ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Java'),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('3 year'),
                        ],
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Mô tả công việc',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.business_center_outlined)
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Инет слабо тянет. Стоит старый допотопный Megaline. Youtube не посмотришь нормально. Роутер жутко глючный. А так хата норм.',
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Liên hệ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.call_outlined)
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Email: Recruitment@fsoft.com.vn\nTel.: (+84) 243 768 9048\nHead Office: FPT Tower, No.10 Pham Van Bach Street',
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 3,
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () => print('cancel'),
                      icon: Icon(Icons.clear),
                    ),
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 3,
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () => print('save'),
                      icon: Icon(Icons.turned_in_not),
                    ),
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 3,
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () => print('like'),
                      icon: Icon(Icons.thumb_up_alt_outlined),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
