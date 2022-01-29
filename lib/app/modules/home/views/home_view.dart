import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:valbury_test_app/app/widgets/card-rs.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        backgroundColor: Colors.indigo,
        title: Text('Valbury'),
        leading: Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
          )
        ],
        bottom: PreferredSize(
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Center(
                    child: Text('Home', style: TextStyle(color: Colors.white)),
                  )),
                  Expanded(
                      child: Center(
                    child: Text('About', style: TextStyle(color: Colors.white)),
                  )),
                ],
              ),
              height: 40,
            ),
            preferredSize: Size.fromHeight(40.0)),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Text('Rumah Sakit'),
                  Spacer(),
                  Text(
                    'Lihat Semua',
                    style: TextStyle(),
                  ),
                ],
              ),
              Container(
                height: 50,
                child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.hospitalList.length,
                      separatorBuilder: (context, _) => SizedBox(
                            width: 4,
                          ),
                      itemBuilder: (context, index) => (Card(
                            child: InkWell(
                              onTap: () => controller
                                  .onClickRs(controller.hospitalList[index].id),
                              child: Container(
                                width: 100,
                                child: Obx(() => (
                                  Center(
                                    child: Text(
                                    controller.hospitalList[index].name,
                                    style: TextStyle(
                                        color: controller.hospitalList[index].id == controller.selectedIndex() ? Colors.black : Colors.grey,
                                        fontSize: 15,
                                        fontWeight: controller.hospitalList[index].id == controller.selectedIndex() ? FontWeight.bold : FontWeight.normal
                                    ),
                                  ))
                                )),
                              ),
                            ),
                          ))),
              ),
              Obx(() {
                return (ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.selectedIndex() == 'semua'
                        ? controller.hospitalDetail.length
                        : controller.hospitalDetail
                            .where(
                                (i) => i["code"] == controller.selectedIndex())
                            .toList()
                            .length,
                    separatorBuilder: (context, _) => SizedBox(
                          width: 5,
                        ),
                    itemBuilder: (context, index) => (Container(
                          width: 200,
                          height: 70,
                          child: CardRs(
                              index: index,
                              obj: controller.selectedIndex() == 'semua'
                                  ? controller.hospitalDetail[index]
                                  : controller.hospitalDetail
                                      .where((i) =>
                                          i["code"] ==
                                          controller.selectedIndex())
                                      .toList()[index]),
                        ))));
              }),
              Container(
                height: 100,
                margin: EdgeInsets.only(top: 20, bottom: 30),
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.bannerLsit.length,
                    separatorBuilder: (context, _) => SizedBox(
                          width: 4,
                        ),
                    itemBuilder: (context, index) => (Container(
                            child: Container(
                          width: 150,
                          child: Center(
                              child:
                                  Image.asset(controller.bannerLsit[index], width: 150,)),
                        )))),
              ),
              Row(
                children: [
                  Text('Klinik'),
                  Spacer(),
                  Text(
                    'Lihat Semua',
                    style: TextStyle(),
                  ),
                ],
              ),
              Container(
                height: 50,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.kliniklList.length,
                    separatorBuilder: (context, _) => SizedBox(
                          width: 4,
                        ),
                    itemBuilder: (context, index) => (
                      Card(
                          child: InkWell(
                            onTap: () => controller.onClickKlinik(
                                controller.kliniklList[index].id),
                            child: Container(
                              width: 100,
                              child: Obx(() => (
                                Center(
                                  child: Text(
                                  controller.kliniklList[index].name,
                                  style: TextStyle(
                                    color: controller.kliniklList[index].id == controller.selectedIndexKlinik() ? Colors.black : Colors.grey,
                                    fontSize: 15,
                                    fontWeight: controller.kliniklList[index].id == controller.selectedIndexKlinik() ? FontWeight.bold : FontWeight.normal
                                  ),
                                ))
                              )),
                            ),
                          ),
                        ))),
              ),
              Obx(() {
                return (ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.selectedIndexKlinik() == 'semua'
                        ? controller.kliniklDetail.length
                        : controller.kliniklDetail
                            .where((i) =>
                                i["code"] == controller.selectedIndexKlinik())
                            .toList()
                            .length,
                    separatorBuilder: (context, _) => SizedBox(
                          width: 5,
                        ),
                    itemBuilder: (context, index) => (Container(
                          width: 200,
                          height: 70,
                          child: CardRs(
                              index: index,
                              obj: controller.selectedIndexKlinik() == 'semua'
                                  ? controller.kliniklDetail[index]
                                  : controller.kliniklDetail
                                      .where((i) =>
                                          i["code"] ==
                                          controller.selectedIndexKlinik())
                                      .toList()[index]),
                        ))));
              })
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apartment_outlined),
            label: 'RS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Klinik',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
