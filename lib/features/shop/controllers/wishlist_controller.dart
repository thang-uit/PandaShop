import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_viewmodel.dart';
import 'package:panda_shop_app/common/widget/toast/snackbar_widget.dart';
import 'package:panda_shop_app/data/model/photo.dart';
import 'package:panda_shop_app/data/repositories/photo_repository.dart';
import 'package:panda_shop_app/data/services/api_exception.dart';
import 'package:panda_shop_app/utils/constant/enums.dart';

class WishlistController extends BaseViewModel with StateMixin<List<Photo>> {
  static WishlistController get instance => Get.find();

  final PhotoRepository photoRepository = PhotoRepository();
  late final PagingController<int, Photo> pagingController;

  // ===========================================================================

  @override
  void onInit() {
    super.onInit();

    pagingController = PagingController(firstPageKey: 1);
    pagingController.addPageRequestListener((page) {
      fetchPhoto(page: page);
    });
    pagingController.addStatusListener((status) {
      if (status == PagingStatus.firstPageError) {
        SnackBarUtil.show(
            "Lỗi tải dữ liệu. Không thể tải dữ liệu trang đầu tiên. Vui lòng thử lại.",
            type: ToastType.error);
      }
    });
  }

  @override
  void onClose() {
    pagingController.dispose();
    super.onClose();
  }

  void fetchPhoto({int page = 1, int limit = 20}) async {
    try {
      final response = await photoRepository.getPhotos(data: {
        '_page': page,
        '_limit': limit,
      });

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = response.data;
        final List<Photo> data =
            jsonData.map((item) => Photo.fromJson(item)).toList();

        final isLastPage = data.isEmpty || data.length < limit;
        if (isLastPage) {
          pagingController.appendLastPage(data);
        } else {
          pagingController.appendPage(data, page + 1);
        }

        change(
          (state ?? [])..addAll(data),
          status: data.isEmpty ? RxStatus.empty() : RxStatus.success(),
        );
      } else {
        SnackBarUtil.show("Không thể tải dữ liệu. Vui lòng thử lại.",
            type: ToastType.error);
      }
    } on DioError catch (e) {
      SnackBarUtil.show("Có lỗi xảy ra", type: ToastType.error);
      final ApiException apiException = ApiException.fromDioError(e);
      change(null, status: RxStatus.error(apiException.toString()));
    }
  }
}
