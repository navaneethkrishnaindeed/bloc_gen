/// Annotation for generating events
const generateEvents = GenerateEvents();

/// Private class to handle the annotation for events
class GenerateEvents {
  /// Const constructor for GenerateEvents
  const GenerateEvents();
}

/// Annotation for generating states
const generateStates = GenerateStates();

/// Private class to handle the annotation for states
class GenerateStates {
  /// Const constructor for GenerateStates
  const GenerateStates();
}

/// Annotation for generating models
const generateCopyWith = GenerateModel();

/// Private class to handle the annotation for models
class GenerateModel {
  /// Const constructor for GenerateModel
  const GenerateModel();
}

/// Data type that is not specified
class UnspecifiedDataType {
  /// Const singleton for UnspecifiedDataType
  static const UnspecifiedDataType instance = UnspecifiedDataType._();
  
  const UnspecifiedDataType._();
}