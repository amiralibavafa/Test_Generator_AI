import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> generateUnitTests(Future<String> codeFileFuture) async {
  final apiKey = 'YOUR_API_KEY'; // Replace with your actual API key
  final apiUrl =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$apiKey';

  final String codeFile = await codeFileFuture;

  final prompt = """
You are an expert Dart developer specializing in writing comprehensive unit tests. I will provide you with a Dart code file. Your task is to generate unit test cases using the `test` package in Dart to achieve maximum line coverage. Aim for thorough testing, including edge cases and boundary conditions.
Please do not say anything else besides the generated test cases.

Here's the Dart code file:

$codeFile

Please provide the generated unit test file in Dart format. Ensure the following:

* Use the `flutter_test` package for writing tests.
* Use package:sample_project/ to import the source code file.
* Aim for high line coverage.
* Include tests for various scenarios, including valid inputs, invalid inputs, and edge cases.
* If the code involves asynchronous operations, use `async`/`await` and `expectLater` appropriately.
* If the code involves streams, write tests for stream behavior.
* If the code involves classes, test the constructors, methods, and properties.
* If the code has external dependencies, mock them if necessary.
* Provide clear and descriptive test names.
* Use `expect` assertions to verify expected outcomes.
* Include comments to explain the purpose of each test case.
* Do not test custom objects only use standard objects for classes (like int, String, and so on)
* **Provide only the Dart code, without any markdown formatting or backticks.**
""";

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'contents': [
          {
            'parts': [
              {'text': prompt}
            ]
          }
        ]
      }),
    );

    if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body);
      final generatedText = decodedResponse['candidates'][0]['content']['parts'][0]['text'];
      return generatedText; // Return the generated text as a string
    } else {
      print('Error: ${response.statusCode}, ${response.body}');
      return 'NULL'; // return NULL if any error occurred.
    }
  } catch (e) {
    print('Exception: $e');
    return 'NULL'; // return NULL if any exception occurred.
  }
}

