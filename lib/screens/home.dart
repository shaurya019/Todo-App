import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../model/todo.dart';
import '../widgets/todo_item.dart';


class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Stack(
        children:[
          Container(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: Column(
            children: [
              searchBox(),
          Expanded(
            child:ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 50,
                    bottom: 20,
                  ),
                  child: Text(
                    'All ToDos',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                for (ToDo todoo in todosList)
                  ToDoItem(
                    todo: todoo,
                    onToDoChanged: null,
                    onDeleteItem: null,
                  ),
              ],
            ),
          ),
            ],
          ),
        ),
    Align(
    alignment: Alignment.bottomCenter,
    child: Row(children: [
    Expanded(
    child: Container(
    margin: EdgeInsets.only(
    bottom: 20,
    right: 20,
    left: 20,
    ),
    padding: EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 5,
    ),
    decoration: BoxDecoration(
    color: Colors.white,
    boxShadow: const [
    BoxShadow(
    color: Colors.grey,
    offset: Offset(0.0, 0.0),
    blurRadius: 10.0,
    spreadRadius: 0.0,
    ),
    ],
    borderRadius: BorderRadius.circular(10),
    ),
    child: TextField(
    // controller: _todoController,
    decoration: InputDecoration(
    hintText: 'Add a new todo item',
    border: InputBorder.none),
    ),
    ),
    ),
      Container(
        margin: EdgeInsets.only(
          bottom: 20,
          right: 20,
        ),
        child: ElevatedButton(
          child: Text(
            '+',
            style: TextStyle(
              fontSize: 40,
            ),
          ),
          onPressed: () {
            // _addToDoItem(_todoController.text);
          },
          style: ElevatedButton.styleFrom(
            primary: tdBlue,
            minimumSize: Size(60, 60),
            elevation: 10,
          ),
        ),
      ),
    ]),
    ),
        ],
      ),
    );
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: tdGrey),
        ),
      ),
    );
  }
}



  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBGColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: Colors.black,
            size: 30,
          ),
          Container(
            height: 40,
            width: 40,
            child: ClipRect(
              child: Image.network('https://images.saymedia-content.com/.image/t_share/MTc0NDc1NTEyNDkwNTY3MzAy/an-interview-from-beyond-with-albert-einstein.jpg'),
            ),
          ),
        ],
      ),
    );
  }
