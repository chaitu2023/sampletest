import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController(text: 'sample@gmail.com');
  TextEditingController passwordController = TextEditingController(text: 'sample');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Login App', // Main title
              key: Key('mainTitleText'), // Unique key for the main title
            ),
            Text(
              'Login App', // Subtitle
              key: Key('subtitleText'), // Unique key for the subtitle
              style: TextStyle(fontSize: 19.0, color: Colors.white54),
            ),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  key: Key('emailTextField'),
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  key: Key('passwordTextField'),
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),
              // Padding with increased thickness scrollbar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                child: Center(
                  child: ElevatedButton(
                    key: Key('submitButton'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Check if entered credentials match the sample data
                        if (emailController.text == 'sample@gmail.com' &&
                            passwordController.text == 'sample') {
                          // Navigate to the home page if credentials are valid
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(
                                email: emailController.text,
                              ),
                            ),
                          );
                        } else {
                          // Show an error message for invalid credentials
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Oops! Invalid credentials')),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please fill input')),
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ),
              Text(
                'Login App', // Another instance of the text
                key: Key('secondLoginText'), // Unique key for the second instance
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final String email;

  const HomePage({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome to the Home Page', // Welcome message
            key: Key('welcomeToHomePageText'), // Unique key for the welcome message
          ),
          Text(email),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Go back!"),
              key: Key('goBackButton'), // Unique key for the Go back button
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MembersList(),
                  ),
                );
              },
              child: const Text("Go to Members List"),
              key: Key('goToMembersListButton'), // Unique key for the Go to Members List button
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NextPage(),
                  ),
                );
              },
              child: const Text("Go to Next Page"),
              key: Key('goToNextPageButton'), // Unique key for the Go to Next Page button
            ),
          ),
        ],
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Page'),
      ),
      body: Center(
        child: Text(
          'Everything is working',
          style: TextStyle(fontSize: 24),
          key: Key('everythingIsWorkingText'), // Unique key for the Everything is Fine text
        ),
      ),
    );
  }
}

class MembersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Members List'),
        key: Key('membersListTitle'), // Add this line
      ),
      body: Scrollbar(
        thickness: 12.0,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: List.generate(30, (index) {
            return ListTile(
              title: Text('Member ${index + 1}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MemberProfile(memberName: 'Member ${index + 1}'),
                  ),
                );
              },
              key: Key('member_$index'), // Unique key for each member
            );
          }),
        ),
      ),
    );
  }
}

class MemberProfile extends StatelessWidget {
  final String memberName;

  const MemberProfile({Key? key, required this.memberName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile: $memberName'),
      ),
      body: Center(
        child: Text(
          'Profile details for $memberName',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
