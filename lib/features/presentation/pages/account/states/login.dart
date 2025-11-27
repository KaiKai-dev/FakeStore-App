part of AccountPageLibrary;

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final accountCubit = context.read<AccountPageCubit>();
    final state = accountCubit.state as LoginState;

    return Container(
      height: MediaQuery.sizeOf(context).height,
      padding: EdgeInsets.all(16),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              controller: state.username,
            ),
            TextFormField(
              controller: state.password,
            ),
            GestureDetector(
              onTap: () => accountCubit.submitForm(state.toMap()),
              child: Text(
                "Submit"
              ),
            )
          ],
        ),
      ),
    );
  }
}