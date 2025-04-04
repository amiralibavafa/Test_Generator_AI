import 'gemini_helper.dart';
import 'dart:io';
import 'loadFile.dart';
import 'gemini_helper.dart';
import 'saveFile.dart';
import 'testRun.dart';

String cleanGeneratedCode(String generatedText) {
  // Remove leading and trailing backticks and "dart" identifier.
  String cleanedText = generatedText.trim();

  if (cleanedText.startsWith('```dart')) {
    cleanedText = cleanedText.substring(7).trim(); // Remove '```dart'
  }
  if (cleanedText.startsWith('```')) {
    cleanedText = cleanedText.substring(3).trim(); // remove '```'
  }

  if (cleanedText.endsWith('```')) {
    cleanedText = cleanedText.substring(0, cleanedText.length - 3).trim(); // Remove trailing '```'
  }

  return cleanedText;
}



Future<void> main() async {
  print('Main is getting executed! \n');

  sleep(Duration(seconds: 2));

  print('Loading the files into gemini...\n');

  sleep(Duration(seconds: 2));

  print('Loading queue.dart');
  final String queue = await loadFile('queue.dart', 'queue.txt');
  print('\n');

  sleep(Duration(seconds: 2));

  print('Loading dataValidator.dart');
  final String dataValidator = await loadFile(
      'dataValidator.dart', 'dataValidator.txt');
  print('\n');

  sleep(Duration(seconds: 2));

  if (queue != 'NULL' && dataValidator != 'NULL') {
    print('Files Loaded Successfuly!');
    sleep(Duration(seconds: 2));
    print('\n\n');

    print('Generating Unit Tests...');

    String queueTests = await generateUnitTests(Future.value(queue));
    queueTests = cleanGeneratedCode(queueTests);

    sleep(Duration(seconds: 1));

    String dataValidatorTests = await generateUnitTests(
        Future.value(dataValidator));
    dataValidatorTests = cleanGeneratedCode(dataValidatorTests);

    if (queueTests != 'NULL' && dataValidatorTests != 'NULL') {
      print('\n');
      print('Unit Tests Generated Successfully!');
      sleep(Duration(seconds: 2));

      await saveTest(queueTests, 'queue_test');
      await saveTest(dataValidatorTests, 'dataValidator_test');
      print('Test files save successfully!: Check test folder');
      sleep(Duration(seconds: 2));
      print('Running Test files ...');
      sleep(Duration(seconds: 2));
      await runDartTest();
    }

    else {
      print('Unit tests generation failed! Please try again or check API-key in gemini_helper.dart');
      print('Program is exiting...');
    }
  }

  else {
    print('Files Loading Failed! Make sure you have the files in the same directory!');
    print('Program is exiting...');
  }
}