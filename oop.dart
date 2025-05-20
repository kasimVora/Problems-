void main(){

}


abstract class Repository  {
  void getUser();
}

class UserDataSource{
  void getLocalUser() {
    // TODO: implement getLocalUser
  }
}


mixin ApiMixin{
  void getUserFromApi(){

  }
}

class RepositoryImpl extends Repository with ApiMixin  implements UserDataSource  {
  @override
  void getUser() {
    // TODO: implement getUser
  }

  @override
  void getLocalUser() {
    // TODO: implement getLocalUser
  }

  @override
  void getUserFromApi() {
    // TODO: implement getUserFromApi
    super.getUserFromApi();
  }

}

class User{

  static final User _user = User._internal();

  factory User(){
    return _user;
  }

  User._internal();

}

