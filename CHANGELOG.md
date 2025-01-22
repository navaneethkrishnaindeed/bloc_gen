# Changelog

## 3.0.0
### Major Changes
* Introduced automatic BuildContext extension generation
* Added automatic Bloc event registration system
* Implemented one-line state updates through context extension
* New Features:
  - Generated `setBaseBlocState` method for simplified state management
  - Automatic event handler registration in Bloc constructor
  - Type-safe event generation for each state variable
  - Improved null safety handling in generated code
* Breaking Changes:
  - Changed annotation syntax to be more intuitive
  - Modified state class generation structure
  - Updated event registration pattern
* Performance Improvements:
  - Optimized code generation process
  - Reduced generated code size
* Bug Fixes:
  - Fixed issues with nullable type handling
  - Corrected event registration for complex types
  - Resolved state update conflicts

## 2.0.2
* State Variable event Generator

## 2.0.1
* Updated with annotations as @generateEvents and as @generateStates

## 2.0.0
* Updated with annotations changes along with new state generators 

## 1.0.2
* Readme change

## 1.0.1
* Initial release