import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyAlertDialogTheme {
  static final ThemeData theme = ThemeData(
    dialogTheme: DialogTheme(
      backgroundColor: Colors.white, // цвет фона
      titleTextStyle: TextStyle(color: Colors.black), // цвет текста заголовка
      contentTextStyle: TextStyle(color: Colors.black), // цвет текста содержимого
    ),

  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyAlertDialogTheme.theme,
      title: 'Пример приложения',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isDialogVisible = false;

  void _showDialog() {
    showDialog(

      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text("Страница оплаты"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Номер карты",
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "MM/YY",
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "CVV",
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),


          actions: [
            TextButton(
              child: Text("Отмена"),
              onPressed: () {
                setState(() {
                  _isDialogVisible = false;
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Подтвердить"),
              onPressed: () {
                // Действия при подтверждении
                setState(() {
                  _isDialogVisible = false;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    ).then((value) {
      // Обработка результата
      print("Dialog result: $value");
    });

    setState(() {
      _isDialogVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Способ оплаты"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton (
              child: Text("Оплата картой"),
              onPressed: () {
                _showDialog();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                minimumSize: MaterialStateProperty.all<Size>(Size(300, 50)),
                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(5)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.grey),
                    )
                ),
              ),
            ),
            if (_isDialogVisible)
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black54,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }

}
