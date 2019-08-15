class ValidationMixin {
  String validateEmail (value){
        if (!value.contains('@')) {
          return 'Insira um email válido!';
        }
        return null;
      }

  String validatePassword (value){
        if (value.length < 4) {
          return 'Password precisa ter mais que 4 caracteres';
        }
        return null;
      }
}