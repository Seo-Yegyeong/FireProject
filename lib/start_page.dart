import 'package:get/get.dart';
import 'package:flutter/material.dart';

enum Option { USER, ADMIN }

class StartPage extends StatelessWidget {
  StartPage({Key? key}) : super(key: key);
  final email = Get.arguments;
  final _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _signInEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        Get.toNamed('/login');
      },
      child: Scaffold(
        body: _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: <Widget>[
          Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFF5F0E1),
                      blurStyle: BlurStyle.normal,
                    ),
                  ],
                  border: Border.all(
                    color: const Color(0xFFDDDDDF),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(23),
                ),
                child: Column(
                  children: [
                    Image.asset('assets/logo.PNG'),
                    const Text(
                      '우리의 소식통',
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 40,
                        fontFamily: "DoHyeonFont",
                      ),
                    ),
                    const Text(
                      '부모, 교사가 함께 나누는 학교 이야기',
                      style: TextStyle(
                        color: Color(0xFF6D6A6A),
                        fontSize: 15,
                        fontFamily: "DoHyeonFont",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              _startButton(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _startButton(BuildContext context) {
    final MaterialStateProperty<Size> fixedSize;
    return SizedBox(
      height: 100,
      width: 250,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
          MaterialStateProperty.all<Color>(const Color(0xFFFFC700)),
        ),
        onPressed: () async {},
        child: TextButton(
          child: const Text(
            '시작하기',
            style: TextStyle(
              color: Color(0xFF000000),
              fontFamily: "DoHyeonFont",
              fontSize: 40,
              shadows: const [
                Shadow(
                  color: Color(0xFF6D6A6A),
                ),
              ],
            ),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
