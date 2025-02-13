import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_viewmodel.dart';
import 'package:panda_shop_app/common/widget/toast/snackbar_widget.dart';
import 'package:panda_shop_app/data/model/chat_message.dart';
import 'package:panda_shop_app/data/repositories/core_chat_repository.dart';
import 'package:panda_shop_app/data/services/api_exception.dart';
import 'package:panda_shop_app/utils/constant/enums.dart';
import 'package:panda_shop_app/utils/extension/StringExtension.dart';

class TestChatController extends BaseViewModel {
  static TestChatController get instance => Get.find();

  final CoreChatRepository chatRepository = CoreChatRepository();

  var messageInput = "".obs;
  final RxList<ChatMessage> messages = <ChatMessage>[].obs;

  late TextEditingController textController;

  @override
  void onInit() {
    super.onInit();

    // final defaultMessage =
    //     "Xét 3 đơn thức A = \$2x^2y^3\$, B = \$-1/2x^2y^3\$, C = \$x^3y^2\$. So sánh: \n a) Bậc của 3 đơn thức A, B, C \n b) Phần biến của 3 đơn thức A, B, C";

    final defaultMessage = "Tìm các số thực x sao cho x2 = 49.";

    textController = TextEditingController(text: defaultMessage);
    messageInput.value = defaultMessage;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }

  bool isMessageNotEmpty() {
    return !textController.text.trim().isNullEmptyOrWhitespace;
  }

  // void sendMessage({
  //   String userID = "123",
  //   String conversationID = "conversationID",
  // }) async {
  //   if (!isMessageNotEmpty()) {
  //     return;
  //   }
  //
  //   final userMessage = textController.text.trim();
  //   addItemChatUser(userMessage);
  //
  //   // Tạo tin nhắn tạm thời với trạng thái loading
  //   final loadingMessage = ChatMessage(
  //     text: '',
  //     isUser: false,
  //     isLoading: true,
  //   );
  //
  //   // Thêm loadingMessage vào đầu danh sách
  //   messages.insert(0, loadingMessage);
  //
  //   textController.clear();
  //   messageInput.value = "";
  //
  //   try {
  //     // Gửi request streaming
  //     final stream = chatRepository.postCoreChatStream(data: {
  //       'userID': userID,
  //       'conversationID': conversationID,
  //       'content': userMessage,
  //     });
  //
  //     // Kiểm tra lại index của loadingMessage
  //     final index = messages.indexOf(loadingMessage);
  //     if (index == -1) {
  //       return;
  //     }
  //
  //     String responseText = '';
  //
  //     // Xử lý từng chunk của response
  //     await for (final chunk in stream) {
  //       responseText += chunk;
  //
  //       // Khi nhận được chunk đầu tiên, chuyển trạng thái sang typing
  //       if (loadingMessage.isLoading.value) {
  //         loadingMessage.setLoading(false);
  //         loadingMessage.setTyping(true);
  //       }
  //
  //       // Cập nhật nội dung typing
  //       loadingMessage.setTypingMessage(responseText);
  //       messages.refresh();
  //
  //       // Giả lập gõ phím
  //       await Future.delayed(const Duration(milliseconds: 20));
  //     }
  //
  //     // Khi kết thúc, tắt trạng thái typing và cập nhật tin nhắn cuối
  //     loadingMessage.setTyping(false);
  //     loadingMessage.setText(responseText.trim());
  //     messages.refresh();
  //   } catch (e) {
  //     final index = messages.indexWhere((msg) => msg.isLoading.value);
  //     if (index != -1) {
  //       final errorMessage = messages[index];
  //       errorMessage.setLoading(false);
  //       errorMessage.setTyping(false);
  //       errorMessage.setText("Có lỗi xảy ra. Vui lòng thử lại.");
  //       messages.refresh();
  //     }
  //
  //     // // Hiển thị thông báo lỗi cho người dùng
  //     // SnackBarUtil.show(
  //     //   "Có lỗi xảy ra: ${e is DioError ? e.message : "Không xác định"}",
  //     //   type: ToastType.error,
  //     // );
  //   }
  // }

  void sendMessage({
    String userID = "123",
    String conversationID = "conversationID",
  }) async {
    if (!isMessageNotEmpty()) {
      return;
    }

    final userMessage = textController.text.trim();
    addItemChatUser(userMessage);

    // Tạo tin nhắn tạm thời với trạng thái loading
    final loadingMessage = ChatMessage(
      text: '',
      isUser: false,
      isLoading: true,
    );

    // Thêm loadingMessage vào đầu danh sách
    messages.insert(0, loadingMessage);

    textController.clear();
    messageInput.value = "";

    try {
      // Gửi request streaming
      final stream = chatRepository.postCoreChatStream(data: {
        'userID': userID,
        'conversationID': conversationID,
        'content': userMessage,
      });

      // Kiểm tra lại index của loadingMessage
      final index = messages.indexOf(loadingMessage);
      if (index == -1) {
        return;
      }

      String responseText = '';

      // Xử lý từng chunk của response
      await for (final chunk in stream) {
        for (int i = 0; i < chunk.length; i++) {
          responseText += chunk[i]; // Thêm từng ký tự vào responseText

          // Cập nhật giao diện với nội dung hiện tại
          loadingMessage.updateMessageState(
            typingMessage: responseText,
            isTyping: true,
            isLoading: false,
          );

          // Giả lập typing cho từng ký tự
          await Future.delayed(const Duration(milliseconds: 20));
        }
      }

      // Sau khi stream kết thúc, cập nhật trạng thái cuối cùng
      loadingMessage.updateMessageState(
        isTyping: false,
        text: responseText.trim(),
      );
    } catch (e) {
      // Xử lý lỗi: Cập nhật trạng thái tin nhắn loading
      final index = messages.indexWhere((msg) => msg.isLoading.value);
      if (index != -1) {
        final errorMessage = messages[index];
        errorMessage.updateMessageState(
          isLoading: false,
          isTyping: false,
          text: "Có lỗi xảy ra. Vui lòng thử lại.",
        );
      }
    }
  }

  void addItemChatUser(String content) {
    messages.insert(
        0, ChatMessage(text: content, isUser: true, isLoading: false));
  }

  void clearChat() {
    messages.clear();
  }

  void notifyFeatureDeveloping() {
    SnackBarUtil.show("Tính năng đang phát triển", type: ToastType.info);
  }
}
