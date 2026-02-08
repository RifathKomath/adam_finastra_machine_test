import 'package:adam_finastra_machinetest/core/service/api.dart';
import 'package:adam_finastra_machinetest/core/service/urls.dart';
import 'package:adam_finastra_machinetest/shared/widgets/app_toast.dart';
import 'package:get/state_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../model/home/home_data_response.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getHomeData();
  }

  RxBool isLoading = false.obs;

  RxList<Category> categoryList = <Category>[].obs;
  RxList<Session> sessionList = <Session>[].obs;
  RxList<PopularCourse> popularCourseList = <PopularCourse>[].obs;
  RxList<TutorElement> tutorList = <TutorElement>[].obs;
  void getHomeData() async {
    try {
      isLoading.value = true;

      final response = await Api.call(endPoint: homeDataUrl);

      if (response.success) {
        final result = HomeDataResponse.fromJson(response.response).data;
        categoryList.value = result?.categories ?? [];
        sessionList.value = result?.sessions ?? [];
        popularCourseList.value = result?.popularCourses ?? [];
        tutorList.value = result?.tutors ?? [];
      } else {
        showToast("Error while loading data");
      }
    } catch (e) {
      print("Error while loading data $e");
    } finally {
      isLoading.value = false;
    }
  }

  void joinMeeting(String? meetingUrl) async {
    if (meetingUrl == null || meetingUrl.isEmpty) {
      showToast("Meeting link not available");
      return;
    }

    final uri = Uri.parse(meetingUrl);

    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      showToast("Unable to open meeting");
    }
  }
}
