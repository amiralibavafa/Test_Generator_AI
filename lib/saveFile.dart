import 'dart:io';
import 'package:path/path.dart' as path;

Future<void> saveTest(String code, String fileName) async {
  final String destinationDirectory = '../test';
  final String fullFilePath = path.join(destinationDirectory, '$fileName.dart');

  try {
    // Create the test directory if it doesn't exist.
    final Directory testDirectory = Directory(destinationDirectory);
    if (!(await testDirectory.exists())) {
      await testDirectory.create(recursive: true);
      print('Test directory created.');
    }

    // Create the file and write the code to it.
    final File file = File(fullFilePath);
    await file.writeAsString(code);

  } catch (e) {
    print('Error saving code to file: $e');
  }
}