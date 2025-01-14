import 'package:event_generator/annotations.dart';

part 'events.g.dart';

@GenerateEvent('UserLoggedIn')
class BaseEvent {
  final DateTime timestamp;
  
   BaseEvent({DateTime? timestamp}) 
      : timestamp = timestamp ?? DateTime.now();
  
  Map<String, dynamic> toJson() {
    return {
      'timestamp': timestamp.toIso8601String(),
    };
  }
}