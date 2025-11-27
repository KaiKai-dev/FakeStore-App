part of AccountPageLibrary;

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final accountContext = context.read<AccountPageCubit>();
    final signupState = (accountContext.state as SignupState);
    final screen = MediaQuery.sizeOf(context);

    return Container(
      height: screen.height,
      padding: EdgeInsets.all(16),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                label: Text("User Name"),
                hintText: "User Name",
              ),
              controller: signupState.username,
              // onChanged: (value) => accountContext.updateForm( signupState.copyWith(username: value) ),
            ),
            TextFormField(
              decoration: InputDecoration(
                label: Text("E-mail address"),
                hintText: "E-mail address"
              ),
              controller: signupState.email,
              // onChanged: (value) => accountContext.updateForm( signupState.copyWith(email: value) ),
            ),
            TextFormField(
              decoration: InputDecoration(
                label: Text("Password"),
                hintText: "Password"
              ),
              controller: signupState.password,
              // onChanged: (value) => accountContext.updateForm( signupState.copyWith(password: value) ),
            ),

            // TODO: implement confirm password
            TextFormField(
              decoration: InputDecoration(
                label: Text("Confirm Password"),
                hintText: "Confirm Password"
              ),
              controller: signupState.confirmPassword,
              // onChanged: (value) => accountContext.updateForm( signupState.copyWith(confirmPassword: value) ),
            ),
            GestureDetector(
              onTap: () => accountContext.submitForm(signupState.toMap()),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                  )
                ),
                child: Text(
                  "Submit"
                ),
              ),
            )
          ]
        ),
      ),
    );
  }
}