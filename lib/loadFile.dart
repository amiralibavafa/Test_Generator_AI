import 'dart:io';
import 'package:path/path.dart' as path;

Future<String> loadFile(String sourceFileName, String destinationFileName) async {
  final String destinationDirectory = './targets';

  try {
    // Create the target directory if it doesn't exist.
    final Directory targetDirectory = Directory(destinationDirectory);
    if (!(await targetDirectory.exists())) {
      await targetDirectory.create(recursive: true);
      print('Target directory created.');
    }

    // Build the full destination path.
    final String fullDestinationPath = path.join(destinationDirectory, destinationFileName);
    final File destinationFile = File(fullDestinationPath);

    // Copy the source file to the destination.
    final File sourceFile = File(sourceFileName);

    if (await sourceFile.exists()) {
      await sourceFile.copy(destinationFile.path);
      print('File copied successfully to $fullDestinationPath');
    } else {
      print('Source file not found.');
      return 'NULL'; // return null if source file is not found.
    }

    // Load the destination file content.
    final String fileContent = await destinationFile.readAsString();

    // Cleanup: delete the temporary text file.
    await destinationFile.delete();
    print('Temporary text file deleted from $fullDestinationPath');

    return fileContent; // Return the file content as a string.

  } catch (e) {
    print('An error occurred: $e');
    return 'NULL'; // Return null if any error occur.
  }
}