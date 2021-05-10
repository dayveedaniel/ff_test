import 'dart:async';
import '../mixins/validation_mixins.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validator {
  final _nickNameController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // add data to the stream
  Stream<String> get email => _nickNameController.stream.transform(validateNickname);

  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  Stream<bool> get submitValid =>
      Rx.combineLatest2(email, password, (e, p) => true);

  //change data
  Function(String) get changeNickname => _nickNameController.sink.add;

  Function(String) get changePassword => _passwordController.sink.add;

  // close sink
  dispose() {
    _passwordController.close();
    _nickNameController.close();
  }
}

final bloc = Bloc();
