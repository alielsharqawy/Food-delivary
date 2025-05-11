import 'package:app/data/cubits/chats/chats_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/data/models/chats/chats_model.dart';
import 'package:app/data/repos/chats/chats_repo.dart';


class ChatCubit extends Cubit<ChatState> {
  final ChatRepository repository;

  ChatCubit(this.repository) : super(ChatInitial());

  void loadMessages(String chatId) {
    emit(ChatLoading());
    try {
      repository.getMessages(chatId).listen(
        (messages) {
          emit(ChatLoaded(messages));
        },
        onError: (error) {
          emit(ChatError(error.toString()));
        },
      );
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  Future<void> sendMessage(String chatId, MessageModel message) async {
    try {
      await repository.sendMessage(chatId, message);
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }
}
