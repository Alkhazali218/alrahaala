abstract class MessageState {}

class MessageInitial extends MessageState {}

class MessageLoading extends MessageState {}

class MessageSent extends MessageState {}

class MessageError extends MessageState {
  final String message;
  MessageError(this.message);
}
