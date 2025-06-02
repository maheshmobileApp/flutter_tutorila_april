import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class DynamicListView extends StatefulWidget {
  const DynamicListView({ Key? key }) : super(key: key);

  @override
  State<DynamicListView> createState() => _DynamicListViewState();
}

class _DynamicListViewState extends State<DynamicListView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  final names = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Dynamic ListView"),),
      body:Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(height: 100,),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "ListView With Dynamic Data",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5B67CA)),
                  )
              ),
              SizedBox(height: 30,),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  else if (isValidName(value)) {
                    return null;
                  }
                  else {
                    return 'First name minimum 3 and maximum 20 charactors are required';
                  }
                },
                inputFormatters: [
                  // RemoveEmojiInputFormatter(),
                  // CustomFormatter(),
                  LengthLimitingTextInputFormatter(20),
                ],
                controller: firstNameController,
                keyboardType: TextInputType.name,
                // maxLength: 120,
                // maxLines: 5,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.perm_identity),
                    border: OutlineInputBorder(),
                    labelText: "Name",
                    hintText: "Enter your name",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF2C406E),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                     addinglist();
                  },
                  child: Container(
                      width: double.infinity,
                      height: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color(0xFF5B67CA),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Add",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ))),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView(
                  children: List.generate(names.length, (index) {
                    final data = names[index];
                    return Container(
                      margin: const EdgeInsets.all(10),
                      child: Text("${index + 1} $data"),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  bool isValidName(String name) {
    if(name.length>=3)
      return true;
    else
      return false;
  }
  void addinglist() {

    final validate = _formKey.currentState!.validate();
    if (validate) {
      setState(() {
        names.add(firstNameController.text);
      });
      firstNameController.clear();
    }
    else {
      print("form is not valid");
    }
  }



}
