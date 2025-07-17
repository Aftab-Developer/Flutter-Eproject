import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String selectedOS = "Windows";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.black ,
                width: 1
              )
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded( 
                flex: 3,
                child: TextField( 
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.webSearch,
                  decoration: InputDecoration(
                    hintText: "Search", 
                    border: InputBorder.none
                  ),
                ),
              ) ,
              Expanded(
                flex: 2,
                child: DropdownMenu( 
                inputDecorationTheme: InputDecorationTheme(
                  focusedBorder: InputBorder.none ,
                  enabledBorder: InputBorder.none ,
                  disabledBorder: InputBorder.none
                ),
                
                initialSelection: "Mac", 
              
                dropdownMenuEntries: [
                DropdownMenuEntry(value: "Windows", label: "Windows.."),
                DropdownMenuEntry(value: "Linux", label: "Linux"),
                DropdownMenuEntry(value: "Mac", label: "Mac"),
              ]))  ,
              Expanded(
                flex: 1,
                child: Container(
                child: Center(child: Icon(Icons.search),),
              ))
            ],
          ),
        )
      ),
      body: 
      Column( 
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20,) ,
             Expanded(
               child: ListView.builder(
                     itemCount: 5,
                     itemExtent: 60,
                     itemBuilder: (context,i) {
                     return Padding(
                       padding: const EdgeInsets.only(bottom: 20),
                       child: Container(
                        
                        
                         child: ListTile(
                           leading: Container(
                            width: 50,
                            height: 50,
                            child: ClipRRect( 
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset("assets/images/onBoarding1.png",fit: BoxFit.contain,))),
                           title: Text("Search Title"),
                           trailing: Icon(Icons.arrow_right),
                         ),
                       ),
                     ) ;
                           }),
             )
        ],
      ),
    );
  }
}
