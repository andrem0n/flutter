import 'dart:async';
import '../blocs/validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Validators{
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
    
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid => 
    Observable.combineLatest2(email, password, (e, p) => true);

  Function(String) get changeEmail => _email.sink.add;
  Function(String) get chagePassword => _password.sink.add;

  submit() {
     final validEmail = _email.value;
     final validPassword = _password.value;

     print('Email: $validEmail, and Password: $validPassword');
  }

  dispose() {
    _email.close();
    _password.close();
  }
}