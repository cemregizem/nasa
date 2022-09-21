import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nasarover/components/custom_app_bar.dart';
import 'package:nasarover/components/dropdownlistbutton.dart';
import 'package:nasarover/gallery/viewmodel/rover_list_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_html/flutter_html.dart';

class RoverView extends StatefulWidget {
  const RoverView({Key? key}) : super(key: key);

  State<RoverView> createState() => _RoverViewState();

  @override
  void initState() {}
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class _RoverViewState extends State<RoverView> {
  final List<Widget> _tabs = [
    const Curiosity(),
    const Opportunity(),
    const Spirit(),
  ];

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<RoverListViewModel>(context);
    int _selectedIndex = 0;
    String name = '';
    void _onTap(int index) {
      _selectedIndex = index;
      setState(() {
        if (index == 0) {
          name = 'Curiosity';
        } else if (index == 1) {
          name = 'Opportunity';
        } else {
          name = 'Spirit';
        }
        vm.getRoverImage(name);
      });
    }

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Rover Photos'),
      ),
      child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Curiosity'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.music_note), label: 'Opportunity'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Spirit'),
            ],
            currentIndex: _selectedIndex,
            onTap: _onTap,
            activeColor: Colors.green,
          ),
          tabBuilder: (BuildContext context, index) {
            return _tabs[index];
          }),
    );
  }
}

//Curiosity Rover Tab
class Curiosity extends StatelessWidget {
  const Curiosity({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final vm = Provider.of<RoverListViewModel>(context);

    void _getselectedValue(String val) {
      setState(() {
        var selectedCam = val;
        print('********');
        print(selectedCam);
      });
    }

    final List<String> cameras = [
      'FHAZ',
      'RHAZ',
      'MAST',
      'CHEMCAM',
      'MAHLI',
      'MARDI',
      'NAVCAM',
    ];
    var selectedValue;

    return Scaffold(
        appBar: BaseAppBar(
          title: "Curiosity Photos",
          appBar: AppBar(),
          widgets: [
            const SizedBox(height: 30),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton2(
                  isExpanded: true,
                  hint: Text('Select Cam'),
                  value: selectedValue,
                  items: cameras
                      .map((items) => DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                          )))
                      .toList(),
                  onChanged: (value) => {
                    selectedValue = value as String,

                    //setState(() {
                    //selectedValue = value; }),
                    print(selectedValue),
                    _getselectedValue(selectedValue),
                  },
                  buttonHeight: 50,
                  buttonWidth: 160,
                  buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                  buttonDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.grey[400],
                  ),
                  buttonElevation: 2,
                  itemHeight: 40,
                  itemPadding: const EdgeInsets.only(left: 14, right: 14),
                  dropdownMaxHeight: 200,
                  dropdownWidth: 160,
                  dropdownPadding: null,
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.grey[400],
                  ),
                  dropdownElevation: 8,
                  scrollbarRadius: const Radius.circular(20),
                  scrollbarThickness: 6,
                  scrollbarAlwaysShow: true,
                  offset: const Offset(-20, 0),
                ))
          ],
        ),
        body: Container(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: ListView.builder(
                itemCount: vm.rovers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Html(
                        data: '<div  style=" text-align:center;"><img src="' +
                            vm.rovers[index].imgSrc! +
                            '"></div>',
                      ),
                      subtitle: Text(
                        "Sol: " +
                            vm.rovers[index].sol.toString() +
                            "\nCamera: " +
                            vm.rovers[index].camera!.fullName.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ));
                })));
  }

  setState(Null Function() param0) {}
}

//Opportunity Rover Tab
class Opportunity extends StatelessWidget {
  const Opportunity({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final vm = Provider.of<RoverListViewModel>(context);
    final List<String> cameras = [
      'FHAZ',
      'RHAZ',
      'NAVCAM',
      'FHAZ',
      'PANCAM',
      'MINITES',
    ];

    return Scaffold(
        appBar: BaseAppBar(
          title: "Opportunity Photos",
          appBar: AppBar(),
          widgets: const [
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.all(8.0),
            )
          ],
        ),
        body: Container(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: ListView.builder(
                itemCount: vm.rovers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Html(
                      data: '<div  style=" text-align:center;"><img src="' +
                          vm.rovers[index].imgSrc! +
                          '"></div>',
                    ),
                    subtitle: Text(
                      "Sol: " +
                          vm.rovers[index].sol.toString() +
                          "\nCamera: " +
                          vm.rovers[index].camera!.fullName.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                })));
  }
}

// Spirit Rover Tab
class Spirit extends StatelessWidget {
  const Spirit({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final vm = Provider.of<RoverListViewModel>(context);
    final List<String> cameras = [
      'FHAZ',
      'RHAZ',
      'NAVCAM',
      'FHAZ',
      'PANCAM',
      'MINITES',
    ];

    return Scaffold(
        appBar: BaseAppBar(
          title: "Spirit Photos",
          appBar: AppBar(),
          widgets: const [
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.all(8.0),
            )
          ],
        ),
        body: Container(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: ListView.builder(
                itemCount: vm.rovers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Html(
                      data: '<div  style=" text-align:center;"><img src="' +
                          vm.rovers[index].imgSrc! +
                          '"></div>',
                    ),
                    subtitle: Text(
                      "Sol: " +
                          vm.rovers[index].sol.toString() +
                          "\nCamera: " +
                          vm.rovers[index].camera!.fullName.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                })));
  }
}
