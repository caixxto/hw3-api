import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


final ageState = _AgeWidgetState();

class AgeWidget extends StatefulWidget {
  const AgeWidget({Key? key}) : super(key: key);

  @override
  State<AgeWidget> createState() => ageState;

}

class _AgeWidgetState extends State<AgeWidget> {

  late MainPageState state;
  final TextEditingController _controller = TextEditingController();


  @override
  void initState() {
    state = DefaultState();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: buildBody(),
    );
  }

  Widget buildBody() {
    if(state.runtimeType == DefaultState) {
      return AgeWidget();
    }

    if(state.runtimeType == LoadingState) {
      return Center(
          child: CircularProgressIndicator()
      );
    }

    if(state.runtimeType == LoadedState) {
      final data = (state as LoadedState).age;
      return Center(
          child: Text(data)
      );
    }
    return Placeholder();
  }

  Widget AgeWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                hintText: 'Input name'
            ),
          ),
        ],
      ),
    );
  }

  void  loadData() async {
    String text = _controller.text;

    if (text == '') {
      setState(() {
        DefaultState();
      });
    }

    if (text != '') {
      setState(() {
        state = LoadingState();
      });
      final response = await http.get(Uri.parse('https://api.agify.io/?name=${text}'));
      setState(() {
        state = LoadedState(response.body);
      });
    }
  }

}

class MainPageState {

}

class DefaultState extends MainPageState {

}

class LoadingState extends MainPageState {

}

class LoadedState extends MainPageState {
  final String age;
  LoadedState(this.age);
}