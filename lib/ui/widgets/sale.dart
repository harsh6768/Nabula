import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:resort_app/ui/widgets/tapper.dart';

class Sale extends StatefulWidget {
  @override
  _SaleState createState() => _SaleState();
}

class _SaleState extends State<Sale> {
  double xcord1;
  double xcord2;

  bool toggleResaleValue = true;
  bool toggleSaleByOwnerValue = false;
  bool toogleNewConstructionValue = true;

  @override
  void initState() {
    super.initState();
    // xcord = MediaQuery.of(widget.context).size.width/1.5;
    xcord1 = 200;
    xcord2 = 200;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Property Type',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              _DocumentType(
                listDocumentName: [
                  'Single_Family-Home',
                  'Single_Family-Home',
                  'Single_Family-Home',
                ],
                onSelected: (int index) {
                  print('Selected document $index');
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Price Range',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[Text('min'), Text('max')],
              ),
              LayoutBuilder(
                builder: (BuildContext context, Constraints constraints) =>
                    Container(
                  margin: EdgeInsets.all(0.0),
                  child: GestureDetector(
                    onPanStart: (DragStartDetails details) {
                      print('Details');
                      print(details);
                      this.setState(() {
                        xcord1 = details.localPosition.dx;
                      });
                    },
                    child: CustomPaint(
                      painter: TapperPainter(
                        context: context,
                        xcord: xcord1,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 10.0),
                            height: 40.0,
                            width: 2.0,
                            color: Colors.blueAccent,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 10.0,
                            ),
                            height: 40.0,
                            width: 2.0,
                            color: Colors.blueAccent,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[Text("\$${70000}"), Text("\$${500000}")],
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Rooms',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Wrap(
                children: [
                  ChoiceChip(
                    label: Text('Any'),
                    selected: false,
                    onSelected: (bool selected) {
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  ChoiceChip(
                    label: Container(
                      padding: EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Text('1'),
                    ),
                    selected: false,
                    onSelected: (bool selected) {
                      setState(() {});
                    },
                    selectedColor: Theme.of(context).accentColor,
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  ChoiceChip(
                    label: Container(
                        padding: EdgeInsets.only(
                          left: 8.0,
                          right: 8.0,
                        ),
                        child: Text('2')),
                    selected: false,
                    onSelected: (bool selected) {
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  ChoiceChip(
                    selectedColor: Colors.blueAccent,
                    label: Container(
                      padding: EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                      ),
                      child: Text(
                        '3',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    selected: true,
                    onSelected: (bool selected) {
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  ChoiceChip(
                    label: Container(
                      padding: EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                      ),
                      child: Text('4'),
                    ),
                    selected: false,
                    onSelected: (bool selected) {
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  ChoiceChip(
                    label: Container(
                      padding: EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                      ),
                      child: Text('5+'),
                    ),
                    selected: false,
                    onSelected: (bool selected) {
                      setState(() {});
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Bathrooms',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Wrap(
                children: [
                  ChoiceChip(
                    label: Text('Any'),
                    selected: false,
                    onSelected: (bool selected) {
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  ChoiceChip(
                    label: Container(
                      padding: EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Text('1'),
                    ),
                    selected: false,
                    onSelected: (bool selected) {
                      setState(() {});
                    },
                    selectedColor: Theme.of(context).accentColor,
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  ChoiceChip(
                    selectedColor: Colors.blueAccent,
                    label: Container(
                      padding: EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                      ),
                      child: Text(
                        '2',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    selected: true,
                    onSelected: (bool selected) {
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  ChoiceChip(
                    label: Container(
                      padding: EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                      ),
                      child: Text(
                        '3',
                      ),
                    ),
                    selected: false,
                    onSelected: (bool selected) {
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  ChoiceChip(
                    label: Container(
                      padding: EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                      ),
                      child: Text('4'),
                    ),
                    selected: false,
                    onSelected: (bool selected) {
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  ChoiceChip(
                    label: Container(
                      padding: EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                      ),
                      child: Text('5+'),
                    ),
                    selected: false,
                    onSelected: (bool selected) {
                      setState(() {});
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Surface Area',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[Text('min'), Text('max')],
              ),
              LayoutBuilder(
                builder: (BuildContext context, Constraints constraints) =>
                    Container(
                  margin: EdgeInsets.all(0.0),
                  child: GestureDetector(
                    onPanStart: (DragStartDetails details) {
                      print('Details');
                      print(details);
                      this.setState(() {
                        xcord2 = details.localPosition.dx;
                      });
                    },
                    child: CustomPaint(
                      painter: TapperPainter(
                        context: context,
                        xcord: xcord2,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 10.0),
                            height: 40.0,
                            width: 2.0,
                            color: Colors.blueAccent,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 10.0,
                            ),
                            height: 40.0,
                            width: 2.0,
                            color: Colors.blueAccent,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[Text("no min"), Text("450sqm")],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Resale',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Switch(
                    value: toggleResaleValue,
                    onChanged: (value) {
                      setState(() {
                        toggleResaleValue = value;
                        print(toggleResaleValue);
                      });
                    },
                    activeTrackColor: Colors.blueAccent,
                    activeColor: Colors.blueAccent,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'For sale by owner',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Switch(
                    value: toggleSaleByOwnerValue,
                    onChanged: (value) {
                      setState(() {
                        toggleSaleByOwnerValue = value;
                        print(toggleSaleByOwnerValue);
                      });
                    },
                    activeTrackColor: Colors.blueAccent,
                    activeColor: Colors.blueAccent,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'New Construction',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Switch(
                    value: toogleNewConstructionValue,
                    onChanged: (value) {
                      setState(() {
                        toogleNewConstructionValue = value;
                        print(toogleNewConstructionValue);
                      });
                    },
                    activeTrackColor: Colors.blueAccent,
                    activeColor: Colors.blueAccent,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _DocumentType extends StatefulWidget {
  final List<String> listDocumentName;
  final Function onSelected;

  const _DocumentType({
    Key key,
    @required this.listDocumentName,
    this.onSelected(int index),
  })  : assert(listDocumentName.length > 0, 'Must be more than 1'),
        super(key: key);

  @override
  __DocumentTypeState createState() => __DocumentTypeState();
}

class __DocumentTypeState extends State<_DocumentType> {
  int selectedDocIndex;

  @override
  void initState() {
    super.initState();
    selectedDocIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            onTap: () async {
              print("Here should show the bottom sheet");
              await showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) {
                  return _DocumentSelectionBottomSheet(
                      list: widget.listDocumentName,
                      selectedIndex: 0,
                      onSelected: (val) {
                        setState(() {
                          selectedDocIndex = val;
                        });
                        widget.onSelected(val);
                      });
                },
              );
            },
            contentPadding: EdgeInsets.all(0),
            title: Text(
              widget.listDocumentName[selectedDocIndex],
              style: TextStyle(fontSize: 14),
              // style: GolosTextStyles.mainTextSize16(
              //   golosTextColors: GolosTextColors.grayDarkVery,
              // ),
              overflow: TextOverflow.fade,
            ),
            trailing: Image.asset(
              'assets/images/less.png',
              color: Colors.grey,
              scale: 0.8,
            ),
          ),
          Container(height: 1, color: Colors.grey),
        ],
      ),
    );
  }
}

class _DocumentSelectionBottomSheet extends StatefulWidget {
  final List<String> list;
  final int selectedIndex;
  final Function onSelected;

  const _DocumentSelectionBottomSheet({
    Key key,
    @required this.list,
    this.selectedIndex = 0,
    this.onSelected(int index),
  }) : super(key: key);

  @override
  __DocumentSelectionBottomSheetState createState() =>
      __DocumentSelectionBottomSheetState();
}

class __DocumentSelectionBottomSheetState
    extends State<_DocumentSelectionBottomSheet> {
  int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 26),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Single_Family-Home',
              // style: TextStyle(fontSize: 14),
              // style: GolosTextStyles.h2size20(
              //   // golosTextColors: GolosTextColors.grayDarkVery,
              // ),
            ),
          ),
          SizedBox(height: 12),
          Divider(
            color: Colors.grey,
          ),
          ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: widget.list.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                contentPadding: EdgeInsets.all(0),
                onTap: () {
                  setState(() {
                    widget.onSelected(index);
                    selectedIndex = index;
                  });
                },
                title: Text(
                  widget.list[index],
                  // style: GolosTextStyles.h3size16(
                  //   golosTextColors: GolosTextColors.grayDarkVery,
                  // ),
                ),
                trailing: selectedIndex == index
                    ? Icon(Icons.check, color: Colors.red)
                    : null,
              );
            },
          ),
        ],
      ),
    );
  }
}
