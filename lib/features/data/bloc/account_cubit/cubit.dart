part of AccountPageLibrary;

class AccountPageCubit extends Cubit<AccountPageState> {
  AccountPageCubit() : super(AccountInitialState());


  void init() async {
    final userCache = NormalCache.getString("user");
    if(userCache == null) {
      emit(AccountNoUserState());
      return;
    }

    emit( 
      AccountLoadedState( user: User.fromJson(
        jsonDecode(userCache)
      ))
    );
  }

  void goToLogin() {
    emit(LoginState.empty());
  }

  void goToSignUp() {
    emit(SignupState.empty());
  }

  void updateForm(AccountPageState state) {
    if(state is LoginState || state is SignupState){
      emit(state);
    } 
  } 

  void submitForm(Map<String, dynamic> data) {
    switch(state){
      case SignupState(): AccountRepository().signup(data); break;
      case LoginState(): AccountRepository().fetchUsers(); break;
      default: log("Invalid Form State"); return;
    };

    // init();
  } 





}
