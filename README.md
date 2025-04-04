# LLM-Based Test Generation Sample Project

## Overview

- This sample project demonstrates the use of LLMs to generate test cases for Dart classes. It identifies uncovered code, generates relevant test cases using an engineered prompt, creates test files, and automatically runs the tests to ensure correctness.

- The project is structured as a Flutter project but is designed to be executed through the terminal.

## Download

- Clone the project repository

## Installation

* Download and extract the project folder.

* Navigate to the project directory:

```bash
cd sample_project
```

* Install dependencies:

```bash
dart pub get
```

* or if using Flutter:

```bash
flutter pub get
```

* Running the Project

This project follows a structured storyline execution through the terminal.
To run the program, execute the following command:


```bash
cd lib
dart run main.dart
```

## Functionality

#### The project generates and tests two Dart classes:

#### Queue Class: A basic queue data structure.

#### DataValidation Class: Validates input data based on specified criteria, such as:

- Email validation

- Age validation

- String length validation

##

Once the test files are generated, the project automatically runs them using the flutter test command to ensure the correctness of the classes.
##

## Notes

- Ensure you have Dart or Flutter installed before running the project.
- Remember to add your Gemini API key to the ```gemini_helper.dart``` file before running the project.
- The generated test files will be stored in the test/ directory.
- This is a sample project, not a final product.
