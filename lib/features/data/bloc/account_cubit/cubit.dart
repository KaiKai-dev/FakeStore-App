part of AccountPageLibrary;

class AccountPageCubit extends Cubit<AccountPageState> {
  AccountPageCubit() : super(AccountInitialState());


  void init() async {
    emit(
      AccountLoadingState()
    );
    
    final token = await SecureCache.getString("user");

    if( token == null ){
      emit(
        AccountNoUserState()
      );
    } else {
      final  userData = await AccountRepository().fetchUser();

      emit(AccountLoadedState(user: userData));
    }
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

  void submitForm(Map<String, dynamic> data) async {
    switch(state){
      case SignupState(): 
        await AccountRepository().signup(data); 
        break;
      case LoginState(): 
        await AccountRepository().authLogin(data); 
        break;
      default: log("Invalid Form State"); return;
    };

    init();
  } 





}
