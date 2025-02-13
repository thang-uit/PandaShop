import 'package:get/get.dart';

class ChatMessage {
  final RxString text;
  final bool isUser;
  final RxBool isLoading;
  final RxBool isTyping;
  final RxString typingMessage;

  ChatMessage({
    required String text,
    required this.isUser,
    bool isLoading = false,
    String? typingMessage,
  })  : text = text.obs,
        isLoading = isLoading.obs,
        isTyping = false.obs,
        typingMessage = (typingMessage ?? '').obs;

  // Phương thức cập nhật trạng thái
  void updateMessageState({
    bool? isLoading,
    bool? isTyping,
    String? typingMessage,
    String? text,
  }) {
    if (isLoading != null) this.isLoading.value = isLoading;
    if (isTyping != null) this.isTyping.value = isTyping;
    if (typingMessage != null) this.typingMessage.value = typingMessage;
    if (text != null) this.text.value = text;
  }
}
