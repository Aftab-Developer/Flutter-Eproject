import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      

      body:
      SafeArea(
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: 
                  Container( 
                    width: 350 ,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[200] , 
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey.shade300, width: 1),
                    ),
                    child: Row( 
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search...',
                              prefixIcon: Icon(Icons.search),
                              
                            ),
                          ),
                        ),
                       DropdownMenu<String>(
                    initialSelection: "Windows",
                    dropdownMenuEntries: const [
                      DropdownMenuEntry(value: "Windows", label: "Windows"),
                      DropdownMenuEntry(value: "Linux", label: "Linux"),
                      DropdownMenuEntry(value: "MacOs", label: "MacOs"),
                    ],

                    inputDecorationTheme: const InputDecorationTheme(
                      isDense: true,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,  
                      contentPadding: EdgeInsets.zero
                    ),
                    
                    textStyle: TextStyle(fontSize: 14),
                    width:120, 
                  ), 
                  Container(
                    margin: EdgeInsets.only(right: 19.0),
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle
                    ),
                    child: Icon(Icons.search),
                  )

 ],
                    ),
                  ),
                  
            ) ,
            
        
          Expanded(
            child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context,index){
            
            return Container( 
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
              ),
              child: ListTile( 
                
                title: Text('Search Result $index'),
                subtitle: Text('Details for search result $index'),
                trailing: Icon(Icons.arrow_forward),
              ),
            );
            
                  }),
          ),
        ]),
      )

     
       
    );
    
  }
}