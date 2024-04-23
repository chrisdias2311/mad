// Import necessary packages for Flutter application
import 'package:flutter/material.dart'; // Material design components
import 'package:flutter/services.dart'; // Services for accessing platform-specific APIs

// Entry point of the application
void main() {
  // Run the application with MyApp widget as the root widget
  runApp(const MyApp());
}

// MyApp widget, represents the entire application
class MyApp extends StatelessWidget {
  // Constructor for MyApp widget
  const MyApp({Key? key}) : super(key: key);

  // Build method, returns the widget hierarchy that represents the application's UI
  @override
  Widget build(BuildContext context) {
    // Define the title of the application
    const appTitle = "Flutter Form Demo";
    // Return MaterialApp widget which provides basic app infrastructure
    return MaterialApp(
      // Set the title of the application
      title: appTitle,
      // Define the home page of the application
      home: Scaffold(
        // Scaffold widget provides a default layout structure for the app
        appBar: AppBar(
          // App bar with the title of the application
          title: const Text(appTitle),
        ),
        // Body of the application, contains MyCustomForm widget
        body: MyCustomForm(),
      ),
    );
  }
}

// MyCustomForm widget, represents the form used in the application
class MyCustomForm extends StatefulWidget {
  // Constructor for MyCustomForm widget
  const MyCustomForm({Key? key}) : super(key: key);

  // Create the state for MyCustomForm widget
  @override
  MyCustomFormState createState() => MyCustomFormState();
}

// State class for MyCustomForm widget
class MyCustomFormState extends State<MyCustomForm> {
  // Global key for the form
  final _formKey = GlobalKey<FormState>();
  // Controllers for text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  // Flag to track whether form is submitted
  bool isSubmit = false;

  // Build method, returns the widget hierarchy that represents the form UI
  @override
  Widget build(BuildContext context) {
    return Form(
      // Assign the form key to the form
      key: _formKey,
      // Column widget to display form elements vertically
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Text form field for name input
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
            // Validator to check if name field is empty
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          // Text form field for email input
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
            keyboardType: TextInputType.emailAddress,
            // Validator to check if email field is empty or has a valid format
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email';
              } else if (!value.contains('@') || !value.contains('.')) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          // Text form field for phone number input
          TextFormField(
            controller: _phoneController,
            decoration: const InputDecoration(
              labelText: 'Phone Number',
            ),
            keyboardType: TextInputType.phone,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            // Validator to check if phone number field is empty or has a valid format
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your phone number';
              } else if (value.length < 10) {
                return 'Phone number must be at least 10 digits';
              }
              return null;
            },
          ),
          // Padding widget to add space between form fields and submit button
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            // Elevated button widget for form submission
            child: ElevatedButton(
              onPressed: () {
                // Validate form data
                if (_formKey.currentState!.validate()) {
                  // Show a snackbar message when form is submitted
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Form submitted!'),
                    ),
                  );
                  // Set isSubmit flag to true
                  isSubmit = true;
                  // Print the entered data
                  print('Name: ${_nameController.text}');
                  print('Email: ${_emailController.text}');
                  print('Phone Number: ${_phoneController.text}');
                  // Update the state to rebuild the UI
                  setState(() {});
                }
              },
              // Text displayed on the button
              child: const Text('Submit'),
            ),
          ),
          // Conditional rendering to display submitted data if form is submitted
          if (isSubmit)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ${_nameController.text}'),
                Text('Email: ${_emailController.text}'),
                Text('Phone Number: ${_phoneController.text}'),
              ],
            ),
        ],
      ),
    );
  }

  // Dispose method to release resources used by controllers
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
