import 'dart:async';

class Validator {


  final validateNickname =
  StreamTransformer<String, String>.fromHandlers(handleData: (nickName, sink) {
    if (nickName.contains(RegExp(r'[a-zA-Z0-9_]')) && nickName.length > 0) {
      sink.add(nickName);
    } else {
      sink.addError('должна содержит только символы латинского алфавита');
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
        if (password.length > 3 && password.length < 9) {
          sink.add(password);
        } else {
          sink.addError('Длина пароля должна быть от 3 до 9 символа');
        }
      });

}
