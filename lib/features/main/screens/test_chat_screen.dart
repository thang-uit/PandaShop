import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:panda_shop_app/common/assets/lotties.dart';
import 'package:panda_shop_app/common/widget/anim/typing_indicator_anim.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_scaffold.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_screen.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_stateless.dart';
import 'package:panda_shop_app/common/widget/custom_appbar.dart';
import 'package:panda_shop_app/common/widget/custom_shape/circular_container.dart';
import 'package:panda_shop_app/common/widget/custom_shape/curved_edges.dart';
import 'package:panda_shop_app/common/widget/list/keep_alive_widget.dart';
import 'package:panda_shop_app/common/widget/toast/snackbar_widget.dart';
import 'package:panda_shop_app/data/model/chat_message.dart';
import 'package:panda_shop_app/features/main/controllers/test_chat_controller.dart';
import 'package:panda_shop_app/utils/constant/colors.dart';
import 'package:panda_shop_app/utils/constant/enums.dart';
import 'package:panda_shop_app/utils/constant/sizes.dart';
import 'package:panda_shop_app/utils/device/device_utility.dart';
import 'package:panda_shop_app/utils/extension/StringExtension.dart';

class TestChatScreen extends BaseScreen<TestChatController> {
  const TestChatScreen({super.key});

  @override
  Widget buildScreen(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return BaseScaffold(
      body: Stack(
        children: [
          Column(
            children: [
              /// Header
              ClipPath(
                clipper: CustomCurvedEdges(),
                child: HomeHeaderChat(vm),
              ),

              /// Chat Body
              Expanded(
                child: Obx(() => vm.messages.isNotEmpty
                    ? buildMessageList(context)
                    : buildEmptyChatPlaceholder(context, isDarkMode)),
              ),
            ],
          ),

          /// Input Bar
          Align(
            alignment: Alignment.bottomCenter,
            child: buildInputBar(context, isDarkMode),
          ),
        ],
      ),
    );
  }

  Widget buildMessageList(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      radius: const Radius.circular(8.0),
      thickness: 4.0,
      child: ListView.builder(
        shrinkWrap: true,
        reverse: true,
        padding: const EdgeInsets.only(
          top: ConstantSizes.sm,
          bottom: 100.0,
          left: ConstantSizes.sm,
          right: ConstantSizes.sm,
        ),
        itemCount: vm.messages.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final message = vm.messages[index];
          return KeepAliveWidget(
            child: buildMessageBubble(context, message),
          );
        },
      ),
    );
  }

  Widget buildMessageBubble(BuildContext context, ChatMessage message) {
    final isUser = message.isUser;
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: GestureDetector(
        onLongPress: message.isLoading.value
            ? null
            : () => copyToClipboard(message.text.value),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.symmetric(vertical: 4.0),
          decoration: BoxDecoration(
            color: isUser ? ConstantColors.primary : ConstantColors.grey,
            borderRadius: BorderRadius.circular(ConstantSizes.borderRadiusMd),
          ),
          child: Obx(() => renderMessageContent(context, message)),
        ),
      ),
    );
  }

  Widget renderMessageContent(BuildContext context, ChatMessage message) {
    if (message.isLoading.value) {
      // return const SizedBox(
      //   height: 20.0,
      //   width: 20.0,
      //   child: CircularProgressIndicator(
      //     strokeWidth: 2.0,
      //     color: ConstantColors.black,
      //   ),
      // );

      return const TypingIndicator();
    } else if (message.isTyping.value) {
      return LatexMarkdownRenderer(content: message.typingMessage.value);
    } else {
      return LatexMarkdownRenderer(content: message.text.value);
    }
  }

  Widget buildEmptyChatPlaceholder(BuildContext context, bool isDarkMode) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            width: 200,
            height: 200,
            AssetLotties.lottiePandaLaptop,
            fit: BoxFit.fitWidth,
            animate: true,
          ),
          const SizedBox(height: ConstantSizes.spaceBtwItems / 2),
          Text(
            "Hello ALTEK!",
            style: Theme.of(context).textTheme.titleMedium?.apply(
                color: isDarkMode ? ConstantColors.white : ConstantColors.black,
                fontSizeFactor: 0.8),
          ),
        ],
      ),
    );
  }

  Widget buildInputBar(BuildContext context, bool isDarkMode) {
    return SafeArea(
      bottom: true,
      child: Container(
        color:
            isDarkMode ? ConstantColors.backgroundDark : ConstantColors.white,
        padding: const EdgeInsets.all(ConstantSizes.xs),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: vm.textController,
                onChanged: (text) => vm.messageInput.value = text,
                decoration: InputDecoration(
                  hintText: 'Nội dung',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            Obx(() => IconButton(
                  onPressed: vm.messageInput.value.isNullEmptyOrWhitespace
                      ? null
                      : vm.sendMessage,
                  icon: const Icon(Icons.send),
                  color: getSendButtonColor(isDarkMode),
                )),
          ],
        ),
      ),
    );
  }

  Color getSendButtonColor(bool isDarkMode) {
    return vm.messageInput.value.isNullEmptyOrWhitespace
        ? isDarkMode
            ? ConstantColors.white.withOpacity(0.5)
            : ConstantColors.black.withOpacity(0.5)
        : isDarkMode
            ? ConstantColors.white
            : ConstantColors.black;
  }

  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text)).then((_) {
      SnackBarUtil.show("Đã copy", type: ToastType.success);
    });
  }
}

class HomeHeaderChat extends BaseStatelessWidget {
  const HomeHeaderChat(
    this.vm, {
    super.key,
  });

  final TestChatController vm;

  @override
  Widget buildWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return Container(
      color: ConstantColors.primary,
      padding: const EdgeInsets.all(0),
      child: SizedBox(
        height: 100 + DeviceUtils.getStatusBarHeight(context),
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: CircularContainer(
                backgroundColor: ConstantColors.white.withOpacity(0.2),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: CircularContainer(
                backgroundColor: ConstantColors.white.withOpacity(0.2),
              ),
            ),
            Positioned(
              top: 250,
              left: 0,
              child: CircularContainer(
                backgroundColor: ConstantColors.white.withOpacity(0.2),
              ),
            ),
            Column(
              children: [
                /// Cart
                HomeCartChat(vm),
                const SizedBox(height: ConstantSizes.spaceBtwSections / 2),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class HomeCartChat extends BaseStatelessWidget {
  const HomeCartChat(
    this.vm, {
    super.key,
  });

  final TestChatController vm;

  @override
  Widget buildWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return CustomAppbar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Good day for chat",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.apply(color: ConstantColors.textPrimary),
              maxLines: 1,
              overflow: TextOverflow.ellipsis),
          Text(
            "ALTEK",
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.apply(color: ConstantColors.textPrimary),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
      actions: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
                onPressed: vm.clearChat,
                icon: const FaIcon(FontAwesomeIcons.penToSquare),
                color: ConstantColors.black),
            SizedBox(width: ConstantSizes.xs),
            IconButton(
                onPressed: vm.notifyFeatureDeveloping,
                icon: const FaIcon(FontAwesomeIcons.alignRight),
                color: ConstantColors.black),
          ],
        )
        // Stack(
        //   children: [
        //     IconButton(
        //         onPressed: () => {},
        //         icon: const FaIcon(FontAwesomeIcons.bagShopping),
        //         color: ConstantColors.black),
        //     Positioned(
        //         right: 0,
        //         top: 4,
        //         child: Container(
        //             width: 18,
        //             height: 18,
        //             decoration: BoxDecoration(
        //                 color: ConstantColors.black.withOpacity(0.7),
        //                 borderRadius: BorderRadius.circular(100)),
        //             child: Center(
        //               child: Text(
        //                 "0",
        //                 style: Theme.of(context).textTheme.labelLarge?.apply(
        //                     color: ConstantColors.white, fontSizeFactor: 0.8),
        //               ),
        //             )))
        //   ],
        // )
      ],
    );
  }
}

class LatexMarkdownRenderer extends StatelessWidget {
  final String content;

  const LatexMarkdownRenderer({super.key, required this.content});

  List<InlineSpan> parseContent(BuildContext context, String content) {
    // Regex để tìm các đoạn LaTeX (bọc bởi $, \[ \], \( \))
    final latexRegex = RegExp(r"(\$.*?\$|\\\[.*?\\\]|\(.*?\))");
    final matches = latexRegex.allMatches(content);

    List<InlineSpan> spans = [];
    int lastIndex = 0;

    for (final match in matches) {
      // Phần nội dung trước đoạn LaTeX (Markdown)
      if (match.start > lastIndex) {
        spans.addAll(parseMarkdown(
          context,
          content.substring(lastIndex, match.start),
        ));
      }

      // Thêm đoạn LaTeX
      spans.add(buildMathSpan(context, match.group(0)!));
      lastIndex = match.end;
    }

    // Thêm phần còn lại (Markdown)
    if (lastIndex < content.length) {
      spans.addAll(parseMarkdown(context, content.substring(lastIndex)));
    }

    return spans;
  }

  List<InlineSpan> parseMarkdown(BuildContext context, String markdownContent) {
    // Sử dụng flutter_markdown để parse Markdown thành widget
    final document = md.Document();
    final parsedMarkdown = document.parseLines(markdownContent.split('\n'));

    return parsedMarkdown.map((node) {
      if (node is md.Element && node.tag == 'strong') {
        return TextSpan(
          text: node.textContent,
          style:
              defaultTextStyle(context).copyWith(fontWeight: FontWeight.bold),
        );
      } else if (node is md.Element && node.tag == 'em') {
        return TextSpan(
          text: node.textContent,
          style:
              defaultTextStyle(context).copyWith(fontStyle: FontStyle.italic),
        );
      } else if (node is md.Text) {
        return TextSpan(
          text: node.text,
          style: defaultTextStyle(context),
        );
      }
      return TextSpan(text: node.textContent, style: defaultTextStyle(context));
    }).toList();
  }

  InlineSpan buildMathSpan(BuildContext context, String rawMathContent) {
    final sanitizedContent = rawMathContent
        .replaceAll('\$', '')
        .replaceAll('\\[', '')
        .replaceAll('\\]', '')
        .replaceAll('\\(', '')
        .replaceAll('\\)', '');

    return WidgetSpan(
      alignment: PlaceholderAlignment.baseline,
      baseline: TextBaseline.alphabetic,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Math.tex(
          sanitizedContent,
          textStyle: defaultTextStyle(context),
          onErrorFallback: (err) => Container(
            color: Colors.red,
            child: Text(
              "Error: ${err.messageWithType}",
              style: const TextStyle(color: Colors.yellow),
            ),
          ),
        ),
      ),
    );
  }

  TextStyle defaultTextStyle(BuildContext context) {
    return Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(color: Colors.black, fontSize: 14) ??
        const TextStyle(fontSize: 16, color: Colors.black);
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: parseContent(context, content),
      ),
      textAlign: TextAlign.start,
    );
  }
}
