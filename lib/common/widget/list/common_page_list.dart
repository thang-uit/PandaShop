import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_stateless.dart';
import 'package:panda_shop_app/common/widget/list/paging/first_page_error.dart';
import 'package:panda_shop_app/common/widget/list/paging/new_page_error.dart';
import 'package:panda_shop_app/common/widget/list/paging/no_items_found.dart';
import 'package:panda_shop_app/common/widget/list/paging/no_more_items.dart';

class CommonPagedList<T> extends BaseStatelessWidget {
  const CommonPagedList({
    super.key,
    required this.pagingController,
    required this.itemBuilder,
    this.header,
    this.footer,
    this.noDataText,
  });

  final PagingController pagingController;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final Widget? header;
  final Widget? footer;
  final String? noDataText;

  @override
  Widget buildWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(
        () => pagingController.refresh(),
      ),
      child: CustomScrollView(
        key: const Key('common_list_view'),
        slivers: [
          if (header != null) SliverToBoxAdapter(child: header!),
          PagedSliverList(
            key: const Key('common_paged_list_view'),
            pagingController: pagingController,
            builderDelegate: PagedChildBuilderDelegate(
              animateTransitions: true,
              transitionDuration: const Duration(milliseconds: 500),

              itemBuilder: (context, item, index) =>
                  itemBuilder.call(context, item as T, index),
              firstPageErrorIndicatorBuilder: (_) => FirstPageError(
                pagingController.error,
                onTryAgain: () => pagingController.refresh(),
              ),
              newPageErrorIndicatorBuilder: (_) => NewPageError(
                pagingController.error,
                onTryAgain: () => pagingController.refresh(),
              ),
              noItemsFoundIndicatorBuilder: (_) => NoItemsFound(
                noDataText ?? "",
                onTryAgain: () => pagingController.refresh(),
              ),
              noMoreItemsIndicatorBuilder: (_) => const NoMoreItems(),
            ),
          ),
          if (footer != null) SliverToBoxAdapter(child: footer!),
        ],
      ),
    );
  }
}
