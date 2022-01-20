# Todo - Create Task

## Feature
  - Create task complete or incomplete
  - Bottom navigation bar to switch between Complete Task, All Task, Incomplete Task screens 

## How to run this project ?
  - Run project using Android Studio or VSCode:
      + ###### Android: Click the Play icon in the toolbar, or invoke Run > Run. The bottom Run pane shows logs output
      + ###### VSCode: Start my application by opening the root folder of my project (the one containing pubspec.yaml) in VS Code and clicking Run > Start Debugging or ##Run without Debugging

  - Run project in a terminal:
    + ###### flutter run 

## How to run Unit Test/ Widget Test/ Integration Test? 
  - Run tests using IntelliJ or VSCode
    > The Flutter plugins for IntelliJ and VSCode support running tests. This is often the best option while writing tests because it provides the fastest feedback loop as well as the ability to set breakpoints.
    + ###### IntelliJ
       > 1.Open the test files .dart in the test folder.
       
       > 2.Select the Run menu.
       
       > 3.Click the Run 'tests in counter_test.dart' option.
       
       > 4.Alternatively, use the appropriate keyboard shortcut for your platform.

     + ###### VSCode
        > 1.Open the test files .dart in the test folder. 
        
        > 2.Select the Run menu.
        
        > 3.Click the Start Debugging option.
        
        > 4.Alternatively, use the appropriate keyboard shortcut for your platform.

  - Run tests in a terminal:
    + ###### You can also use a terminal to run the tests by executing the following command from the root of the project:
        ###### flutter test test/{name test file}.dart
        
  
## How to run the integration test on device?
  - To test on a real iOS / Android device, first connect the device and run the following command from the root of the project:
      + ###### flutter test integration_test/app_test.dart

  - Or, you can specify the directory to run all integration tests:
      + ###### flutter test integration_test
