import 'dart:io';

Future<void> runDartTest() async {
  try {
    final process = await Process.run(
      'flutter',
      ['test'],
      workingDirectory: '../', // Optionally, specify the working directory
      runInShell: true, // Recommended for cross-platform compatibility
    );

    // Print the standard output and error streams.
    print('Standard Output:');
    print(process.stdout);

    print('Standard Error:');
    print(process.stderr);

    // Check the exit code.
    if (process.exitCode == 0) {
      print('Dart tests ran successfully.');
    } else {
      print('Dart tests failed with exit code: ${process.exitCode}');
    }
  } catch (e) {
    print('Error running dart test: $e');
  }
}